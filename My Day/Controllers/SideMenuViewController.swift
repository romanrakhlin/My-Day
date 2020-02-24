//
//  SideMenuViewController.swift
//  My Day
//
//  Created by Roman Rakhlin on 19.12.2019.
//  Copyright © 2019 Roman Rakhlin. All rights reserved.
//

import UIKit
import Firebase

class SideMenuViewController: UITableViewController {
    
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            showMessage(signOutError.description, self)
            return()
        }
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: LOGIN_STORYBOARD)
        
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
