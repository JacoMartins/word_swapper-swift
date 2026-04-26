//
//  ActionView.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import SwiftUI

struct ActionView: View {
    @Bindable var viewModel: WordSwapperViewModel
    
    var body: some View {
        GroupBox {
            HStack {
                TextField("Nome da música", text: $viewModel.songName)
                Spacer()
                Button("Adicionar edição", action: viewModel.addChange)
                    .buttonStyle(.bordered)
                Button("Aplicar", action: viewModel.apply)
                    .buttonStyle(.borderedProminent)
            }
            .padding(6)
        }
    }
}
