//
//  Clues.swift
//  JeopardyTrainer2
//
//  Created by Joseph Marasco on 12/13/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Clues {
    var id = 0 // category id
    var cluesCount = 0 // # of clues
    var cluesArray: [Clue] = []
    var apiURL = "http://jservice.io/api/category/?id="
    
    func getData(completed: @escaping () -> () ) {
        Alamofire.request(apiURL+"\(id)").responseJSON { (response) in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                let numberOfClues = json["clues"].count
                for index in 0..<numberOfClues {
                    let clue = Clue()
                    clue.question = json["clues"][index]["question"].stringValue
                    clue.answer = json["clues"][index]["answer"].stringValue
                    clue.categoryID = json["clues"][index]["category_id"].intValue
                    clue.value = json["clues"][index]["value"].intValue
                    clue.clueID = json["clues"][index]["id"].intValue
                    self.cluesArray.append(clue)
                    print("clueArray[\(index)] = \(self.cluesArray[index].question))")
                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
            completed()
        }
    }
}
