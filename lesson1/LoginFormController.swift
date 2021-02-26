//
//  LoginFormController.swift
//  lesson1
//
//  Created by Антон Сивцов on 26.01.2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    // transition delegate для сохранения ссылки для перехода
//    lazy var transitionDelegate = ScreenTransitionDelegate()
    let navigationDelegate = NavigationTransitionDelegate()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
                
        // Проверяем, верны ли они
        if login == "admin" && password == "1234" {
            print("успешная авторизация")
            
            // создаем viewController на который совершается переход
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "HeadViewController")
            
            // создаем переход
            
//            vc.modalPresentationStyle = .custom
//            vc.transitioningDelegate = transitionDelegate
            
            // показываем экран
            self.navigationController?.pushViewController(vc, animated: true)
//            self.present(vc, animated: true, completion: nil)
            
        } else {
            print("неуспешная авторизация")
            showLoginError()
        }
    }
    
    @IBAction func logOut(segue: UIStoryboardSegue) {
        
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let checkResult = checkUserData()
//
//        if !checkResult {
//            showLoginError()
//        }
//        return checkResult
//    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text, let password = passwordInput.text else { return false }
        
        if login == "admin" && password == "1234" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя, проверьте правильность login и password и повторите попытку", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
            
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        }
        
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.logInButton.layer.backgroundColor = UIColor.gray.cgColor
        self.logInButton.layer.cornerRadius = 16
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        self.navigationController?.delegate = navigationDelegate
        }
}
