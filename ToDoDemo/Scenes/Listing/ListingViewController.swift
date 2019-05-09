//
//  ListingViewController.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 7.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit
import ActionKit

class ListingViewController: UIViewController, BindableType {
    
    // MARK: - Properties
    
    var viewModel: ListingViewModel!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "To-Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))

        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        TodoCell.register(to: tableView)
    }
    
    // MARK: - Binding
    
    func bindViewModel() {
        viewModel.delegate = self
    }
    
    // MARK: - Actions
    
    @objc private func addBarButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.addButtonAction()
    }
    
    private func showDeleteAlert(todoTitle: String, completion: @escaping (() -> Void)) {
        let alert = UIAlertController(title: "\"\(todoTitle)\" will be deleted forever.", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete to-do", style: .destructive, handler: { (_) in
            completion()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}

// MARK: - UITableViewDataSource

extension ListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        let element = viewModel.elements[indexPath.row]
        
        cell.titleTextView.text = element.title
        cell.checkButton.isSelected = element.isCheck
        
        cell.checkButton.addControlEvent(.touchUpInside) { [weak self] (button) in
            cell.checkButton.isSelected.toggle()
            let isSelected = cell.checkButton.isSelected
            self?.viewModel.updateCheck(todo: element, selected: isSelected)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let element = viewModel.elements[indexPath.row]
            self.showDeleteAlert(todoTitle: String(element.title.prefix(10))) { [weak self] in
                self?.viewModel.remove(todo: element)
            }
        }
    }
    
}

// MARK: - UITableViewDelegate

extension ListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TodoCell.Height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return TodoCell.EstimatedHeight
    }
    
}

// MARK: - ListingViewModelDelegate

extension ListingViewController: ListingViewModelDelegate {
    
    func listingViewModelRefresh() {
        self.tableView.reloadData()
    }
    
}
