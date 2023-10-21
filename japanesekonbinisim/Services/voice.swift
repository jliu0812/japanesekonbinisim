//
//  voice.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/21/23.
//

import Foundation
import AVFoundation

let synthesizer = AVSpeechSynthesizer()
var utterance = AVSpeechUtterance(string: "")

func speak(phrase: String) {
    utterance = AVSpeechUtterance(string: phrase)
    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    synthesizer.speak(utterance)
}
