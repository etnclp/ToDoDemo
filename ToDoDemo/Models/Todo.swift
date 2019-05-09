//
//  Todo.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 7.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import RealmSwift

class Todo: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var isCheck = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(title: String, isCheck: Bool) {
        self.init()
        self.id = incrementID()
        self.title = title
        self.isCheck = isCheck
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
