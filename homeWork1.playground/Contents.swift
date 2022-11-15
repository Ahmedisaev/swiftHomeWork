import UIKit


// 1. Решить квадратное уравнение.

// x^2 - 70x + 600 = 0

var a: Double = 1
var b: Double = -70
var c: Double = 600

var b_pow: Double = pow(b, 2)

var D: Double = b_pow - 4 * a * c

var x: Double = -1 * b / 2 * a
var x1: Double = -1 * b + sqrt(D) / 2 * a
var x2: Double = -1 * b - sqrt(D) / 2 * a

if D > 0 {
    
    print("Задача №1: Уравнение имеет два корня x1 = \(x1) и x2 = \(x2)")
}
else if D < 0 {
    print("Задача №1: Нет корней")
}
else if D == 0 {
    print("Задача №1: Уравнение имеет один корень x = \(x)")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var leg_1: Double = 4
var leg_2: Double = 3
var pow_leg_1 = pow(leg_1, 2)
var pow_leg_2 = pow(leg_2, 2)

var pow_hypotenuse = pow_leg_1 + pow_leg_2
var sqrt_hypoyenuse = sqrt(pow_hypotenuse)

var area_of_triangle = 0.5 * leg_1 * leg_2
var perimeter = leg_1 + leg_2 + sqrt_hypoyenuse

print("Задача №2 Площадь прямоугольного треугольника равна \(area_of_triangle) квадратных сантиметров")
print("Гипотенуза равна \(sqrt_hypoyenuse) сантиметров")
print("Периметр равен \(perimeter) сантиметров")


//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var deposit: Double = 100_000
var percent_per_year: Double = 10


var year_1 = ((deposit * percent_per_year) / 100) + deposit
var year_2 = ((year_1 * percent_per_year) / 100) + year_1
var year_3 = ((year_2 * percent_per_year) / 100) + year_2
var year_4 = ((year_3 * percent_per_year) / 100) + year_3
var year_5 = ((year_4 * percent_per_year) / 100) + year_4

print("Задача №3 Сумма вклада через 5 лет с введенными данными составляет: \(year_5) рублей")
