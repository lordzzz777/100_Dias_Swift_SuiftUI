//
//  TextModel.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import Foundation

let textmodel1: String = """
La navegación programática nos permite pasar de una vista a otra solo usando código, en lugar de esperar a que el usuario realice una acción específica. Por ejemplo, tal vez su aplicación esté ocupada procesando alguna entrada del usuario y desee navegar a una pantalla de resultados cuando ese trabajo haya terminado: desea que la navegación ocurra automáticamente cuando lo diga, en lugar de como una respuesta directa a la entrada del usuario.

En SwiftUI, esto se hace vinculando la ruta de un NavigationStack a una matriz de cualquier dato con el que estés navegando.
"""
let textmodel2: String = """
En el primer botón estamos configurando toda la matriz para que solo contenga el número 32. Si algo más está en la matriz, se eliminará, lo que significa que NavigationStack volverá a su estado original antes de navegar al número 32.
"""
let textmodel3: String = """
En el segundo botón estamos añadiendo 64, lo que significa que se añadirá a lo que sea que estuviéramos navegando. Por lo tanto, si nuestra matriz ya contenía 32, ahora tendríamos tres vistas en la pila: la vista original (llamada vista "raíz"), luego algo para mostrar el número 32, y finalmente algo para mostrar el número 64.
"""

let textmodel4: String = """
Eso presentará una vista para 32 y luego una vista para 64, por lo que el usuario debe tocar Atrás dos veces para volver a la vista raíz.

Puede mezclar la navegación del usuario y la navegación programática tanto como desee: SwiftUI se encargará de asegurarse de que su matriz de rutas se mantenga sincronizada con cualquier dato que muestre, independientemente de cómo se muestre.
"""
