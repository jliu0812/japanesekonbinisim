//
//  japanesekonbinisimApp.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/1/23.
//

import SwiftUI
import SwiftData


@main
struct japanesekonbinisimApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [SimResult.self])
    }    
}
