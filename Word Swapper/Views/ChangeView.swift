//
//  ChangeView.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import SwiftUI

struct ChangeView: View {
    @Bindable var viewModel: WordSwapperViewModel
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                ForEach(viewModel.changes.indices, id: \.self) { i in 
                    SnippetComponent(change: viewModel.changes[i]) 
                }
            }
            .padding(6)
        }
    }
}
