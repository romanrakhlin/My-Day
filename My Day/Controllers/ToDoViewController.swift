//
//  ToDoViewController.swift
//  My Day
//
//  Created by Roman Rakhlin on 19.12.2019.
//  Copyright © 2019 Roman Rakhlin. All rights reserved.
//

import UIKit
import MessageUI

class ToDoViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var titleTextField : UITextField!
    @IBOutlet weak var isCompleteButton : UIButton!
    @IBOutlet weak var notesTextView : UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var todo : ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            notesTextView.text = todo.notes
        } else {}

        updateSaveButtonState()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(150)
        switch indexPath {
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        default:
            break
        }
    }
    
    @IBAction func textEditChanges(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        titleTextField.resignFirstResponder()
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let title = titleTextField.text!
        let isComlete = isCompleteButton.isSelected
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComlete, notes: notes)
    }
}
