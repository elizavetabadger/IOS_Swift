/*
6.	Домашнее задание
Условие:
1.	В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, 
удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер 
картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы 
класть и пиццу, и картошку фри.
2.	Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню
3.	Создайте протокол, в котором будут содержаться функции открытия и закрытия
4.	Написать расширение для класса пиццерии, в  котором будет реализован протокол из пункта 3*/

protocol MenuProtocol {
    var cost: Double { get }
    var name: String { get }
}

class Pizzerias {
    
    private var menu: [MenuProtocol]
    
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
    
    func add(_ new: MenuProtocol) {
        menu.append(new)
    }
 
        
    func getAllMenu() -> [MenuProtocol] {
        return menu
    } 
 }
 
 var somepizzeria = Pizzerias(menu: [])

struct Fries: MenuProtocol {
    var cost: Double
    var size: String
    var name: String
    
    init(cost: Double, size: String, name: String) {
        self.cost = cost
        self.size = size
        self.name = name
    }
}

struct Pizza: MenuProtocol {
    var cost: Double
    var type: String
    var name: String
    
    init(cost: Double, type: String, name: String) {
        self.cost = cost
        self.type = type
        self.name = name
    }
}

let pizzerias = Pizzerias (menu: [])
print(pizzerias.getAllMenu())

let fries = Fries(cost: 150 , size: "M", name: "Hot")
let pizza = Pizza(cost: 300, type: "Mozarella", name: "Bu")
pizzerias.add(fries)
pizzerias.add(pizza)


protocol WorkProtocol {
    func start()
    func end()
}

extension Pizzerias: WorkProtocol {
    
    func start() {
        print("Start work")
    }
    
    func end() {
        print("Final work")
    }
    
}

pizzerias.start()
print(pizzerias.getAllMenu())

/*5.	Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна 
работать и с Int, и с Double. Функция должна возвращать результат вычитания Numeric*/

func Subtraction<T: Numeric>(a: T, b: T) -> T {
a - b
}

print (Subtraction(a: 56, b:45))

