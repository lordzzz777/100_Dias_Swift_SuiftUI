//
//  Tutorial8.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 16/9/24.
//

import SwiftUI
import SamplePackage

struct Tutorial8: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    Tutorial8()
}
