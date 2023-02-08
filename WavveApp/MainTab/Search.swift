//
//  Search.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/06.
//

import SwiftUI
struct Searchh: View {
    //State를 사용하여 계속주시
    @State var searchingFor = ""
    let conts = [
                 "나혼자산다",
                 "좋아하면 울리는 짝짝짝",
                 "법전",
                 "용감한 형사들2",
                 "꼬리에 꼬리를 무는 그날이야기",
                 "두뇌공조",
                 "법전",
                 "꼭두의 계절",
                 "그들이사는세상",
                 "너의 목소리가 들려",
                 "프라하의 여인",
                 "그겨울 바람이 분다",
                 "귓속말",
                 "트롤리",
                 "나쁜형사",
                 "애인있어요",
                 "우리가 만난 기적",
                 "내 연애의 모든 것"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results, id: \.self) { cont in
                    NavigationLink(destination: ContentStreamView(namme:cont)) {
                        Image(cont + "1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .frame(width:60)
                        Text(cont)
                    }
                }
            }
        }
        .searchable(text: $searchingFor) .navigationTitle("")
        
    }
    var results: [String] {
        if searchingFor.isEmpty {
            return conts
        }else {
            return conts.filter {
                $0.contains(searchingFor)
            }
        }
    }
    
    
    
}

/*
struct Search: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
*/
struct Searchh_Previews: PreviewProvider {
    static var previews: some View {
        Searchh()
    }
}

