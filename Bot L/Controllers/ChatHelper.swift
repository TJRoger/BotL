//
//  ChatHelper.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Combine

class ChatHelper: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var messages = DataSource.messages
    
    func sendMessage(_ chatMessage: Message) {
        messages.append(chatMessage)
        didChange.send(())
    }
}
