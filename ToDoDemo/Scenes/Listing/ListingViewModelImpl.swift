//
//  ListingViewModelImpl.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import RealmSwift
import XCoordinator

class ListingViewModelImpl: ListingViewModel {
    
    // MARK: - Properties
    
    private let router: AnyRouter<AppRoute>
    private var realm = try! Realm()
    
    var elements: [Todo] {
        return Array(self.realm.objects(Todo.self))
    }
    
    weak var delegate: ListingViewModelDelegate?
    
    // MARK: - Initialization
    
    init(router: AnyRouter<AppRoute>) {
        self.router = router
    }
    
    // MARK: - ListingViewModel
    
    func add(todo: Todo) {
        try! realm.write {
            realm.add(todo)
        }
        delegate?.listingViewModelRefresh()
    }
    
    func remove(todo: Todo) {
        try! realm.write {
            realm.delete(todo)
        }
        delegate?.listingViewModelRefresh()
    }
    
    func updateCheck(todo: Todo, selected: Bool) {
        try! realm.write {
            todo.isCheck = selected
        }
    }
    
    func addButtonAction() {
        self.router.trigger(.addTodo)
    }
    
}
