//
//  AddTodoViewController.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, BindableType {
    
    // MARK: - Properties
    
    var viewModel: AddTodoViewModel!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var titleTextField: UITextField!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add a to-do"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonTapped))
        
        titleTextField.becomeFirstResponder()
        titleTextField.setLeftPaddingPoints(10)
    }
    
    // MARK: - Binding
    
    func bindViewModel() {
        
    }
    
    // MARK: - Actions
    
    @objc private func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        titleTextField.endEditing(true)
        self.dismiss(animated: true)
    }
    
    @objc private func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        titleTextField.endEditing(true)
        if let text = self.titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), text.count != 0 {
            self.viewModel.doneButtonAction(todo: Todo(title: text, isCheck: false))
        }
        self.dismiss(animated: true)
    }

}
