//
//  InputView.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import SwiftUI

struct InputView: View {
    @Bindable var viewModel: WordSwapperViewModel
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Insira a letra da música desejada na caixa de texto abaixo")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 2)
                TextEditor(text: $viewModel.lyrics)
                    .frame(minHeight: 100, maxHeight: 256)
                    .font(.body)
            }
            .padding(6)
        }
    }
}
