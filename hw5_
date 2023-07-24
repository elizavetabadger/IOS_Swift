/*Домашнее задание
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
 
        
    func getAllMenu() -> MenuProtocol {
        return menu
    } 
 }
 
 var somepizzeria = Pizzerias(menu: [])

struct Fries {
    var cost: Double
    var size: String
    
    init(cost: Double, size: String) {
        self.cost = cost
        self.size = size
    }
}

struct Pizza {
    var cost: Double
    var type: String
    
    init(cost: Double, type: String) {
        self.cost = cost
        self.type = type
    }
}

let pizzerias = Pizzerias (menu: [])
let fries = Fries(cost: 150 , size: "M")
let pizza = Pizza(cost: 300, type: "Mozarella")
pizzerias.add(fries)
pizzerias.add(pizza)


protocol WorkProtocol {
    func start()
    func final()
}

extension PizzeriasWork: UITableViewDelegate, UITableViewDataSource {
    
    func start() {
        print("Start work")
    }
    
    func final() {
        print("Final work")
    }
    
}

start(Pizzerias)

/*5.	Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна 
работать и с Int, и с Double.Функция должна возвращать результат вычитания Numeric
*/

func Subtraction (a: Double, b: Double) -> Double {
    var a = 54.565
    var b = 65
    var Numeric = (a - b)
    
    return Numeric
    
}

