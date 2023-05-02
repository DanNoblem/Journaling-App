//
//  Model.swift
//  Journaling
//
//  Created by Daniel Wai on 5/2/23.
//

import SwiftUI
import Foundation

struct info: Encodable, Decodable, Identifiable {
    var id: Int
    var title: String
    var items: [contents]
    var uniqueId = 0
    
    init () {
        items = []
        self.reset();
    }
    
    mutating func reset () {
        uniqueId = 0
        items = []
    }
    
    func item(id: Int) -> contents? {
        items.first { $0.id == id }
    }

}

struct contents: Codable, Hashable, Identifiable {
    var id: Int
    var order: Int
    var content: String
}
