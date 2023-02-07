//
//  ContentRow.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/04.
//

import SwiftUI

struct ContentsRow: View {
    let contentt: Contentt
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                contentImage
            }//뷰의높이
        }.frame(height: 223)
    }
}

private extension ContentsRow{//확실히
    
    var contentImage: some View {
        ScrollView(.horizontal) {
            HStack{
                Text(contentt.cname)
                    .font(.headline)
                    .padding(.leading, 8)
                    .offset(x:-8, y:5)
                    .foregroundColor(.gray)
                Spacer()
            }

                NavigationView{
                   
                        if contentt.cname == "두근두근 Coming Soon!"{
                            HStack{
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name1)){
                                    Image(contentt.name1)
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .cornerRadius(9)
                                    
                                }
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name2)){
                                    Image(contentt.name2)
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .cornerRadius(9)
                                        
                              
                                }
                            }
                            .padding(0)
                        }
                        else{
                            HStack{
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name1)){
                                    Image(contentt.name1)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name2)){
                                    Image(contentt.name2)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name3)){
                                    Image(contentt.name3)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name4)){
                                    Image(contentt.name4)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                                NavigationLink(destination: ContentStreamView(contentt:contentt, namme: contentt.name5)){
                                    Image(contentt.name5)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                            }
                        
                    }
                }
            
        }.padding(7)
        
        
    }
    
    var contentDescription: some View {
        HStack{
            Button(action: {print("Button")}){
                Circle()
                    .frame(width:40, height: 40)
                    .overlay(Image(contentt.cname)
                        .resizable()
                        .scaledToFit())
            }
            .accentColor(.white)
            VStack(alignment: .leading){
                Text(contentt.cname)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(contentt.name1)
                    .font(.system(size:12))
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.gray)
                .frame(width:32,height:32)
        }
    }
}



struct ContentsRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentsRow(contentt: contentSamples[1])
    }
}
