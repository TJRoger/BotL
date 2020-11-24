//
//  Bot.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/5.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol BotDelegate: AnyObject {
    func didReceive(reply: String)
}

struct TulingBody: Encodable {
    var reqType: Int
    var perception: Perception
    var userInfo: UserInfo
    
    init(text: String) {
        reqType = 0
        perception = Perception(inputText: InputText(text: text))
        userInfo = UserInfo()
    }
}

struct Perception: Encodable {
    var inputText: InputText
}

struct InputText: Encodable {
    var text: String
}

struct UserInfo: Encodable {
    let apiKey = "1d963dc48a4c4e2598da88ee38368a31"
    let userId = "Tina"
}

class Bot {
    weak var delegate: BotDelegate?
    let host = "https://openapi.tuling123.com/openapi/api/v2"
//    let voice = Voice()
    
    func asyncReply(for text: String) {
        weak var weakSelf = self
        let requestBody = TulingBody(text: text)
        AF.request(host,
                   method: .post,
                   parameters: requestBody,
                   encoder: JSONParameterEncoder.default)
            .response { response in
                guard response.data != nil else {
                    return
                }
                let json = try! JSON(data: response.data!)
                guard let result = json["results"][0]["values"]["text"].string else {
                    return
                }
                weakSelf?.delegate?.didReceive(reply: result)
//                weakSelf?.voice.speak(sentense: result)
        }
    }
    
    func constructMsg(for input: String) -> String {
        let body = TulingBody(text: input)
        let jsonData = try! JSONEncoder().encode(body)
        return String(data: jsonData, encoding: .utf8)!
    }
    
    func constructMsgData(for input: String) -> Data {
        let body = TulingBody(text: input)
        let jsonData = try! JSONEncoder().encode(body)
        return jsonData
    }
}
