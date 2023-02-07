//
//  Content.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/04.
//

import Foundation
struct Contentt{
    let id: UUID = UUID()//identifiable 프로토콜 준수를 위한 식별자 id 프로퍼티 추가 UUID란 네트워크 상에서 고유성이 보장되는 id
    let cname:String
    let name1:String
    let name2:String
    let name3:String
    let name4:String
    let name5:String
}

extension Contentt: Decodable {}
extension Contentt: Identifiable {}//프로토콜 채택
extension Contentt: Equatable {}

let contentSamples = [//리스트정의
    Contentt(cname: "실시간 인기 콘텐츠", name1: "나혼자산다", name2: "좋아하면 울리는 짝짝짝", name3: "법전", name4: "용감한 형사들2", name5: "꼬리에 꼬리를 무는 그날이야기"),
    Contentt(cname: "두근두근 Coming Soon!", name1: "더 시즌스 - 박재범의 드라이브", name2: "파트너20", name3: "북유럽꼬임일기", name4: "애상맹면대인", name5: "섹스 라이브즈 오브 칼리지 걸스 시즌2"),
]
