//
//  AppCoordinator.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import XCoordinator

enum AppRoute: Route {
    case listing
    case addTodo
    case addTodoClose(todo: Todo)
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    private var home: Presentable?
    
    init() {
        super.init(initialRoute: .listing)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .listing:
            let listing = ListingViewController()
            listing.bind(to: ListingViewModelImpl(router: anyRouter))
            self.home = listing
            return .push(listing)
        case .addTodo:
            let addTodoVC = AddTodoViewController()
            addTodoVC.bind(to: AddTodoViewModelImpl(router: anyRouter))
            let nc = UINavigationController(rootViewController: addTodoVC)
            return .present(nc)
        case .addTodoClose(let todo):
            (self.home as? ListingViewController)?.viewModel.add(todo: todo)
            return .dismiss()
        }
    }
    
}
