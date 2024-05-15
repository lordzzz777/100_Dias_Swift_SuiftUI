import Foundation

// MARK: - Día 5 Condicionales


// constante de tipoo entero, implicita
let edadPerson = 25

// se impone la condición
if edadPerson >= 18 {
    print("Eres mayor de edad")// si es mayor entra en este bloque
} else {
    print("Eres menor de edad")// si es menor enttrarai en este bloque 
}


//los condicinales ternarios 
edadPerson >= 18 ? print("Eres mayor de edad") : print("Eres menor de edad")


// contate de cadena de texto 
let diaSemana = "viernes"

// se evalua en cada caso la contate proporcinada 
switch diaSemana {
case "lunes":
    print("Es el primer día de la semana") 
case "viernes":
    print("¡Por fin es viernes!")
default:
    print("Es un día de la semana")
}


// MARK: - Día 6 Bucles


// Declaraciones "if", "else" y "else if":
let numero = 10

if numero < 5 {
    print("El número es menor que 5.")
} else if numero > 10 {
    print("El número es mayor que 10.")
} else {
    print("El número está entre 5 y 10, inclusive.")
}

// Combinación de condiciones con "||" y "&&":
let temperaturas = 25

if temperaturas < 0 || temperaturas > 30 {
    print("La temperatura está fuera del rango normal.")
}

if temperaturas >= 20 && temperaturas <= 30 {
    print("La temperatura es agradable para estar afuera.")
}


// Declaración switch:
let dia_Semana = "lunes"

// se evalua en cada caso la contate proporcinada 
switch dia_Semana {
case "lunes", "martes", "miércoles", "jueves", "viernes":
    print("Es un día laboral.")
case "sábado", "domingo":
    print("Es fin de semana.")
default:
    print("No es un día válido.")
}


// Operador ternario condicional:
let suEdad = 20
let mensaje = suEdad >= 18 ? "Eres mayor de edad" : "Eres menor de edad"
print(mensaje)

// Bucle for para recorrer un rango de números:
for i in 1...5 {
    print("Número \(i)")
}

// Bucle while para contar hasta cierto número:
var contador = 0
while contador < 5 {
    print("Contador: \(contador)")
    contador += 1
}


// MARK: - Reto 3
/// El problema se llama fizz buzz, y ha sido utilizado en entrevistas de trabajo, pruebas de ingreso a la universidad y más por tanto tiempo como puedo recordar. Tu objetivo es iterar desde 1 hasta 100, y para cada número:

/// Si es un múltiplo de 3, imprime "Fizz"
/// Si es un múltiplo de 5, imprime "Buzz"
/// Si es un múltiplo de 3 y 5, imprime "FizzBuzz"
/// De lo contrario, simplemente imprime el número.
/// Entonces, aquí tienes algunos valores de ejemplo que deberías obtener cuando se ejecute tu código:

/// 1 debería imprimir "1"
/// 2 debería imprimir "2"
/// 3 debería imprimir "Fizz"
/// 4 debería imprimir "4"
/// 5 debería imprimir "Buzz"
/// 6 debería imprimir "Fizz"
/// 7 debería imprimir "7"
/// ...
/// 15 debería imprimir "FizzBuzz"
/// ...
/// 100 debería imprimir "Buzz"
/// Antes de empezar: Este problema parece extremadamente simple, pero muchos, muchos desarrolladores luchan por resolverlo. Lo he visto personalmente, así que no te estreses por ello; intentar resolver el problema ya te enseña algo sobre él.

/// Ya sabes todo lo que necesitas para resolver ese problema, pero si deseas algunas pistas, añadiré algunas a continuación.

// se itera en un bucle for del 1 al 100
for numero in 1...100 {
    if numero % 3 == 0 && numero % 5 == 0 { 
        print("FizzBuzz")
    } else if numero % 3 == 0 {
        print("Fizz")
    } else if numero % 5 == 0 {
        print("Buzz")
    } else {
        print(numero)
    }
}