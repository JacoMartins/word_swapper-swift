//
//  SnippetComponent.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import SwiftUI

struct SnippetComponent : View {
    @Binding var original_snippet: String
    @Binding var modified_snippet: String
    
    var body : some View {
        HStack(alignment: .center) {
            Text("Editar trecho:")
            TextField("Trecho origem", text: $original_snippet)
            TextField("Trecho modificado", text: $modified_snippet)
        }
    }
}
