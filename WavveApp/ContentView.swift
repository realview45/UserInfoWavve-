//
//  ContentView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProductRow()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProductRow: View {
    var body: some View {
        VStack(alignment: .leading){
            Image("imsolo")
                .resizable()
                .scaledToFill()
                .clipped()
            HStack{
                Button(action: {print("Button")}){
                    Circle()
                        .frame(width:40, height: 40)
                        .overlay(Image("sbsplus")
                            .resizable()
                            .scaledToFit())
                }
                .accentColor(.white)
                VStack(alignment: .leading){
                    Text("SBS Plus")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("나는SOLO")
                        .font(.system(size:12))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                    .frame(width:32,height:32)
            }
            
        }.frame(height: 150)//뷰의높이
    }
}
