//
//  HabitViewModel.swift
//  HabitTracking
//
//  Created by Esteban Perez Castillejo on 28/7/24.
//

import Foundation
import Observation

@Observable
class HabitItemsViewModel{

    
    var items = [HabitTrackingModel]() {
        didSet{
            if let encode = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encode, forKey: "Items")
            }
        }
    }
    
    init(){
        if let savedItem = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItem = try? JSONDecoder().decode([HabitTrackingModel].self, from: savedItem){
                items = decodedItem
                return
            }
        }
        
        items = []
        
    }
    
    
    // Función para eliminar entradas
    func removeItems(at offsets: IndexSet, title: String) {
        let itemsToRemove = items.filter{
            $0.title == title
        }
        
        for index in offsets {
            if let itemIndex = items.firstIndex(where: {
                $0.id == itemsToRemove[index].id
            }){
                items.remove(at: itemIndex)
            }
        }
    }

}
