//
//  IntroductionSwiftDataAndSwiftUI.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 6/8/24.
//

import SwiftUI
import Observation
import SwiftData

struct IntroductionSwiftDataAndSwiftUI: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    IntroductionSwiftDataAndSwiftUI()
}

@Model
class Student{
    var id: UUID
    var name: String
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
