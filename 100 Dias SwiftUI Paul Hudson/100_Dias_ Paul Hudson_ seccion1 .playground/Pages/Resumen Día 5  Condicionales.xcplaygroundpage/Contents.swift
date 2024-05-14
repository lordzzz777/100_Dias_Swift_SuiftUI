import Foundation

// MARK: - Día 5 Condicionales

/// if es una declaración condicional que se usa para ejecutar un bloque de código si se cumple una condición específica.
/// La sintaxis básica es: if condición { código a ejecutar }.

/// También puedes usar else para proporcionar un bloque de código alternativo que se ejecutará si la condición no se cumple.
/// Para evaluar múltiples condiciones, puedes usar else if.

/// if puede anidarse dentro de otros if o else para condiciones más complejas.

/// Ejemplo:

let edadPerson = 25

if edadPerson >= 18 {
    print("Eres mayor de edad")
} else {
    print("Eres menor de edad")
}


/// switch es una estructura de control que se usa para evaluar una variable o expresión y ejecutar un bloque de código dependiendo del valor de esa variable o expresión.

/// Puedes manejar múltiples casos usando case, y el bloque de código correspondiente se ejecutará cuando se encuentre un caso que coincida.

/// Puedes usar default para proporcionar un bloque de código que se ejecutará si ningún caso coincide.
/// switch es más expresivo que if-else en ciertos casos y puede ser más fácil de leer cuando hay múltiples condiciones a manejar.


/// Ejemplo:

let diaSemana = "viernes"

switch diaSemana {
case "lunes":
    print("Es el primer día de la semana")
case "viernes":
    print("¡Por fin es viernes!")
default:
    print("Es un día de la semana")
}

