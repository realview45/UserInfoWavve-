//
//  Home.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import Foundation
import SwiftUI
struct Home: View {
    
    var body: some View {
        /*
        NavigationView{
            Image("SBS F!l")
            .navigationBarTitle("내비게이션 바 히든")
            .navigationBarHidden(true)
        }
        */
  
        let leadingItem = Button(action: {print("Leading item tapped")}){
            Image("wavve").resizable().scaledToFit().frame(width:100, height:100)//이미지크기변경
        }
        let trailingItem = Button(action: {print("Trailing item tapped")}){
            Image("live").resizable().scaledToFit().frame(width:70, height:70)//이미지크기변경
        }
        return NavigationView{
            
            NavigationLink(destination:Text( "Destination View")){
                Image("wavve").renderingMode(.original)
                    .navigationBarItems(leading: leadingItem, trailing: trailingItem)
            }
            .navigationBarTitle("")
            
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
