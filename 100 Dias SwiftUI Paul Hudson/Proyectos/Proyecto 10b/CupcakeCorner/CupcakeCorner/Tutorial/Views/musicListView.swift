//
//  musicListView.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 31/7/24.
//

import SwiftUI

struct musicListView: View {
    @State private var result = [Result]()
    
    var body: some View {
        
        List(result, id: \.trackId){ item in
            Text(item.trackName).font(.headline)
            Text(item.collectionName)
        }.task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                result = decodedResponse.results
            }
            
        }catch {
            print("Invalid Data")
        }
    }
}

#Preview {
    musicListView()
}
