//
//  ContentView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    let livestream: LiveStream//livestream프로퍼티추가
    var body: some View {
        //id 프로퍼티 추가로 따로 고유아이디넣어줄 필요없어짐livestream.products 뒤 , id: \.name 없앨수있음
        NavigationView{
            List(livestream.products){ product in
                NavigationLink(destination: Text("채널 영상")){
                    ProductRow(product: product)
                }
            }
            .navigationBarTitle("Wavve")
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(livestream: LiveStream())
    }
}


