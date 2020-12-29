//
//  Message.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift

struct Message: Hashable {
    dynamic var content: String
    dynamic var user: User
    dynamic var color: Color = Color.black
    var date: Date = Date()
}

class RealmMessage: Object {
    @objc dynamic var content: String = ""
    @objc dynamic var user: String = ""
    @objc dynamic var date: Date = Date()
}
