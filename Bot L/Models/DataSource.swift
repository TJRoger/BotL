//
//  DataSource.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import RealmSwift

class DataSource {
    static let currentUser = "Tina"
    static let remoteUser = "L"
    static let  secondUser = User(name: remoteUser, avatar: remoteUser, isCurrentUser: false)
    static let firstUser = User(name: currentUser, avatar: currentUser, isCurrentUser: true)
    static var messages = [Message]()
    init() {
    }
}
