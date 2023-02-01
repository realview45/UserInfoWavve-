//
//  Color Extension.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//
import SwiftUI
import Foundation
extension Color {//(생성자)
    static let peach = Color ("bluue")//앱에서 사용할 메인 색
    static let primaryShadow = Color.primary.opacity(0.2)//그림자에 사용할 색
    static let secondaryText = Color(hex: "#6e6e6e")//얘를 위해서
    static let background = Color(UIColor.systemGray6)
}
extension Color {//얘를 추가(생성자)
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
