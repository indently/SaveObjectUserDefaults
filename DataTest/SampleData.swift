//
//  SampleData.swift
//  DataTest
//
//  Created by Federico on 24/02/2022.
//

import Foundation
import SwiftUI

struct Item: Codable {
    var id = UUID()
    var name: String
    var text: String
    
    static var sampleItem = Item(name: "Sample Name", text: "This is some sample text.")
}


class ItemData: ObservableObject {
    private let ITEM_KEY = "item_key"
    @Published var item: Item
    
    init() {
        if let data = UserDefaults.standard.data(forKey: ITEM_KEY) {
            if let decodedItem = try? JSONDecoder().decode(Item.self, from: data) {
                item = decodedItem
                print("Loaded item: \(item.name)")
                return
            }
        }
        item = Item(name: "", text: "")
        print("No item to load...")
    }
    
    func saveItem() {
        if let encodedItem = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encodedItem, forKey: ITEM_KEY)
            print("Saved item successfully!")
        }
    }
}
