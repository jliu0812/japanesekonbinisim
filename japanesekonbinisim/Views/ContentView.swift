//
//  ContentView.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/1/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            GameView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Simulator")
                }
            
            SimResultsView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Results")
                }
            
        }
        .navigationTitle("Navigation")
    }
    }
       

#Preview {
    ContentView()
}
