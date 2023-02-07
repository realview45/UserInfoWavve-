//
//  ContentStream.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/04.
//

import Foundation

final class ContentStream{
    var contents: [Contentt]
    init(filename: String = "ContentsData.json")
    {
        //BundleExtension에서 decode메서드생성
        self.contents = Bundle.main.decode(filename: filename, as: [Contentt].self)
    }
}
