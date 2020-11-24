//
//  Voice.swift
//  Bot L
//
//  Created by Roger Luo on 2020/7/8.
//  Copyright © 2020 Roger Luo. All rights reserved.
//

import Foundation
import AVFoundation

class Voice {
    fileprivate var speechSynthesizer: AVSpeechSynthesizer
    fileprivate var speechUtterance: AVSpeechUtterance?
    let rate: Float
    let voice: AVSpeechSynthesisVoice
    
    init() {
        speechSynthesizer = AVSpeechSynthesizer()
        rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
        voice = AVSpeechSynthesisVoice(language: "zh-cn")!
//        speechUtterance = AVSpeechUtterance(string: <#T##String#>)
    }
    
    func speak(sentense: String) {
        speechUtterance = AVSpeechUtterance(string: sentense)
        speechUtterance?.voice = voice
        speechUtterance?.rate = rate
        speechSynthesizer.speak(speechUtterance!)
    }
}
