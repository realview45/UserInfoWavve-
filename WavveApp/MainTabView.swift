//
//  MainTabView.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/06.
//

import SwiftUI

struct MainTabView: View {
    private enum Tabs{
        case homeTab, categoryTab, searchTab, myPageTab
    }
    @State private var selectedTab: Tabs = .homeTab//기본값 홈
    var body: some View {
        TabView(selection: $selectedTab){
            Group {
                homeTab
                categoryTab
                searchTab
                myPageTab
            }
        }
        .accentColor(.indigo)//탭 아이콘색깔
        //.edgesIgnoringSafeArea(.top) //ios 13.3이하
    }
}

fileprivate extension View {
    func tabItem(image: String, text: String) -> some View {
        self.tabItem {
            Image(systemName: image)
                .font(Font.system(size: 17,weight: .light))
            Text(text)
        }
    }
}
private extension MainTabView{
    var homeTab: some View{
        Home(contentstream: ContentStream())
            .tag(Tabs.homeTab)
            .tabItem(image: "house", text: "홈")
            .onAppear{UITableView.appearance().separatorStyle = .none}//리스트 사이 선 제거
    }
    var categoryTab: some View{
        Category()
            .tag(Tabs.categoryTab)
            .tabItem(image: "line.3.horizontal", text: "카테고리")
    }
    var searchTab: some View{
        Search()
            .tag(Tabs.categoryTab)
            .tabItem(image: "magnifyingglass", text: "탐색")
    }
    var myPageTab: some View{
        MyPage()
            .tag(Tabs.categoryTab)
            .tabItem(image: "person", text: "마이페이지")
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
