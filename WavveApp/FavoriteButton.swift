//
//  FavoriteButton.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/07.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var livestream: LiveStream
    let product: Product
    
    private var imageNam: String {
        product.isFavorite ? "heart.fill" : "heart"//즐겨찾기 여부에따라 심볼 변경
    }
    
    var body: some View {
        /*
        Button(action: { self.livestream.toggleFavorite(of: self.product)}) {
            Image(systemName: imageNam)
                .imageScale(.large)
                .frame(width: 32, height: 32)
            //.onTapGesture { self.livestream.toggleFavorite(of: self.product) }
            
        }
         */
        Image(systemName: imageNam)
            .imageScale(.large)
            .frame(width: 32, height: 32)
            //onTapGesture는 내비게이션 링크나 버튼보다 터치에 대한 우선권을 가짐
            .onTapGesture { self.livestream.toggleFavorite(of: self.product) }
    }
}


// MARK: - Previews

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
      FavoriteButton(product: productSamples[0])
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
