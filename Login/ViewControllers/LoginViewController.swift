//
//  ViewController.swift
//  Login
//
//  Created by Dmitry on 06.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let users: [User] = User.getUsers()

    @IBOutlet var userNameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            showAlert(title: "Forgot username?", message: "Try this one: \(users[0].userName)")
        case 2:
            showAlert(title: "Forgot password?", message: "Try this one: \(users[0].password)")
        default:
            break
        }
    }
    
    @IBAction func loginButtonTapped() {
        tryLogin(with: userNameInput.text, and: passwordInput.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let homeVC = tabBarController.viewControllers?.first as! HomeViewController
        homeVC.userName = userNameInput.text!
    }
    
    private func tryLogin(with login: String?, and password: String?) {
        guard let username = login, let pass = password else {
            showAlert(title: "Oops!",message: "It seems you have entered wrong login or password, please try again")
            passwordInput.text = nil
            return
        }

        if users.contains(User(userName: username, password: pass)) {
            performSegue(withIdentifier: "doLogin", sender: nil)
            return
        } else {
            showAlert(title: "Oops!",message: "It seems you have entered wrong login or password, please try again")
            passwordInput.text = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameInput.text = nil
        passwordInput.text = nil
    }
}

extension LoginViewController {
    // MARK: Alerts
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: Keyboard actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            tryLogin(with: userNameInput.text, and: passwordInput.text)
        }
        
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
