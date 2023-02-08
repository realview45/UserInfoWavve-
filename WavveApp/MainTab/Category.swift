//
//  Category.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/06.
//

import SwiftUI

struct Category: View {
    var arr = [["드라마", "예능", "영화", "해외시리즈"], ["ORIGINAL", "LIVE", "공개예정", ""], ["CLASSIC","인기 드라마", "인기 예능", "애니메이션"], ["키즈", "스포츠", "시사교양", "크리에이터"],["업데이트", "독점", "미드", "중드"], ["일드", "영드","대드","다큐"],["정주행 채널","지상파", "종편/보도", "홈쇼핑"],["드라마/예능","시사/교양", "영화/스포츠","키즈/애니"]]
    var a = false
    var body: some View {
        Section{
            VStack(alignment: .center){
                
                Text("추천메뉴").offset(x:-120)
                    .font(.title)
                    .bold()
                Spacer()
                ForEach(0..<7){
              
                    num2 in
                    HStack{
                        ForEach(0..<4){
                            num in
                            
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder().padding(3).overlay(Text(arr[num2][num]))
                            /*
                            Text(arr[num2][num])
                                .padding(22)
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        */
                             }
                    }
                    
                    Spacer()
                    
                    
                }
                Spacer()
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
