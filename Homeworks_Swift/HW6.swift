/* Задание:
1. Добавить темы в свое приложение. У пользователя должен быть доступен выбор темы, сделать это он может в профиле 
(там где сейчас отображается имя и аватарка). у пользователя должен быть выбор минимум между 3 темами, причем при 
смене темы должен меняться не только фон в приложении, но и цвет текста, цвет фона, цвет ячеек и так далее.
2. Добавить в приложение Core Data. Теперь необходимо сохранять друзей и группы. Когда пользователь переходит к списку 
друзей или групп - ему сначала должны показываться данные из Core Data, затем, когда придет ответ на запрос - 
отображаются новые данные, а также эти данные обновляются в Core Data. Если в ответ на запрос приходит ошибка, то 
необходимо отобразить ее пользователю (например, используя UIAlertController) и показать данные из Core Data с пометкой, 
на какой момент времени эти данные актуальны.
3. Добавить возможность обновить список друзей. Например, добавить кнопку, по нажатию на которую происходит запрос в сеть 
на получение списка друзей или отправлять запрос, если пользователь “потянет” за таблицу (то есть беседы листаем движением 
пальца снизу вверх, а запрос будет отправляться при движении сверху вниз, находясь на самом верху таблицы). После получения 
данных необходимо их отобразить. а также обновить в Core Data.
4. Если обновление списка друзей инициировано пользователем, то необходимо на время получения данных показать пользователю, 
что данные обновляются (посмотрите в сторону UIActivityIndicatorView или UIRefreshControl).
5. Необходимо добавить возможность перейти в профиль друга. То есть по клику на ячейку друга необходимо переходить в его профиль. 
Выглядеть он должен точно так же, как и профиль пользователя, но без возможности сменить тему.
*/


import UIKit
import CoreData

// Создание класса для хранения информации о теме
class Theme {
    var name: String
    var backgroundColor: UIColor
    var textColor: UIColor
    var cellColor: UIColor
    
    init(name: String, backgroundColor: UIColor, textColor: UIColor, cellColor: UIColor) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cellColor = cellColor
    }
}

// Создание массива с доступными темами
let themes = [
    Theme(name: "Тема 1", backgroundColor: .white, textColor: .black, cellColor: .gray),
    Theme(name: "Тема 2", backgroundColor: .black, textColor: .white, cellColor: .blue),
    Theme(name: "Тема 3", backgroundColor: .yellow, textColor: .purple, cellColor: .green)
]

// Добавление выбора темы в профиль пользователя
class ProfileViewController: UIViewController {
    var changeTheme: Theme?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
 
    override func viewDidLoad() {
    super.viewDidLoad()
    }
}
 
 // Загрузка тем
 loadchangeTheme()
    
func changeTheme(to theme: Theme) {

    backgroundImageView.image = theme.backgroundImage
    label.textColor = theme.textColor
    view.backgroundColor = theme.backgroundColor
    tableView.cellColor = theme.cellColor
}

// Обновление интерфейса при смене темы
func updateInterface(with theme: Theme) {
    view.backgroundColor = theme.backgroundColor
    label.textColor = theme.textColor
    tableView.backgroundColor = theme.backgroundColor
    tableView.cellColor = theme.cellColor
}

// Добавление Core Data
class Friend: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var age: Int
}

class Group: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var members: [Friend]
}

guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
    return
}
let context = appDelegate.persistentContainer.viewContext

// Сохранение данных о друге
func saveFriend(name: String, age: Int) {
    let friend = Friend(context: context)
    friend.name = name
    friend.age = age
 
    do {
        try context.save()
    } catch {
        print("Ошибка при сохранении данных о друге: \(error.localizedDescription)")
    }
}

// Сохранение данных о группе
func saveGroup(name: String, members: Int) {
    let group = Group(context: context)
    group.name = name
    group.members = members
 
    do {
        try context.save()
    } catch {
    print("Ошибка при сохранении данных о группе: \(error.localizedDescription)")
    }
}

// Получение данных о друзьях
func fetchFriends() -> [Friend] {
    let fetchRequest: NSFetchRequest<Friend> = Friend.fetchRequest()
 
    do {
        let friends = try context.fetch(fetchRequest)
        return friends
    } catch {
        print("Ошибка при получении данных о друзьях: \(error.localizedDescription)")
    return []
    }
}

// Получение данных о группах
func fetchGroups() -> [Group] {
    let fetchRequest: NSFetchRequest<Group> = Group.fetchRequest()
 
    do {
        let groups = try context.fetch(fetchRequest)
        return groups
    } catch {
        print("Ошибка при получении данных о группах: \(error.localizedDescription)")
    return []
    }
 }

// Добавление кнопки для обновления списка друзей
class FriendsViewController: UIViewController {
    let refreshButton = UIButton()
    refreshButton.setTitle("Обновить", for: .normal)
    refreshButton.addTarget(self, action: #selector(refreshFriendsList), for: .touchUpInside)
    view.addSubview(refreshButton)
}

// Отправка запроса на обновление списка друзей
func refreshFriends() {
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    activityIndicator.startAnimating()
    view.addSubview(activityIndicator)

    // Обновление данных в Core Data
    updateFriends(with: newFriends)
    
    // Обновление интерфейса
    tableView.reloadData()
}

//Переход в профиль друга
func goToFriendProfile() {
    let friendProfileViewController = FriendProfileViewController()
    navigationController?.pushViewController(friendProfileViewController, animated: true)
}

class FriendsViewController: UIViewController {
    // Код для отображения списка друзей в таблице
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        let friendProfileViewController = FriendProfileViewController(friend: friend)
        navigationController?.pushViewController(friendProfileViewController, animated: true)
    }
}

// Отображение профиля друга
class FriendProfileViewController: UserProfileViewController {
    override func changeTheme() {
        super.changeTheme()
    }
}