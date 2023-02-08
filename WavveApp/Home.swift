//
//  Home.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import Foundation
import SwiftUI
struct Home: View {
    let contentstream: ContentStream
    @State var showingActionSheet = false
    @State private var showingFavoriteImage: Bool = true
    var body: some View {
        /*
         NavigationView{
         Image("SBS F!l")
         .navigationBarTitle("내비게이션 바 히든")
         .navigationBarHidden(true)
         }
         */
        let leadingItem1 = Button(action: {print("Leading item tapped")}){
            Image("wavve").resizable().scaledToFit().frame(width:100, height:100)//이미지크기변경
        }
        let trailingItem1 = Button(action: {print("Trailing item tapped")}){
            
            //NavigationLink(destination: LiveView(livestream: LiveStream())){//이동하는 공간
            NavigationLink(destination: LiveView()){//이동하는 공간
                //environment변수로 바꿔서 변수전달 필요없음
                //누르는 공간
                Image("live").resizable().scaledToFit().frame(width:70, height:70)//이미지크기변경
            }
        }
        return NavigationView{
            VStack(spacing: 0){
                List{
                    watchedContentss.offset(x:-11,y:38)
                    /*
                     Button(action: {print("contentitem")}){
                     Text("Wavve")
                     }.accentColor(.gray)
                     */
                    ForEach(contentstream.contents){ contentt in
                        /*
                         NavigationLink(destination: ContentStreamView(content: content)){//이동하는 공간
                         //누르는 공간
                         }
                         */
                        ContentsRow(contentt: contentt)
                    }
                    .navigationBarItems(leading: leadingItem1, trailing: trailingItem1)
                    .navigationBarTitle("")
                    
                }.listStyle(PlainListStyle()).frame(height:830)
            }
        }
        
    }
}
private extension Home {

    var watchedContentss: some View {
        //WatchedContent()
      WatchedContent(showingImage: $showingFavoriteImage)
        .padding(.top, 24)
        .padding(.bottom, 8)
        .padding(.leading, 0)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //source없이 그냥넘기면 무한루프걸림
        Preview(source: Home(contentstream: ContentStream()))
        //Home(contentstream: ContentStream())
    }
}
