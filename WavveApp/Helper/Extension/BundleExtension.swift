//
//  BundleExtension.swift
//  WavveApp
//
//  Created by 이인희 on 2023/02/02.
//

import Foundation
//파일명을 전달받으면 JSON구조의 데이터를 Foundation프레임워크에서 사용할수있는 타입으로 변환하는 기능을 함
extension Bundle {
    //파일명을 받아 url을 받아 decodedData로 복호화
    func decode<T: Decodable>(filename: String, as type: T.Type)->T{
        guard let url = self.url(forResource: filename, withExtension:nil)else{//파일위치찾기
            fatalError("번들에 \(filename)이 없습니다.")
        }
        guard let data = try? Data(contentsOf: url) else {//해당위치파일 data로 초기화
            fatalError("\(url)로부터 데이터를 불러올 수 없습니다.")
        }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data)
        else{
            fatalError("데이터 복호화에 실패했습니다.")
        }
        return decodedData
    }
}
