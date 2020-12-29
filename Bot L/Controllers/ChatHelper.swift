//
//  ChatHelper.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Combine
import Foundation

class ChatHelper: ObservableObject, BotDelegate {

    var bot: Bot
    let voice: Voice
    var didChange = PassthroughSubject<Void, Never>()
    @Published var messages = DataSource.messages
    
    init() {
        bot = Bot()
        voice = Voice()
        bot.delegate = self
    }
    
    func didReceive(reply: String) {
        let msg = Message(content: reply, user: DataSource.secondUser, color: .orange)
        messages.append(msg)
        didChange.send(())
        voice.speak(sentense: reply)
        DbHelper.shared.save(msg)
    }
    
    func sendMessage(_ chatMessage: Message) {
        messages.append(chatMessage)
        bot.asyncReply(for: chatMessage.content)
        didChange.send(())
        DbHelper.shared.save(chatMessage)
    }
}

