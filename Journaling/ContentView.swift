//
//  ContentView.swift
//  Journaling
//
//  Created by Daniel Wai on 4/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            TextField("title", text: $title)
            TextEditor()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
