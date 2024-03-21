//
//  ContentView.swift
//  TypewiterEffect SearchBar
//
//  Created by Anurag Pandit on 21/03/24.
//

import SwiftUI

struct SearchViewWithAnimation: View {
    @State var placeholder: String = "Search Pizza 🍕 in the menu"
    @State var animatePlaceHolder: String = ""
    @State var indexPosition = 0
    @State var timeInternval: TimeInterval = 0.2
    @State var searchText: String = ""
    @State private var isPlaceholderDisplayed = false
    @State private var displayedCount = 0
    var body: some View {
        NavigationStack {
            Text("\(searchText)")
                .navigationTitle("Animating Placeholder")
                .font(.system(size: 10))
        }
        .searchable(text: $searchText, prompt: animatePlaceHolder)
        .onAppear(perform: {
            startAnimating()
        })
    }
    
    private func startAnimating() {
        Timer.scheduledTimer(withTimeInterval: timeInternval, repeats: true) { timer in
            if indexPosition < placeholder.count , !isPlaceholderDisplayed {
                animatePlaceHolder += String(placeholder[placeholder.index(placeholder.startIndex,
                                                                           offsetBy: indexPosition)])
                indexPosition += 1
                isPlaceholderDisplayed = indexPosition == placeholder.count
                print(animatePlaceHolder)
            } else if displayedCount == 3 {
                timer.invalidate()
            } else if indexPosition > "".count {
                animatePlaceHolder = String(animatePlaceHolder.dropLast())
                indexPosition = indexPosition - 1
                print(animatePlaceHolder)
            } else if indexPosition == 0 {
                isPlaceholderDisplayed = false
                displayedCount += 1
            }
        }
    }
}

#Preview {
    SearchViewWithAnimation()
}
