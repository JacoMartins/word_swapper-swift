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
        VStack(alignment: .leading, spacing: 0) {
            // Horizontally resizable split view
            HSplitView {
                ChangeView(viewModel: viewModel)
                    .frame(idealWidth: 256)
                
                InputView(viewModel: viewModel)
            }
            .frame(maxHeight: .infinity)
            
            ActionView(viewModel: viewModel)
                .frame(height: 60)
        }
        .frame(minWidth: 350, minHeight: 200)
        .padding(8)
    }
}

#Preview {
    ContentView()
}
