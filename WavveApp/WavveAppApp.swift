//
//  WavveAppApp.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/02.
//

import SwiftUI

@main
struct WavveAppApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView에서 livestream프로퍼티 추가했으므로 여기서도 livestream돌려줘야함
            //LiveView(livestream: LiveStream())
            //Home(contentstream: ContentStream())
            MainTabView()
        }
    }
}
