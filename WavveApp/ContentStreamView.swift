//
//  ContentStreamView.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/04.
//

import SwiftUI

struct ContentStreamView: View {
    @EnvironmentObject private var livestream: LiveStream
    let contentt:Contentt//채널정보 프로퍼티 선언
    
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @State private var showingPopup: Bool = false
    
    let namme: String
    var body: some View {
        VStack(spacing: 0){
            productImage//영상
            recommendView
        }
        //.edgesIgnoringSafeArea(.top)
    }
}
//변수를 가장한 함수선언
private extension ContentStreamView {
    var productImage: some View{
        Image(self.namme+"1")//가로사진
            .resizable()
            .scaledToFill()
            .frame(width:150,height:222)
    }
    var recommendView: some View{
        GeometryReader{
            VStack(alignment:.leading){
   
                self.liveDescriptionTime
                Spacer()
                self.sell
                self.recommend
            }
            .frame(height: $0.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y:-5)
        }
    }
    var liveDescriptionTime: some View{
        VStack(alignment: .leading, spacing:22){
            HStack{
                //설명, 시간
                Text("\(namme)\n").font(.title).fontWeight(.medium).foregroundColor(.gray) + Text("시즌 1개").foregroundColor(.gray)
                Spacer()
            }
            HStack{
                //하트
                Image(systemName: "heart")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:25, height:25)
                    .offset(y:-6)
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:25, height:25)
                    .offset(x:10,y:-7)

                Image(systemName: "play.rectangle.on.rectangle")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:30, height:26)
                    .offset(x:22,y:-6)
            }
        }
    }
    var sell: some View{
        VStack(spacing:15){
            //에피소드 보기를 클릭하면 시청 중 내역으로 뜨게 할거임
            //showingAlert true만드는순간 alert
            Button(action: {
                self.showingAlert = true
              }){
                Text("                          에피소드 보기                                ")
                    .fontWeight(.light)
                    .padding(7)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    .foregroundColor(.gray)
            }
            .buttonStyle(PlainButtonStyle())
            .popup(isPresented: $showingPopup){ CompletedMessage() }//시청완료메시지
            .edgesIgnoringSafeArea(.top)
            .alert(isPresented: $showingAlert) { confirmAlert }
        }
        .padding(0)
        
    }
    var confirmAlert: Alert {
      Alert(
        title: Text(""),
        //message: Text("\(product.name)을(를) \(quantity)개 구매하시겠습니까?"),
        message: Text("을(를) 개 구매하시겠습니까?"),
        primaryButton: .default(Text("확인"), action: {
          self.placeOrder()
        }),
        secondaryButton: .cancel(Text("취소"))
      )
    }
    func placeOrder() {
      //store.placeOrder(product: product, quantity: quantity)
      showingPopup = true
    }
    var recommend: some View{
        VStack{
            HStack{
                Text("\n")
                Button(action: {print("Button")}){
                    Text("에피소드")
                }.accentColor(.gray)
                Spacer()
                Button(action: {print("Button")}){
                    Text("관련영상")
                }.accentColor(.gray)
                Spacer()
                Button(action: {print("Button")}){
                    Text(" 추천    ")
                   
                }.accentColor(.gray)
            }
            List{
                ForEach(0..<10){num in
                    Button(action: {print("Button")}){
                        Image(self.namme+"1")//가로사진
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width:500,height:180)
                    }
                    Text("\(480-num)회")
                }
            }.listStyle(.plain)
            Spacer()
        }
        
    }
    // MARK: Computed Values
    //긴문장을 나눠주는 역할
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
        ?? text[centerIdx...].firstIndex(of: " ")
        ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}

struct ContentStreamView_Previews: PreviewProvider {
    static var previews: some View {
        ContentStreamView(contentt: contentSamples[0], namme: "나혼자산다")
    }
}
