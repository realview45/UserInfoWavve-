//
//  ContentView.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
                Image("imsolo")
                      .resizable()
                      .scaledToFill()
                      .clipped()
            HStack{
                Button(action: {print("Button")}){
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width:40, height: 40)
                        .overlay(Image("sbsplus")
                          .resizable()
                          .scaledToFit())
                }
                VStack{
                    Text("SBS Plus")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("나는SOLO")
                }
            }
                HStack{EmptyView()}//가격 찜 장바구니
            
        }.frame(height: 150)//뷰의높이
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
