//
//  Home.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/02.
//

import Foundation
import SwiftUI
struct Home: View {
    
    var body: some View {
        let leadingItem = Button(action: {print("Leading item tapped")}){
            Image("wavve").resizable().scaledToFit().frame(width:100, height:100)//이미지크기변경
        }
        let trailingItem = Button(action: {print("Trailing item tapped")}){
            Image("live").resizable().scaledToFit().frame(width:70, height:70)//이미지크기변경
        }
        return NavigationView{
            Image("wavve")
                .navigationBarItems(leading: leadingItem, trailing: trailingItem)
                .navigationBarTitle("내비게이션 바 아이템")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
