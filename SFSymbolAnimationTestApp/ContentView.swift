//
//  ContentView.swift
//  SFSymbolAnimationTestApp
//
//  Created by David Deller on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var startTime = Date()
    @State private var count = 0
    
    var elapsedTime: Duration {
        .seconds(Date.now.timeIntervalSince(startTime))
    }
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            List {
                ForEach(1..<100) { num in
                    row(num: num)
                }
            }
            
            VStack {
                VStack(spacing: 10) {
                    Text(elapsedTime.formatted())
                    Text(String(count))
                    ProgressView(value: Double(count % 4), total: Double(3))
                }
                .monospacedDigit()
                .padding()
                
                List {
                    ForEach(1..<100) { num in
                        Text("Text")
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            Task.detached {
                DispatchQueue.main.async {
                    count += 1
                }
            }
        }
    }
    
    @ViewBuilder
    func row(num: Int) -> some View {
        HStack {
            Text("Row " + String(num))
            
//            let condition = num == 20
            let condition = num % 20 == 0
            
            if condition {
                Image(systemName: "speaker.wave.3")
                    .foregroundStyle(Color.accentColor)
                    // Comment out .symbolEffect and it works as expected
                    .symbolEffect(.variableColor.iterative.dimInactiveLayers.nonReversing, options: .repeat(.continuous))
                    .accessibilityLabel("currently playing")
            }
        }
    }
}

#Preview {
    ContentView()
}
