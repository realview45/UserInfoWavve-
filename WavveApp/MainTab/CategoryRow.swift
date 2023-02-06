//
//  CategoryRow.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/06.
//

import SwiftUI

struct CategoryRow: View {
    let Categoriess = [ "추천메뉴", "방송", "해외시리즈", "영화", "Live"]
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                /*
                ForEach(Categoriess){ String in
                    
                    
                }
                 */
            }//뷰의높이
        }.frame(height: 223)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
