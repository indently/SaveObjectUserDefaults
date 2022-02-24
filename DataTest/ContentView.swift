//
//  ContentView.swift
//  DataTest
//
//  Created by Federico on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = ItemData()
    
    var body: some View {
        Form {
            Section("Notes") {
                TextField("Enter a name", text: $data.item.name)
                TextField("Enter some text", text: $data.item.text)
                Button("Save") {
                    data.saveItem()
                }
            }
            
            Section("Current Info") {
                Text("ID: \(data.item.id)")
                    .lineLimit(1)
                Text(data.item.name)
                    .foregroundColor(.gray)
                Text(data.item.text)
                    .foregroundColor(.gray)
            }
        }
        .environmentObject(data)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
