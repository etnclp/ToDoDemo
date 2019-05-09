//
//  ToDoDemoTests.swift
//  ToDoDemoTests
//
//  Created by Erdi Tunçalp on 7.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import Quick
import Nimble
@testable import ToDoDemo

class ToDoDemoTests: QuickSpec {

    override func spec() {
        describe("Listing data test spec") {
            var viewModel: ListingViewModel!
            
            beforeEach {
                viewModel = ListingViewModelImpl(router: AppCoordinator().anyRouter)
            }
            
            it("deleting everything") {
                viewModel.elements.forEach({ (todo) in
                    viewModel.remove(todo: todo)
                })
            }
            
            it("let's add a few") {
                viewModel.add(todo: Todo(title: "To-Do 1", isCheck: false))
                viewModel.add(todo: Todo(title: "To-Do 2", isCheck: true))
                viewModel.add(todo: Todo(title: "To-Do 3", isCheck: false))
            }
            
            context("when the to-do is adding and updating", {
                it("is added") {
                    let count = viewModel.elements.count
                    
                    viewModel.add(todo: Todo(title: "Hello World", isCheck: false))
                    
                    expect(viewModel.elements.count) == count + 1
                }
                
                it("is update") {
                    guard let todo = viewModel.elements.filter({ $0.title == "Hello World" }).first else {
                        fail("No element to update")
                        return
                    }
                    
                    let isSelected = todo.isCheck
                    
                    viewModel.updateCheck(todo: todo, selected: !isSelected)
                    expect(todo.isCheck) == !isSelected
                }
            })
            
            context("when the to-do is deleting", {
                it("is delete") {
                    guard let todo = viewModel.elements.filter({ $0.title == "Hello World" }).first else {
                        fail("No element to delete")
                        return
                    }
                    
                    let count = viewModel.elements.count
                    
                    viewModel.remove(todo: todo)
                    
                    expect(viewModel.elements.count) == count - 1
                }
            })
        }
        
    }

}
