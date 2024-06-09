//
//  Tutorial5.swift
//  iExpense
//
//  Created by Esteban Pérez Castillejo on 9/6/24.
//

import SwiftUI

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct Tutorial5: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    Tutorial5()
}
