//
//  FlagImage().swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 27/5/24.
//

import SwiftUI

struct FlagImage: View {

    var countries: [String]
    var number: Int
    
    var body: some View {
        Image(countries[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}
