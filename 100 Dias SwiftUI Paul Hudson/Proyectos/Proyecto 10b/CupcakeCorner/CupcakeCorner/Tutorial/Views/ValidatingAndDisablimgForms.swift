//
//  ValidatingAndDisablimgForms.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 31/7/24.
//

import SwiftUI

struct ValidatingAndDisablimgForms: View {
    @State private var username = ""
    @State private var email = ""
    
    // Eso significa que "esta sección está desactivada si el nombre de usuario está vacío o el correo electrónico está vacío", que es exactamente lo que queremos.
    
   // Es posible que descubra que vale la pena convertir sus condiciones en una propiedad computada separada, como esta:
    
    var disableForm: Bool {
         username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
                
            }
            // este modeifiocador le dice al boton que este
            // desactivado hasta que se escriba algo dentro de los campos
            // .disabled(username.isEmpty || email.isEmpty)
           
            // filtro de activación por numero de caracteres
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingAndDisablimgForms()
}
