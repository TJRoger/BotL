//
//  DbHelper.swift
//  Bot L
//
//  Created by Roger Luo on 2020/12/28.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import RealmSwift

class DbHelper {
    static let shared = DbHelper()
    private init() {}
    
    
    func loadMessages() {
        let realm = try! Realm()
        let messages = realm.objects(RealmMessage.self)
        guard messages.count > 0 else {
            DataSource.messages = [
                Message(content: "I Love You", user: DataSource.secondUser),
                Message(content: "What's the meaning if I don't love you", user: DataSource.firstUser)
            ]
            return
        }
        DataSource.messages = messages.map({ (msg
        ) -> Message in
            let user = msg.user == DataSource.currentUser ? DataSource.firstUser : DataSource.secondUser
            return Message(content: msg.content, user: user)
        })
    }
    
    func save(_ msg: Message) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let realmMsg = RealmMessage()
                realmMsg.content = msg.content
                realmMsg.user = msg.user.name
                realmMsg.date = msg.date
                try! realm.write({
                    realm.add(realmMsg)
                })
            }
        }
    }
}
