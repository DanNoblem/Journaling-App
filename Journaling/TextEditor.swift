//
//  TextEditor.swift
//  Journaling
//
//  Created by Daniel Wai on 4/25/23.
//

import SwiftUI
import UIKit

struct TextEditor: View {
    
    
    @State private var message = ""
    @State private var textStyle = UIFont.TextStyle.footnote
    
    
    var body: some View {
        TextView(text: $message, textStyle: $textStyle)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .keyboard){
                    Button("Done") {
                    }
                }
            }
    }
    
}
    
struct TextEditor_Previews: PreviewProvider {
        static var previews: some View {
            TextEditor()
    }
}
