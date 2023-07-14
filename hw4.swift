 /*1.Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).*/
 
 enum pizzaType : String  {
    case Pepperoni = "Пепперони"
    case Pineaplle = "Ананасовая"
    case Mozzarella = "Моцарелла"
    case Vegetarian = "Вегетерианская"
 }
 
 enum pizzaAdd : String {
    case tomato = "Томат"
    case cheese = "СЫр"
    case mushrooms = "Мухромс"
    case ham = "ХАМ"
 }
 
 struct Pizza {
    var cost: Double
    var type: pizzaType
    var doug: String
    var additives: [pizzaAdd]
 }
 
 class Pizzerias {
 
    private var arrPizza: [Pizza] = []
    
    init (arrPizza: [Pizza]){
        self.arrPizza = arrPizza
    }
    
    func addPizzaType (pizza: Pizza) {
        self.arrPizza.append(pizza)
    }
        
    func getAllPizzaType() -> [pizzaType] {
        return [.Pepperoni, .Pineaplle, .Mozzarella, .Vegetarian]
    } 
    
    func getAllPizzes() -> [Pizza] {
        return arrPizza
    } 
 }
 
 var somepizzeria = Pizzerias(arrPizza: [])
 
 let pizzaPepperoni = Pizza(cost:40, type: pizzaType.Pepperoni, doug: "Thin", additives:[pizzaAdd.tomato, pizzaAdd.ham, pizzaAdd.mushrooms])
 somepizzeria.addPizzaType(pizza: pizzaPepperoni)
 
 let allPizzaType = somepizzeria.getAllPizzaType()
 print(allPizzaType)
 
 print(somepizzeria.getAllPizzes())

/* 
2.Создать структуру пиццы. Она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы.
Подсказка: добавки лучше также сделать перечислением.

3.Создать класс пиццерии, добавить массив с возможными видами пиццы. 
Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.

4.Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

5.Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.*/