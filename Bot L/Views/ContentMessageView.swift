//
//  ContentMessageView.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    static let backgroundColorForOthers: Color = Color(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, opacity: 1.0)
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(
                isCurrentUser ? Color.white : Color.black
            )
            .background(
                isCurrentUser ? Color.blue : Self.backgroundColorForOthers)
            .cornerRadius(10)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hi, I am your boyfriend.", isCurrentUser: false)
    }
}
