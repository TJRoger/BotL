//
//  ChatView.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        DbHelper.shared.loadMessages()
    }
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chatHelper.messages, id: \.self) { msg in
                        MessageView(checkedMessage: msg)
                    }
                }
                .padding(0)
                
                HStack {
                    TextField("Message...", text: $typingMessage)
                        
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    
                    Button(action: sendMessage) {
                        Text("Send")
                            .padding(4)
                    }
                    .disabled(typingMessage == "")
                }
                
            }
        .keyboardAware()
            .navigationBarTitle(Text(DataSource.secondUser.name), displayMode: .inline)
        }
    }

    func sendMessage() {
        guard "" != typingMessage else {
            return
        }
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.firstUser))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
