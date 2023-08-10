/* На экране с беседами в navigationBar добавить кнопку. По клику на
эту кнопку будем переходить в профиль.
2. Реализовать экран профиля. На нем должно содержаться имя
пользователя и фото.
3. Реализовать свою анимацию перехода от UITabBarController к
экрану профиля.
4. Создать новый проект (это будет проект 3), в котором будем
разрабатывать интерфейс с помощью SwiftUI.
5. Необходимо реализовать два экрана. На первом только текст или
кнопка или ссылка. По клику на текст/кнопку/ссылку необходимо
перейти на следующий экран. На следующем экране должна
отображаться таблица (после загрузки данных из сети), в которой
содержатся новости. В ячейке должно быть название новости и
дата публикации. Внешний вид на ваше усмотрение.
Для получения новостей изучите api:
https://docs.kudago.com/api/#page:новости,header:новости-списокновостей */

import UIKit

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем кнопку в navigationBar
        let profileButton = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(openProfile))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc func openProfile() {
        // Создаем экран профиля
        let profileViewController = ProfileViewController()
        
        // Анимация перехода к экрану профиля
        UIView.transition(with: view.window!, duration: 0.3, options: .transitionFlipFromRight, animations: {
            // Устанавливаем rootViewController в UITabBarController на экран профиля
            UIApplication.shared.keyWindow?.rootViewController = profileViewController
        }, completion: nil)
    }

}

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем заголовок экрана профиля
        navigationItem.title = "Профиль"
        
        // Добавляем фото пользователя
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.center = view.center
        imageView.image = UIImage(named: "profile_photo")
        view.addSubview(imageView)
        
        // Добавляем имя пользователя
        let nameLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.maxY + 20, width: view.frame.width, height: 20))
        nameLabel.textAlignment = .center
        nameLabel.text = "Имя пользователя"
        view.addSubview(nameLabel)
    }

}
Результат:
На экране с беседами в navigationBar добавлена кнопка "Профиль". По клику на эту кнопку происходит animixticn и переход к экрану профиля. 
На экране профиля отображается фото пользователя и его имя.