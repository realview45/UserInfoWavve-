//
//  FavoriteButton.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/07.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var livestream: LiveStream

    @State private var showImage = false
    let namme: String
    private var imageNam: String {
        // if(contentIsFavorite1[namme] ?? false){
        dictIsF[namme] ?? false ? "heart.fill" : "heart"
        // }
        //product.isFavorite ? "heart.fill" : "heart"//즐겨찾기 여부에따라 심볼 변경
        
    }

    var body: some View {
                Image(systemName: imageNam)
                    .resizable()
                    .imageScale(.large)
                    .foregroundColor(Color.gray)
                    .frame(width:25, height:25)
                    .offset(y:-5)
                    .onTapGesture {
                        dictIsF[namme] = !(dictIsF[namme] ?? false)}
    }
}


// MARK: - Previews

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
      FavoriteButton(namme: "나혼자산다")
          .padding()
          .previewLayout(.sizeThatFits)
      /*
    Group {
      FavoriteButton(product: productSamples[0])
      FavoriteButton(product: productSamples[2])
    }
    .padding()
    //.previewLayout(.sizeThatFits)
  */
     }
}
