//
//  CompletedMessage.swift
//  WavveApp
//
//  Created by 김진경 on 2023/02/08.

import SwiftUI

struct CompletedMessage: View {
    var body: some View {

            Text("시청 완료!")
                .font(.system(size: 24))
                .bold()
                .kerning(2)

    }
}


// MARK: - Previews

struct CompletedMessage_Previews: PreviewProvider {
  static var previews: some View {
    Color.primary.colorInvert()
      .popup(isPresented: .constant(true)) { CompletedMessage() }
      .edgesIgnoringSafeArea(.vertical)
  }
}

