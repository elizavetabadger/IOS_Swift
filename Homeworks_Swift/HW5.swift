/* На экране с диалогами в navigationBar добавить кнопку. По клику на
эту кнопку будем переходить в профиль.
2. Реализовать экран профиля. На нем должно содержаться имя
пользователя и фото.
3. Реализовать свою анимацию перехода от UITabBarController к
экрану профиля. */

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

/* 4. Создать новый проект (это будет проект 3), в котором будем
разрабатывать интерфейс с помощью SwiftUI.
5. Необходимо реализовать два экрана. На первом только текст или
кнопка или ссылка. По клику на текст/кнопку/ссылку необходимо
перейти на следующий экран. На следующем экране должна
отображаться таблица (после загрузки данных из сети), в которой
содержатся новости. В ячейке должно быть название новости и
дата публикации. Внешний вид на ваше усмотрение.
Для получения новостей изучите api:
https://docs.kudago.com/api/#page:новости,header:новости-списокновостей */

import SwiftUI

struct ContentView: View {
 var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NewsListView()) {
                    Text("News")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Main screen")
        }
    }
}

struct NewsListView: View {
    @State private var news: [News] = []
    
    var body: some View {
        List(news, id: \.id) { newsItem in
            VStack(alignment: .leading) {
                Text(newsItem.title)
                    .font(.headline)
                Text(newsItem.date)
                    .font(.subheadline)
            }
        }
        .navigationBarTitle("News")
        .onAppear() {
            loadNews()
        }
    }
    
    func loadNews() {
        guard let url = URL(string: "https://docs.kudago.com/api/#page:новости,header:новости-списокновостей") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([News].self, from: data) {
                    DispatchQueue.main.async {
                        self.news = decodedData
                    }
                    return
                }
            }
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct News: Codable, Identifiable {
    var id: Int
    var title: String
    var date: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}