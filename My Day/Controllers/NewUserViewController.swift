//
//  NewUserViewController.swift
//  My Day
//
//  Created by Roman Rakhlin on 19.12.2019.
//  Copyright © 2019 Roman Rakhlin. All rights reserved.
//

import UIKit
import Firebase

class NewUserViewController: UIViewController {
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordFirstText: UITextField!
    @IBOutlet weak var passwordSecondText: UITextField!
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard !(emailText.text == "") else {
            showMessage("Enter email", self)
            return
        }
        guard !(passwordFirstText.text == "") else {
            showMessage("Enter password", self)
            return
        }
        guard !(passwordFirstText == passwordSecondText) else {
            showMessage("Passwords doesn't match.", self)
            return
        }
        Service.createUserFirebase(username: emailText.text!, password: passwordFirstText.text!, controller: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        emailText.text = ""
        passwordFirstText.text = ""
        passwordSecondText.text = ""
    }
}
