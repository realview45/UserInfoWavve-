//
//  Popup.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/08.
//
import SwiftUI

enum PopupStyle {
  case none
  case blur
  case dimmed
}

// MARK: - Popup

fileprivate struct Popup<Message: View>: ViewModifier {
  let size: CGSize?
  let style: PopupStyle
  let message: Message
  
  init(
    size: CGSize? = nil,
    style: PopupStyle = .none,
    message: Message
  ) {
    self.size = size
    self.style = style
    self.message = message
  }

  func body(content: Content) -> some View {
    content
      .blur(radius: style == .blur ? 2 : 0)
      .overlay(Rectangle()
        .fill(Color.black.opacity(style == .dimmed ? 0.4 : 0)))
      .overlay(popupContent)
  }

  private var popupContent: some View {
    GeometryReader {
      VStack { self.message }
        .frame(width: self.size?.width ?? $0.size.width * 0.6,
               height: self.size?.height ?? $0.size.height * 0.25)
        .background(Color.primary.colorInvert())
        .cornerRadius(12)
        .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
        .overlay(self.checkCircleMark, alignment: .top)
    }
  }

  private var checkCircleMark: some View {
    Image(systemName: "checkmark.circle.fill")
      .font(Font.system(size: 60).weight(.semibold))
      .background(Color.white.scaleEffect(0.8))
      .offset(x: 0, y: -20)
  }
}


fileprivate struct PopupToggle: ViewModifier {
  @Binding var isPresented: Bool
  func body(content: Content) -> some View {
    content
      .disabled(isPresented)//팝업이 떠있는 동안 다른 뷰에 대한 상호작용 제거
      .onTapGesture { self.isPresented.toggle() }//팝업제거
  }
}

fileprivate struct PopupItem<Item: Identifiable>: ViewModifier {
  @Binding var item: Item?//nil이 아니면 팝업 표시 
  func body(content: Content) -> some View {
    content
      .disabled(item != nil)
      .onTapGesture { self.item = nil }
  }
}


// MARK: - View Extension

extension View {
  func popup<Content: View>(
    isPresented: Binding<Bool>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    @ViewBuilder content: () -> Content
  ) -> some View {
    if isPresented.wrappedValue {//nil이 아닐때만 팝업창 띄우기
      let popup = Popup(size: size, style: style, message: content())
      let popupToggle = PopupToggle(isPresented: isPresented)
      let modifiedContent = self.modifier(popup).modifier(popupToggle)
      return AnyView(modifiedContent)
    } else {
      return AnyView(self)
    }
  }
  
  func popup<Content: View, Item: Identifiable>(
    item: Binding<Item?>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    @ViewBuilder content: (Item) -> Content
  ) -> some View {
    if let selectedItem = item.wrappedValue {
      let content = content(selectedItem)
      let popup = Popup(size: size, style: style, message: content)
      let popupItem = PopupItem(item: item)
      let modifiedContent = self.modifier(popup).modifier(popupItem)
      return AnyView(modifiedContent)
    } else {
      return AnyView(self)
    }
  }
  
  func popupOverContext<Item: Identifiable, Content: View>(
    item: Binding<Item?>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    ignoringEdges edges: Edge.Set = .all,
    @ViewBuilder content: (Item) -> Content
  ) -> some View  {
    let isNonNil = item.wrappedValue != nil
    return ZStack {
      self
        .blur(radius: isNonNil && style == .blur ? 2 : 0)
      
      if isNonNil {
        Color.black
          .luminanceToAlpha()
          .popup(item: item, size: size, style: style, content: content)
          .edgesIgnoringSafeArea(edges)
      }
    }
  }
}

