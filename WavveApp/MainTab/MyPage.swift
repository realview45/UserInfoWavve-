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
    //Section(header: Text("주문 정보").fontWeight(.medium)){
    Section{//다른메뉴와 구분
        NavigationLink(destination: Text("이용권내역")){//임시 목적지
            Text("나의 이용권")
        }
        .frame(height: 44)//높이 지정
        NavigationLink(destination: Text("내 취향")){//임시 목적지
            Text("내 취향 확인해보기")
        }
        .frame(height: 44)
        NavigationLink(destination: Text("시청내역")){//임시 목적지
            Text("전체 시청내역")
        }
        .frame(height: 44)
        NavigationLink(destination: Text("하트프로그램")){//임시 목적지
            Text("관심 프로그램")
        }
        .frame(height: 44)
        NavigationLink(destination: Text("하트영화")){//임시 목적지
            Text("관심 영화")
        }
        .frame(height: 44)
       
        NavigationLink(destination: Text("하트에디터Pick")){//임시 목적지
            Text("관심 에디터Pick")
        }
        .frame(height: 44)
    }

        
}


struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage()
    }
}
