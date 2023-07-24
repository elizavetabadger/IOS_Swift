/*
1.Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, 
зарплата и должность. Должностей пока может быть две: или кассир, или повар.
2.Добавить в класс пиццерии массив с работниками.
4. Добавить в класс пиццерии свойство, в котором хранится массив столиков. 
5.У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. 
Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.*/

enum Posts: String {
    case cashier = "кассир"
    case cook = "повар"
}

struct Employe {
    var name: String
    var salary: Int
    var post: Posts
    
    init(name: String, salary: Int, post: Posts) {
        self.name = name
        self.salary = salary
        self.post = post
    }
}


 class Pizzerias {
 
    private var Employees: [Employe] = []
    
    init (Employees: [Employe]){
        self.Employees = Employees
    }
    
    func addEmploye (human: Employe) {
        self.Employees.append(human)
    }
    
    func getHumansInfo() -> [Employe] {
        return Employees
    }
    
    var Tables: [Table] = []
    
    init (Tables: [Table]){
        self.Tables = Tables
    }
 }
 
var somepizzerias = Pizzerias(Employees = [])

/*3. Создать класс столика. В нём должны быть свойство, в котором содержится 
количество мест, и функция, которая на вход принимает количество гостей, 
которое хотят посадить, возвращает true, если места хватает, и false, если 
места не хватает. Изначальное количество мест задаётся в инициализаторе.*/

class Table {
    
    private var numSeats: Int
    
    init(seats: Int) {
        self.numSeats = seats
    }
    
    func Availability(for guests: Int) -> Bool {
        return guests <= numSeats
    }
    
    private var adress: Pizzerias   
    
    init(pizzerias: Pizzerias) {
        self.adressPizzarias = pizzerias
    }
    
}

var table = Table(seats: 4)
var guestsCount = 6
var isAvailable = table.Availability(for: guestsCount)

if isAvailable {
    print("Мест хватает")
} else {
    print("Мест не хватает")
}

/*5.У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. 
Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.*/
