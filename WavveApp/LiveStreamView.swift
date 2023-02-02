//
//  LiveStreamView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

struct LiveStreamView: View {
    let product: Product//채널정보 프로퍼티 선언
    var body: some View {
        VStack(spacing: 0){
            productImage//영상
            recommendView
        }
        .edgesIgnoringSafeArea(.top)
    }
}
//변수를 가장한 함수선언
private extension LiveStreamView {
    var productImage: some View{
        Image(self.product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width:250,height:250)
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
                Text("\(product.name)  \(product.description)\n").font(.title).fontWeight(.medium) + Text("22:00 ~22:50")
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
                    .offset(x:1,y:-7)
                Image(systemName: "calendar")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:25, height:25)
                    .offset(x:5,y:-6)
                Image(systemName: "play.rectangle.on.rectangle")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:30, height:26)
                    .offset(x:9,y:-6)
            }
        }
    }
    var sell: some View{
        VStack(spacing:15){
            Button(action: {print("Button")}){
                Text("             이용권 구매하기                ")
                    .font(.title).fontWeight(.medium)
                    .padding(7)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            .buttonStyle(PlainButtonStyle())
            HStack{
                Text("다음방송")
                VStack(alignment: .leading){
                    Text(" 꼬리에 꼬리를 무는 그날 이야기")
                    Text(" 22:50~23:45")
                }
                Spacer()
                Image(systemName: "clock")
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:25, height:25)
            }
            Spacer()
        }
        .padding(0)
    }
    var recommend: some View{
        VStack{
            HStack{
                
            }
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

struct LiveStreamView_Previews: PreviewProvider {
    static var previews: some View {
        LiveStreamView(product:productSamples[0])
    }
}
