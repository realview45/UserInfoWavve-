//
//  Product.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import Foundation
struct Product{
    let id: UUID = UUID()//identifiable 프로토콜 준수를 위한 식별자 id 프로퍼티 추가 UUID란 네트워크 상에서 고유성이 보장되는 id
    let name:String
    let imageName:String
    let description:String
    var isFavorite:Bool=false
}

extension Product: Decodable {}
extension Product: Identifiable {}//프로토콜 채택

let productSamples = [
    Product(name: "SBS Plus", imageName: "imsolo", description: "나는솔로", isFavorite: true),
    Product(name: "SBS F!l", imageName: "runningman", description: "수합의 정석", isFavorite: true),
   
    Product(name: "MBC 무한도전", imageName: "infinitechallenge", description: "무한택배 마지막, 박명수는 어떤가요!"),
    Product(name: "IHQ 맛있는녀석들", imageName: "deliciousguys", description: "맛있는 녀석들 308회"),
    Product(name: "MBC Every1", imageName: "radiostar", description: "라디오스타 578회"),
    Product(name: "KBS 1박2일", imageName: "1night2days", description: "이동수단 복불복 - 제주도 우도(1)", isFavorite: true),
    Product(name: "MBC 나혼자산다", imageName: "homealone", description: "나혼자산다 470회"),

]

