//
//  DisplayResultView.swift
//  japanesekonbinisim
//
//  Created by Jeremy Liu on 10/15/23.
//

import SwiftUI

struct DisplayResultView: View {
    var resultIsCorrect: Bool
    
    var body: some View {
        let symbol = resultIsCorrect ? "✓" : "✘"
            
        if resultIsCorrect {
            Text("\(symbol)")
                .foregroundColor(.green)
        }
        else {
            Text("\(symbol)")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    VStack {
        DisplayResultView(resultIsCorrect: true).scaleEffect(10)
        Spacer()
        DisplayResultView(resultIsCorrect: false).scaleEffect(10)
    }
}
