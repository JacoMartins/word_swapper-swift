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
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Adicionar edições:")
                        .font(.headline)
                    
                    // Input fields for NEW changes
                    SnippetComponent(
                        original_snippet: $viewModel.originalSnippet,
                        modified_snippet: $viewModel.modifiedSnippet
                    )
                    
                    // List of EXISTING editable changes
                    if !viewModel.changes.isEmpty {
                        Divider()
                        
                        Text("Mudanças adicionadas:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        ForEach(viewModel.changes) { change in
                            HStack(spacing: 8) {
                                // Editable fields for existing changes
                                TextField("Original", text: Binding(
                                    get: { change.original },
                                    set: { newValue in
                                        if let index = viewModel.changes.firstIndex(where: { $0.id == change.id }) {
                                            viewModel.changes[index].original = newValue
                                        }
                                    }
                                ))
                                .textFieldStyle(.roundedBorder)
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.blue)
                                
                                TextField("Modificado", text: Binding(
                                    get: { change.modified },
                                    set: { newValue in
                                        if let index = viewModel.changes.firstIndex(where: { $0.id == change.id }) {
                                            viewModel.changes[index].modified = newValue
                                        }
                                    }
                                ))
                                .textFieldStyle(.roundedBorder)
                                
                                // Delete button
                                Button(action: {
                                    if let index = viewModel.changes.firstIndex(where: { $0.id == change.id }) {
                                        viewModel.removeChange(at: index)
                                    }
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .padding(6)
            }
            .frame(minHeight: 200)
        }
        .frame(idealWidth: 256, maxHeight: .infinity)
    }
}
