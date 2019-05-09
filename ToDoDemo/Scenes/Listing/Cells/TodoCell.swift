//
//  TodoCell.swift
//  ToDoDemo
//
//  Created by Erdi Tunçalp on 8.05.2019.
//  Copyright © 2019 Erdi Tunçalp. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell, SpecialCell {
    
    // MARK: - Properties
    
    static var Height: CGFloat = UITableView.automaticDimension //52
    
    static var EstimatedHeight: CGFloat = 52
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var titleTextView: UITextView!
    
}
