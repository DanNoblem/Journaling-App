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
                    Text("Work Notes");
                    }
                NavigationLink(destination: ContentView()){
                    Text("Thouhgts");
                }
                NavigationLink(destination: ContentView()){
                    Text("Daily tasks");
                }
                }.navigationTitle("Journals")
            }
        }
    }


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
