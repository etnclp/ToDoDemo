//
//  AddTodoViewModel.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import XCoordinator

protocol AddTodoViewModel {
    /**
     Triggers action(s) when the done button is tapped.
     
     - Parameter todo: The to-do being created.
     */
    func doneButtonAction(todo: Todo) -> Void
}
