/*1. Выбрать архитектурный паттерн. Переписать свой проект с друзьями, группами и фото с использованием этого паттерна.
2. Провести рефакторинг кода. Постарайтесь сделать так, чтобы в вашем коде соблюдались основные принципы. 
Также проверьте, что у вас используются понятные названия, название классов с большой буквы, функций с маленькой и так далее.
3. Подключить SwiftLint к проекту. Избавиться от ошибок и предупреждений.
4. Покрыть свой код unit и ui-тестами.*/

// Модель данных для друзей
import UIKit

struct Friend {
    let id: Int
    let name: String
    let age: Int
    let photo: String
}

// Модель данных для групп
struct Group {
    let id: Int
    let name: String
    let memberCount: Int
    let photo: String
}

class FriendsManager {
    
    // Получение списка друзей
    func getFriends() -> [Friend] {
        // Получение данных из сервера или локальной базы данных и формирование списка друзей
        return []
    }
    
    // Добавление нового друга
    func addFriend(_ friend: Friend) {
        // Добавление друга в базу данных или отправка на сервер
    }
    
    // Удаление друга
    func removeFriend(withId id: Int) {
        // Удаление друга из базы данных или с сервера
    }
}

class GroupsManager {
    
    // Получение списка групп
    func getGroups() -> [Group] {
        // Здесь происходит получение данных из сервера или локальной базы данных и формирование списка групп
        return []
    }
    
    // Добавление новой группы
    func addGroup(_ group: Group) {
        // Добавление группы в базу данных или отправка на сервер
    }
    
    // Удаление группы
    func removeGroup(withId id: Int) {
        // Удаление группы из базы данных или с сервера
    }
}

// Пример использования

let friendsManager = FriendsManager()
let groupsManager = GroupsManager()

// Получение списка друзей
let friends = friendsManager.getFriends()
print(friends)

// Добавление нового друга
let newFriend = Friend(id: 1, name: "John", age: 28, photo: "john.jpg")
friendsManager.addFriend(newFriend)

// Удаление друга
friendsManager.removeFriend(withId: 1)

// Получение списка групп
let groups = groupsManager.getGroups()
print(groups)

// Добавление новой группы
let newGroup = Group(id: 1, name: "Swift Developers", memberCount: 100, photo: "swift.jpg")
groupsManager.addGroup(newGroup)

// Удаление группы
groupsManager.removeGroup(withId: 1)


/* Подключение SwiftLint к проекту.
Установка SwiftLint с помощью менеджера пакетов Homebrew командой: brew install swiftlint.
Перейти в корневую папку проекта.
Создать файл .swiftlint.yml и добавить в него правила, которые мне нужны.
Запустить команду swiftlint в корневой папке проекта для проверки кода на соответствие правилам из .swiftlint.yml.
*/

/* Использовать Test navigator в Xcode для тестирования модели приложения и асинхронных методов.
Имитировать взаимодействие с библиотекой или системными объектами с помощью заглушек и моков.
Тестировать UI и производительность.
Использовать инструмент покрытия кода.
В целом изучила данный вопрос, понравилась данная статья: https://swiftbook.org/tutorials/1439
*/