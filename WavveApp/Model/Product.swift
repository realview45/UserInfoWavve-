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
    var isFavorite:Bool = false
    var isWatched:Bool = false
}

extension Product: Decodable {}
extension Product: Identifiable {}//프로토콜 채택
extension Product: Equatable {}

let productSamples = [
    Product(name: "SBS Plus", imageName: "imsolo", description: "나는솔로", isFavorite: true, isWatched: false),
    Product(name: "SBS F!l", imageName: "runningman", description: "수합의 정석", isFavorite: true, isWatched: false),

]

