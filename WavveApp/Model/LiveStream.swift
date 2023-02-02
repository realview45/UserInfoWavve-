//
//  LiveStream.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import Foundation

final class LiveStream{
    var products: [Product]
    init(filename: String = "ProductData.json")
    {
        //BundleExtension에서 decode메서드생성
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
