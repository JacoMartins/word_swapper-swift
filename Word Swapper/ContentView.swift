//
//  ContentView.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = WordSwapperViewModel()
    
    var body: some View {
        VStack {
            InputView(viewModel: viewModel)
            ChangeView(viewModel: viewModel)
            ActionView(viewModel: viewModel)
        }
        .padding(8)
    }
}

#Preview {
    ContentView()
}
