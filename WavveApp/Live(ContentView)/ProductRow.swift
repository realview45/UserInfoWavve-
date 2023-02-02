//
//  SwiftUIView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                liveImage
                liveDescription
            }//뷰의높이
        }.frame(height: 200)
    }
}
private extension ProductRow{//확실히
    
    var liveImage: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .clipped()
    }
    var liveDescription: some View {
        HStack{
            Button(action: {print("Button")}){
                Circle()
                    .frame(width:40, height: 40)
                    .overlay(Image(product.name)
                        .resizable()
                        .scaledToFit())
            }
            .accentColor(.white)
            VStack(alignment: .leading){
                Text(product.name)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(product.description)
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


struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[1])
    }
}
