//
//  TextView.swift
//  Journaling
//
//  Created by Daniel Wai on 4/25/23.
//
// https://www.appcoda.com/swiftui-textview-uiviewrepresentable/

import SwiftUI
 
struct TextView: UIViewRepresentable {
 @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
    
        func makeCoordinator() -> Coordinator {
            Coordinator($text)
        }
         
        class Coordinator: NSObject, UITextViewDelegate {
            var text: Binding<String>
         
            init(_ text: Binding<String>) {
                self.text = text
            }
         
            func textViewDidChange(_ textView: UITextView) {
                self.text.wrappedValue = textView.text
            }
        }
    
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
 
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}
