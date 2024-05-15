import Foundation



// Arrays
var numeros: [Int] = [1, 2, 3, 4, 5]
print(numeros[2]) // Output: 3

// Diccionarios
var diccionario: [String: Int] = ["uno": 1, "dos": 2, "tres": 3]
print(diccionario["dos"] ?? 0) // Output: 2

// Conjuntos
var conjunto: Set<String> = ["manzana", "banana", "pera"]
print(conjunto.contains("manzana")) // Output: true

// Enums
enum DiaSemana {
    case lunes, martes, miercoles, jueves, viernes, sabado, domingo
}
let dia = DiaSemana.martes
print(dia) // Output: martes



// MARK: - Reto 2

/// Esta vez, el desafío es crear una matriz de cadenas, luego escribir algún código que imprima el número de elementos en la matriz y también el número de elementos únicos en la matriz.

/// 1. - Crear una matriz de cadenas.

/// 2. - Utilizar la función count para obtener el número total de elementos en la matriz.

/// 3. - Convertir la matriz en un conjunto (Set) para eliminar elementos duplicados.

/// 4. - Utilizar la función count nuevamente en el conjunto para obtener el número de elementos únicos.

// Crear una matriz de cadenas
let array: [String] = ["a", "b", "c", "a", "d", "e", "b"]

// Obtener el número de elementos en la matriz
let totalElements = array.count
print("Número total de elementos en la matriz: \(totalElements)")

// Convertir la matriz en un conjunto para obtener elementos únicos
let uniqueElements = Set(array)

// Obtener el número de elementos únicos en la matriz
let uniqueCount = uniqueElements.count
print("Número de elementos únicos en la matriz: \(uniqueCount)")