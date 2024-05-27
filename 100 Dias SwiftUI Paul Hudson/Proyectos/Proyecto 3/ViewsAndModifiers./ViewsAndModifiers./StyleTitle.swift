//
//  StyleTitle.swift
//  ViewsAndModifiers.
//
//  Created by Esteban Perez Castillejo on 27/5/24.
//

import SwiftUI

struct StyleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40))
            .bold()
            .foregroundStyle(.blue)
            .padding()
    }
}

