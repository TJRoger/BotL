//
//  Message.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import SwiftUI

struct Message: Hashable {
    var content: String
    var user: User
    var color: Color = Color.black
}
