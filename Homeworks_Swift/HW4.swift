/*У нас уже реализованы запросы на получение списка друзей, групп и фотографий. 
Отобразите эту информацию на экранах.
Добавьте возможность на экране со списком друзей видеть онлайн друг или нет.*/

import UIKit

struct Friend {
 let name: String
    let isOnline: Bool
}

struct Group {
    let name: String
}

struct Photo {
    let name: String
}

class FriendsViewController: UICollectionViewController {
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запрос на получение списка друзей и заполнение массива friends
        fetchFriends()
        
        // Отображение списка друзей на экране
        displayFriends()
    }
    
    func fetchFriends() {
        // Запрос на получение списка друзей
        // Заполняем массив friends полученными данными
        friends.append(Friend(name: "John", isOnline: true))
        friends.append(Friend(name: "Emily", isOnline: false))
        friends.append(Friend(name: "Michael", isOnline: true))
        friends.append(Friend(name: "Jessica", isOnline: false))
    }
    
    func displayFriends() {
        // Создание таблицы для отображения друзей
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращаем количество друзей в массиве friends
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let friend = friends[indexPath.row]
        
        // Устанавливаем имя друга в ячейку таблицы
        cell.textLabel?.text = friend.name
        
        // Определяем статус друга (онлайн или оффлайн) и устанавливаем соответствующую иконку
        if friend.isOnline {
            cell.imageView?.image = UIImage(named: "online")
        } else {
            cell.imageView?.image = UIImage(named: "offline")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Обработка нажатия на ячейку друзя
        let friend = friends[indexPath.row]
        print("\(friend.name) is selected")
    }
}

class GroupsViewController: UICollectionViewController {
    
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запрос на получение списка групп и заполнение массива groups
        fetchGroups()
        
        // Отображение списка групп на экране
        displayGroups()
    }
    
    func fetchGroups() {
        // Запрос на получение списка групп
        // Заполняем массив groups полученными данными
        groups.append(Group(name: "Apple Fans"))
        groups.append(Group(name: "Photography Lovers"))
        groups.append(Group(name: "Fitness Enthusiasts"))
        groups.append(Group(name: "Travelers"))
    }
    
    func displayGroups() {
        // Создание таблицы для отображения групп
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension GroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращаем количество групп в массиве groups
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let group = groups[indexPath.row]
        
        // Устанавливаем название группы в ячейку таблицы
        cell.textLabel?.text = group.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Обработка нажатия на ячейку группы
        let group = groups[indexPath.row]
        print("\(group.name) is selected")
    }
}

class PhotosViewController: UICollectionViewController {
    
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запрос на получение списка фотографий и заполнение массива photos
        fetchPhotos()
        
        // Отображение списка фотографий на экране
        displayPhotos()
    }
    
    func fetchPhotos() {
        // Запрос на получение списка фотографий
        // Заполняем массив photos полученными данными
        photos.append(Photo(name: "Nature"))
        photos.append(Photo(name: "City"))
        photos.append(Photo(name: "Beach"))
        photos.append(Photo(name: "Mountains"))
    }
    
    func displayPhotos() {
        // Создание коллекции для отображения фотографий
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        view.addSubview(collectionView)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Возвращаем количество фотографий в массиве photos
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.item]
        
        // Устанавливаем название фотографии и ее изображение в ячейку коллекции
        cell.titleLabel.text = photo.name
        cell.imageView.image = UIImage(named: photo.name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Обработка нажатия на фотографию
        let photo = photos[indexPath.item]
        print("\(photo.name) is selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Устанавливаем размер ячейки фотографии
        let cellWidth = collectionView.bounds.width / 2 - 10
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

class PhotoCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: frame.height - 30),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Использование контроллеров на экране
let friendsViewController = FriendsViewController()
let groupsViewController = GroupsViewController()
let photosViewController = PhotosViewController()

// Добавление контроллеров на экран
let tabBarController = UITabBarController()
tabBarController.viewControllers = [friendsViewController, groupsViewController, photosViewController]

// Отображение экрана
let window = UIWindow(frame: UIScreen.main.bounds)
window.rootViewController = tabBarController
window.makeKeyAndVisible()