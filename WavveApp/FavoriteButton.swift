//
//  FavoriteButton.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/07.
//

import SwiftUI
class ObservableDict: ObservableObject {
    //@Published var list: [String] = []
    @Published var dictIs: [String: Bool] = [:]
}
struct FavoriteButton: View {
    @EnvironmentObject private var livestream: LiveStream
    @ObservedObject var dictIsFav = ObservableDict()
    
    let namme: String
    private var imageNam: String {
        
        // if(contentIsFavorite1[namme] ?? false){
        dictIsFav.dictIs[namme] ?? false ? "heart.fill" : "heart"
        // }
        //product.isFavorite ? "heart.fill" : "heart"//즐겨찾기 여부에따라 심볼 변경
        
    }

    var body: some View {
        /*
        Button(action: {
            contentIsFavorite1[namme] = !(contentIsFavorite1[namme] ?? false)
            /*self.livestream.toggleFavorite(of: self.product)*/}) {
            Image(systemName: imageNam)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .onTapGesture { contentIsFavorite1[namme] = !(contentIsFavorite1[namme] ?? false)}//self.livestream.toggleFavorite(of: self.product) }
            
        }
         */
        Image(systemName: imageNam)
            .resizable()
            .imageScale(.large)
            .foregroundColor(Color.gray)
            .frame(width:25, height:25)
            .offset(y:-6)
            //.imageScale(.large)
            //.frame(width: 32, height: 32)
            //onTapGesture는 내비게이션 링크나 버튼보다 터치에 대한 우선권을 가짐
            .onTapGesture { dictIsFav.dictIs[namme] = !(dictIsFav.dictIs[namme] ?? false)}//self.livestream.toggleFavorite(of: self.product) }
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
