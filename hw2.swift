/*
Домашнее задание 2
Условие:
1.	Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, 
следующий аргумент это годовой  процент, третий аргумент это срок Функция возвращает сколько денег получит 
пользователь по итогу*/

func culc (deposit: Double, percent: Double, month: Double) -> Double {
    deposit * (percent/100/12) * month
}
let income = culc (deposit: 20000, percent: 12, month: 2)
print (income)

/*2.	Создать перечисление, которое содержит 3 вида пиццы и создать  переменные с каждым видом пиццы.*/

enum pizza: String {
    case pepperoni = "Пеперрони"
    case pineapple = "Ананасовая"
    case margarita = "Маргарита"
    
}

var american: pizza = .pepperoni
var havaiian: pizza = .pineapple
var italian: pizza = .margarita

var typePizza = pizza.pepperoni
print (typePizza.rawValue)

/*3.	Добавить возможность получения названия пиццы через  rawValue */

enum pizza: String {
    case pepperoni = "Пеперрони"
    case pineapple = "Ананасовая"
    case margarita = "Маргарита"
    
   func getPizzaType() -> String {
        switch self {
            case .pepperoniPizza: return self.rawValue
            case .pineapplePizza: return self.rawValue
            case .margaritaPizza: return self.rawValue
        }
    }
}

var americanPizza: pizza = pizza.pepperoni
var havaiianPizza: pizza = pizza.pineapple
var italianPizza: pizza = pizza.margarita

print(americanPizza.getPizzaType)

