import Foundation

// MARK: - Días 3 y 4, Tipos de datos Complejos

/// Hemos superado los tipos de datos simples ahora, y comenzamos a buscar formas de agruparlos e incluso crear los nuestros propios usando enums. Entonces, recapitulemos:

/// Los Arrays nos permiten almacenar muchas valores en un solo lugar, y luego leerlos usando índices enteros. Los Arrays siempre deben ser especializados para que contengan un tipo específico, y tienen funcionalidades útiles como count, append(), y contains().

/// Los Diccionarios también nos permiten almacenar muchas valores en un solo lugar, pero nos permiten leerlos usando claves que especificamos. Deben ser especializados para tener un tipo específico para la clave y otro para el valor, y tienen funcionalidades similares a los Arrays, como contains() y count.

/// Los Conjuntos son una tercera forma de almacenar muchas valores en un solo lugar, pero no podemos elegir el orden en que almacenan esos elementos. Los Conjuntos son realmente eficientes para encontrar si contienen un elemento específico.

/// Los Enums nos permiten crear nuestros propios tipos simples en Swift para que podamos especificar un rango de valores aceptables, como una lista de acciones que el usuario puede realizar, los tipos de archivos que podemos escribir, o los tipos de notificaciones para enviar al usuario.

/// Swift siempre debe conocer el tipo de datos dentro de una constante o variable, y utiliza principalmente la inferencia de tipos para descubrirlo basado en los datos que asignamos. Sin embargo, también es posible usar anotación de tipo para forzar un tipo particular.

/// De entre Arrays, Diccionarios, y Conjuntos, es seguro decir que usarás Arrays con mucha más frecuencia. Después vienen los Diccionarios, y los Conjuntos quedan en un distante tercer lugar. Eso no significa que los Conjuntos no sean útiles, ¡pero sabrás cuándo los necesitas!

// Ejemplo:

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

