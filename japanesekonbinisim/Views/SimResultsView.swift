//
//  SimResultView.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/14/23.
//
    
import SwiftUI
import SwiftData


struct SimResultsView: View {
    @State private var showingAlert = false
    @Environment(\.modelContext) private var context
    @Query private var allResults: [SimResult]
    
    var body: some View {
        
        VStack{
            Spacer()
            
            Text("Past Results")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            List(allResults) { result in
                
                VStack{
                    HStack {
                        
                        DisplayResultView(resultIsCorrect: result.correct)
                            .padding(.trailing, 5)
                            .scaleEffect(2)
                        
                        Group {
                            Button(action: {
                                speak(phrase: "\(result.userAnswer)")
                            }) {
                                Image(systemName: "speaker.wave.1")
                                    .aspectRatio(contentMode: .fit)
                                }.buttonStyle(.bordered)
                            Text("User: \(result.userAnswer)")
                        }
                        
                        
                        Spacer()
                        
                        if !(result.correct) {
                            Group {
                                Button(action: {
                                    speak(phrase: "\(result.actualAnswer)")
                                }) {
                                    Image(systemName: "speaker.wave.1")
                                        .aspectRatio(contentMode: .fit)
                                }.buttonStyle(.bordered)
                                Text("Actual: \(result.actualAnswer)")
                            }
                            
                        }
                    }
                }
            }
            
            Button(action: {
                showingAlert = true
            }) {
                Text("Clear All Results")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Clear Results"),
                    message: Text("Are you sure you want to clear all results?"),
                    primaryButton: .default(Text("Clear")) {
                        
                        for result in allResults {
                            context.delete(result)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    SimResultsView().modelContainer(previewContainer)
}
