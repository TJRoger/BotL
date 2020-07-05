//
//  DataSource.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation

class DataSource {
    static let  secondUser = User(name: "L", avatar: "L", isCurrentUser: false)
    static let firstUser = User(name: "Tina", avatar: "Tina", isCurrentUser: true)
    static var messages = [Message]()
    init() {
    }
}
