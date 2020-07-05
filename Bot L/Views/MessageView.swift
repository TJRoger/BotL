//
//  MessageView.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var checkedMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
//            let currentMessage = self.currentMessage
            if !checkedMessage.user.isCurrentUser {
                Image("L")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            
            ContentMessageView(contentMessage: checkedMessage.content, isCurrentUser: checkedMessage.user.isCurrentUser)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(checkedMessage: Message(content: "There are a lot of premium iOS templates on iosapptemplates.com", user: DataSource.secondUser))
    }
}
