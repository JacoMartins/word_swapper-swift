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
            VStack(alignment: .leading, spacing: 8) {
                Text("Insira a letra da música desejada na caixa de texto abaixo")
                    .font(.system(size: 18, weight: .semibold))
                
                TextEditor(text: $viewModel.lyrics)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.body)
            }
            .padding(6)
        }
        .frame(idealWidth: 450, maxHeight: .infinity)
    }
}
