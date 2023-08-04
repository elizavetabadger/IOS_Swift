/*Задание
1. В проект без сториборд добавить новый экран. На экране должно отображаться 5 ячеек. Раздел всего один. Ячейка должна соответствовать схеме (см. файл по ссылке)
2. По клику на кнопку “Войти” переходить к контроллеру из 1 пункта.
3. По клику на ячейку из пункта 1 должен быть переход на экран, напоминающий экран переписки. Экран должен быть приближен к схеме.*/

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let cellIdentifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Nf,kbwf
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
    }
    
    // Одна секция
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек - 5
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.imageView?.image = UIImage(named: "image")
        cell.textLabel?.text = "Название ячейки"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // Нажатия на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Кнопка "Войти"
            let controller = SomeController()
            navigationController?.pushViewController(controller, animated: true)
        } else {
            // Ячейка нажата
            let chatController = ChatController()
            navigationController?.pushViewController(chatController, animated: true)
        }
    }
}

class SomeController: UIViewController {
    // Контроллер, на который переходим при нажатии на кнопку "Войти"
}

class ChatController: UIViewController {
    // Контроллер, на который переходим при нажатии на ячейку
}