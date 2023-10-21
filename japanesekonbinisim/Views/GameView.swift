//
//  ContentView.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/1/23.
//

import SwiftUI
import Combine
import AVFoundation


struct GameView: View {
    @Environment(\.modelContext) private var context
    
    @State private var score = 0
    @State private var userAnswer = ""
    @State private var randomNumber = 0
    @State private var currentPrompt = ""
    @State private var shortPrompt = ""
    @State private var showHint = false
    @FocusState private var textFieldFocused: Bool

    func generateNewQuestion() {
        randomNumber = Int.random(in: 1..<10000)
        shortPrompt = "\(randomNumber)円です"
        currentPrompt = prompts.randomElement()!.replacingOccurrences(of: "X円", with: "\(randomNumber)円")
        userAnswer = ""
    }
    
    func checkAnswer() {
        hideKeyboard()
        context.insert(SimResult(userAnswer: Int(userAnswer)!, actualAnswer: randomNumber))
        
        if Int(userAnswer) == randomNumber {
            score += 1
        } else {
            score -= 1
        }
        generateNewQuestion()
    }
    
    func hideKeyboard() {
        textFieldFocused = false
    }
    
    var body: some View {
        
        ZStack {
//            Color("Background").edgesIgnoringSafeArea(.all)
            
            VStack {
                GroupBox(label:
                    Label("App Information", systemImage: "info.circle")
                ) {
                    List {
                        Text("Listen to the audio and enter the correct number.")
                        Text("Use the bigger button for the original prompt, and the smaller button for the quick prompt.")
                        Text("Please disable silent mode to hear the prompt.")
                        Text("Wait for a few seconds for the prompt to sound.")
                    }
                }.padding(.bottom, 10)
                
                HStack {
                    Button(action: {
                        speak(phrase: currentPrompt)
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .aspectRatio(contentMode: .fit)
                }
                    Button(action: {
                        speak(phrase: shortPrompt)
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.leading, 20.0)
                    .padding(.top, 40)
                }
                
                
                
                HStack {
                    
                    Button(action: {
                        showHint.toggle()
                    }) {
                        Text("Toggle Hint")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.green)
                    }
                    
                    if showHint {
                        Text("The answer is ¥\(randomNumber).")
                            .font(.subheadline)
                    }
                }
                
                
                
                TextField("Enter your answer", text: $userAnswer).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                    .onReceive(Just(userAnswer)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.userAnswer = filtered
                                    }
                                }
                    .focused($textFieldFocused)
                
                HStack {
                    Button(action: {
                        checkAnswer()
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .padding()
                    }
                    Button(action: {
                        hideKeyboard()
                    }) {
                        Text("Hide Keyboard")
                            .font(.headline)
                            .padding()
                    }
                    
                }
                
                Text("Score: \(score)")
                    .font(.headline)
                
                Button(action: {
                    generateNewQuestion()
                }) {
                    Text("Reset Question")
                        .font(.headline)
                        .padding()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                }
            }.onAppear{
                generateNewQuestion()
        }
        }
    }
    
    
}


#Preview {
    GameView()
    
}
