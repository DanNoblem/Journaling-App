//
//  Model.swift
//  Journaling
//
//  Created by Daniel Wai on 5/2/23.
//

import SwiftUI
import Foundation

struct info: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case title
        case body
    }
    
    var id = UUID()
    var title: String
    var body: String

}

class ReadData: ObservableObject  {
    @Published var infos = [info]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Textinfo", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let infos = try? JSONDecoder().decode([info].self, from: data!)
        self.infos = infos!
        
    }
     
}
