//
//  Category.swift
//  JeopardyTrainer2
//
//  Created by Joseph Marasco on 12/13/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import Foundation

class Category {
    var id: Int
    var title: String
    var cluesCount: Int

    init(id: Int, title: String, cluesCount: Int) {
        self.id = id
        self.title = title
        self.cluesCount = cluesCount
    }
    
//    var id = 0
//    var title = ""
//    var cluesCount = 0
}
