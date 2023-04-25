//
//  NavigationView.swift
//  Journaling
//
//  Created by Daniel Wai on 4/25/23.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: ContentView()){
                    Text("Entry 1")
                }
            }
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
