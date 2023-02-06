//
//  ContentView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

struct LiveView: View {
    //let livestream: LiveStream//livestream프로퍼티추가 json정보
    //이러면 이제 LiveView자식뷰들은 선언필요없이 LiveStream을 사용할수있게됨!
    @EnvironmentObject private var livestream:LiveStream
    @State var showingActionSheet = false
    var body: some View {
        //id 프로퍼티 추가로 따로 고유아이디넣어줄 필요없어짐livestream.products 뒤 , id: \.name 없앨수있음
        
        List{
            Button(action: {print("liveitem")}){
                Text("채널-").bold()+Text("전체장르")
            }.accentColor(.gray)
            ForEach(livestream.products){ product in
                NavigationLink(destination: LiveStreamView(product: product)){//이동하는 공간
                    ProductRow(product: product)//누르는 공간
                }
                
            }
            .navigationBarTitle("")
            
        }.listStyle(PlainListStyle())
        
        
    }
    
    struct LiveView_Previews: PreviewProvider {
        /*
         static var previews: some View {
         ContentView(livestream: LiveStream())
         
         }
         */
        //프리뷰 파일 만들어대체
        static var previews: some View {
            //Preview(source: LiveView(livestream: LiveStream()))
            //주의) 프리뷰는 LiveView의 자식뷰에 속하지 않으므로 별개로 인스턴스 만들어 전달해줘야함
            Preview(source: LiveView().environmentObject(LiveStream()))
        }
    }
    
    
}
