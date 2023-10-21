//
//  PreviewSimResults.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/14/23.
//

import SwiftUI
import SwiftData


let sampleData: [SimResult] = [
    SimResult(userAnswer: 1, actualAnswer: 2),
    SimResult(userAnswer: 42, actualAnswer: 42),
    SimResult(userAnswer: 123, actualAnswer: 321),
    SimResult(userAnswer: 123, actualAnswer: 123),
    SimResult(userAnswer: 5325, actualAnswer: 2312),
]


@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: SimResult.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        for item in sampleData {
            container.mainContext.insert(item)
        }
        return container
    } catch {
        fatalError(":(")
    }
}()
