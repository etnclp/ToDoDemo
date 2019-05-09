//
//  AddTodoViewModelImpl.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import XCoordinator

class AddTodoViewModelImpl: AddTodoViewModel {
    
    // MARK: - Properties
    
    private let router: AnyRouter<AppRoute>
    
    // MARK: - Initialization
    
    init(router: AnyRouter<AppRoute>) {
        self.router = router
    }
    
    // MARK: - AddTodoViewModel
    
    func doneButtonAction(todo: Todo) {
        self.router.trigger(.addTodoClose(todo: todo))
    }
    
}
