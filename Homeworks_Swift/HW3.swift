/*1. Необходимо очистить ViewController и добавить на него WKWebView(WKWebView). 
Для этого необходимо вверху импортировать WebKit, затем добавить WKWebView в качестве subview и сделать контроллер делегатом для webView 
(для этого ViewController должен соответствовать WKNavigationDelegate). Затем необходимо начать загрузку, например, во viewDidLoad(). 
Для этого вызывается webView.load и передается URLRequest. 
Также предварительно необходимо “Создать приложение”. Сделать это можно кликнув на “Создать приложение” здесь: https://dev.vk.com/. 
Затем необходимо реализовать метод func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void).
Token и userID нам еще понадобятся для дальнейших запросов.*/

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://oauth.vk.com/authorize?client_id=YOUR_APP_ID&redirect_uri=REDIRECT_URI&display=mobile&v=5.131&response_type=token")!
        webView.load(URLRequest(url: url))
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
}

/*2. На следующем контроллере планируется отображение списка друзей. 
Подумайте и решите, как удобнее: открывать окно авторизации на ViewController и затем переходить к списку друзей или открывать авторизацию на экране списка друзей. 
Реализуйте свое решение.*/

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Открываем экран авторизации при запуске приложения
        showAuthorizationScreen()
    }
    
    func showAuthorizationScreen() {
        // Создаем экземпляр контроллера авторизации
        let authorizationViewController = AuthorizationViewController()
        authorizationViewController.delegate = self
        
        // Отображаем экран авторизации
        self.present(authorizationViewController, animated: true, completion: nil)
    }
    
    func showFriendsListScreen() {
        // Создаем экземпляр контроллера списка друзей
        let friendsListViewController = FriendsListViewController()
        
        // Отображаем список друзей
        self.navigationController?.pushViewController(friendsListViewController, animated: true)
        
        // Получаем список друзей
        getFriendsList()
    }
    
    func showGroupsListScreen() {
        // Создаем экземпляр контроллера списка групп
        let groupsListViewController = GroupsListViewController()
        
        // Отображаем список групп
        self.navigationController?.pushViewController(groupsListViewController, animated: true)
        
        // Получаем список групп
        getGroupsList()
    }
    
    func showPhotosScreen() {
        // Создаем экземпляр контроллера фотографий
        let photosViewController = PhotosViewController()
        
        // Отображаем экран с фотографиями
        self.navigationController?.pushViewController(photosViewController, animated: true)
        
        // Получаем фотографии со страницы пользователя
        getPhotos()
    }
    
    func getFriendsList() {
        // Отправляем запрос на получение списка друзей
        APIManager.shared.getFriendsList { result in
            switch result {
            case .success(let friends):
                for friend in friends {
                    print(friend.name)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getGroupsList() {
        // Отправляем запрос на получение списка групп
        APIManager.shared.getGroupsList { result in
            switch result {
            case .success(let groups):
                for group in groups {
                    print(group.name)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getPhotos() {
        // Отправляем запрос на получение фотографий пользователя
        APIManager.shared.getPhotos { result in
            switch result {
            case .success(let photos):
                for photo in photos {
                    print(photo.url)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension ViewController: AuthorizationViewControllerDelegate {
    func didAuthorize() {
        // После авторизации открываем экран списка друзей
        showFriendsListScreen()
    }
}

class AuthorizationViewController: UIViewController {
    weak var delegate: AuthorizationViewControllerDelegate?
    
    // Реализация экрана авторизации
    
    func authorize() {
        // Выполняем авторизацию
        
        // Вызываем метод делегата для обработки успешной авторизации
        delegate?.didAuthorize()
    }
}

protocol AuthorizationViewControllerDelegate: class {
    func didAuthorize()
}

class FriendsListViewController: UIViewController {
    // Реализация экрана списка друзей
}

class GroupsListViewController: UIViewController {
    // Реализация экрана списка групп
}

class PhotosViewController: UIViewController {
    // Реализация экрана с фотографиями
}

class APIManager {
    static let shared = APIManager()
    
    func getFriendsList(completion: @escaping (Result<[Friend], Error>) -> Void) {
        // Отправляем запрос на получение списка друзей
        
        // Возвращаем результат
        let friends: [Friend] = [] // Полученные данные
        
        completion(.success(friends))
    }
    
    func getGroupsList(completion: @escaping (Result<[Group], Error>) -> Void) {
        // Отправляем запрос на получение списка групп
        
        // Возвращаем результат
        let groups: [Group] = [] // Полученные данные
        
        completion(.success(groups))
    }
    
    func getPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        // Отправляем запрос на получение фотографий пользователя
        
        // Возвращаем результат
        let photos: [Photo] = [] // Полученные данные
        
        completion(.success(photos))
    }
}

//Отобразить информацию на экране

struct Friend {
    let name: String
}

struct Group {
    let name: String
}

struct Photo {
    let url: String
}

/*3. Получать список друзей. Результат нужно выводить в консоль. 
Отображать список не нужно.
Запрос должен отправляться только после перехода к экрану списка друзей.*/

import UIKit
import VK_ios_sdk

class AuthorizationViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Проверяем, авторизован ли пользователь
        if VKSdk.isLoggedIn() {
            // Переходим к списку друзей
            performSegue(withIdentifier: "FriendsSegue", sender: nil)
        } else {
            // Открываем окно авторизации
            VKSdk.authorize(["friends", "groups", "photos"])
        }
    }
    
    func vkSdkDidAuthorize(with result: VKAuthorizationResult!) {
        // Авторизация успешна, переходим к списку друзей
        performSegue(withIdentifier: "FriendsSegue", sender: nil)
    }
    
    func vkSdkAuthorizationFailed() {
        // Авторизация не удалась, выводим сообщение об ошибке
        print("Authorization failed")
    }
}

class FriendsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем список друзей
        VKApi.friends().get(["count": "20"]).execute(resultBlock: { response in
            // Выводим список друзей в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

class GroupsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем список групп
        VKApi.groups().get(["user_id": "123456789"]).execute(resultBlock: { response in
            // Выводим список групп в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

class PhotosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем фотографии пользователя
        VKApi.photos().getAll(["owner_id": "123456789"]).execute(resultBlock: { response in
            // Выводим список фотографий в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

/*4. Получать список групп. Для этого необходимо изучить документацию, а затем выбрать правильный метод. Результат нужно выводить в консоль. Отображать список не нужно. Место, где можно искать метод: https://dev.vk.com/method/groups.
Запрос должен отправляться только после перехода к экрану списка групп.*/

import UIKit
import VK_ios_sdk

class GroupsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подписываемся на уведомление об авторизации пользователя в VK
        NotificationCenter.default.addObserver(self, selector: #selector(showGroups), name: Notification.Name("VKAuthorizationSuccess"), object: nil)
    }
    
    @objc func showGroups() {
        // Запрос списка групп
        let request = VKRequest(method: "groups.get", parameters: ["extended": 1])
        request?.execute(resultBlock: { response in
            if let groups = response?.parsedModel as? VKAPIResponse, let items = groups.items {
                // Выводим список групп в консоль
                for item in items {
                    print(item.name)
                }
            }
        }, errorBlock: { error in
            print("Error")
            print(error?.localizedDescription)
        })
    }
    
    // Вызывается при переходе на экран списка групп
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Проверяем, авторизован ли пользователь в VK
        if VKSdk.isLoggedIn() {
            // Если пользователь авторизован, то сразу отправляем запрос на получение списка групп
            showGroups()
        } else {
            // Если пользователь не авторизован, открываем окно авторизации VK
            VKSdk.authorize(["groups"], withOptions: .disableSafariController)
        }
    }
    
    // Не забудь отписаться от уведомления при выходе из контроллера
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

/*5. Получать фотографии со страницы пользователя. Для этого необходимо изучить документацию, а затем выбрать правильный метод. Результат нужно выводить в консоль. Отображать фотографии не нужно.
Запрос должен отправляться только после перехода к экрану фотографий.*/

func getPhotosFromUser() {
    let accessToken = "your_access_token"
    let userId = "user_id"

    guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(accessToken)&owner_id=\(userId)&v=5.131") else {
        print("Invalid URL")
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            return
        }

        guard let data = data else {
            print("Data is empty")
            return
        }

        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let response = json["response"] as? [String: Any],
               let items = response["items"] as? [[String: Any]] {
                for item in items {
                    if let photoURLString = item["photo_604"] as? String,
                       let photoURL = URL(string: photoURLString) {
                        print(photoURL)
                    }
                }
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }

    task.resume()
}

// Вызов функции после перехода к экрану фотографий
getPhotosFromUser()