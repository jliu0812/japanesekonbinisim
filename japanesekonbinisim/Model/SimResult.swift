//
//  Result.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/7/23.
//
//

import Foundation
import SwiftData


@Model
final class SimResult: Identifiable {
    var id: String
    var userAnswer: Int
    var actualAnswer: Int
    var correct: Bool
    
    init(userAnswer: Int, actualAnswer: Int) {
        self.id = UUID().uuidString
        self.userAnswer = userAnswer
        self.actualAnswer = actualAnswer
        self.correct = userAnswer == actualAnswer
    }
}
