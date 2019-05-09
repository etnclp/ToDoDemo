//
//  ListingViewModel.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 7.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Foundation

protocol ListingViewModel {
    /**
     The object that acts as arrays of to-do.
     */
    var elements: [Todo] { get }
    /**
     The object that acts as the delegate of the listing view model.
     */
    var delegate: ListingViewModelDelegate? { get set }
    /**
     Used to adding a new to-do.
     
     - Parameter todo: To-do to be added.
     */
    func add(todo: Todo) -> Void
    /**
     Used to removing given to-do.
     
     - Parameter todo: To-do to be removed.
     */
    func remove(todo: Todo) -> Void
    /**
     Used to update to-do check status
     
     - Parameters:
        - todo: To-do to be updated.
        - selected: Selected state value of given to-do.
     */
    func updateCheck(todo: Todo, selected: Bool) -> Void
    /**
     Triggers action(s) when the add button is tapped.
     */
    func addButtonAction() -> Void
}

/// The delegate of ListingViewModel object must adopt the ListingViewModelDelegate protocol.
protocol ListingViewModelDelegate: class {
    /**
     This function is triggered when table view in need to be refresh.
     */
    func listingViewModelRefresh()
}
