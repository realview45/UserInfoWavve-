//
//  Preview.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/03.
//

import SwiftUI
struct Preview<V: View>: View {
    enum Device: String, CaseIterable {//프리뷰에서 사용할 기기목록
        case iPhone8 = "iPhone 8"
        case iPhone11 = "iPhone 11"
        case iPhone11Pro = "iPhone 11 Pro"
        case iPhone11ProMax = "iPhone 11 Pro Max"
    }
    let source: V
    var devices: [Device] = [.iPhone11Pro, .iPhone11ProMax, .iPhone8]
    var displayDarkMode: Bool = true//다크모드여부
    
    // MARK: Body
    
    var body: some View {
        return Group {
            ForEach(devices, id: \.self) {//반복문
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0])
                    .preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device: Device) -> some View {
        source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))//기기형태
            .previewDisplayName(device.rawValue)//프리뷰에 표시할 이름
    }
}


// MARK: - Previews

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Text("Hello, SwiftUI!"))
    }
}
/*
struct Preview: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
*/
