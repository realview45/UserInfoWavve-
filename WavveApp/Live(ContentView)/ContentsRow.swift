//
//  ContentRow.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/04.
//

import SwiftUI

struct ContentsRow: View {
    let content: Content
    
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
                Text(content.cname)
                    .font(.headline)
                    .padding(.leading, 8)
                    .offset(y:10)
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack{
                NavigationView{
 
                    NavigationLink(destination: ContentStreamView(content:content)){
                        Image(content.name1)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                        Image(content.name2)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                        Image(content.name3)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                        Image(content.name4)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                        Image(content.name5)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                /*
                 
                 Image(content.name2)
                 .resizable()
                 .scaledToFill()
                 .clipped()
                 .cornerRadius(10)
                 Image(content.name3)
                 .resizable()
                 .scaledToFill()
                 .clipped()
                 .cornerRadius(10)
                 Image(content.name4)
                 .resizable()
                 .scaledToFill()
                 .clipped()
                 .cornerRadius(10)
                 Image(content.name5)
                 .resizable()
                 .scaledToFill()
                 .clipped()
                 .cornerRadius(10)
                 */
            }
        }.padding(7)
        
        
    }
    
    var contentDescription: some View {
        HStack{
            Button(action: {print("Button")}){
                Circle()
                    .frame(width:40, height: 40)
                    .overlay(Image(content.cname)
                        .resizable()
                        .scaledToFit())
            }
            .accentColor(.white)
            VStack(alignment: .leading){
                Text(content.cname)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(content.name1)
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
        ContentsRow(content: contentSamples[0])
    }
}
