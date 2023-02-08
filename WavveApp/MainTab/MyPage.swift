//
//  MyPage.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/06.
//

import SwiftUI

struct MyPage: View {
    var body: some View {
        NavigationView{
            
            Form{//마이페이지 메뉴 그룹화
                favoriteInfoSection
                
            }
            .navigationBarTitle("")
        }
    }
}

var favoriteInfoSection: some View {
    //Section(header: Text("주Z문 정보").fontWeight(.medium)){
    
    Section{
        
        //다른메뉴와 구분
        NavigationLink(destination: MyPageA()){//목적지
            Text("나의 이용권")//지금보이는 곳(클릭할곳)
        }
        .frame(height: 44)//높이 지정
        NavigationLink(destination: MyPageB()){
            Text("내 취향 확인해보기")
        }
        .frame(height: 44)
        
        
        /*
         NavigationLink(destination: Text("하트영화")){
         Text("관심 영화")
         }
         .frame(height: 44)
         
         NavigationLink(destination: Text("하트에디터Pick")){//임시 목적지
         Text("관심 에디터Pick")
         }
         */
        .frame(height: 44)
        
        
        FavoriteContent(showingImage: .constant(true))
            .offset(x:-17).frame(height:270)
        
        WatchedContent(showingImage: .constant(true))
            .offset(x:-17).frame(height:270).padding(.bottom, 10)
        
    }
        
}


struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage()
    }
}
