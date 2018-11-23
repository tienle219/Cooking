//
//  ConnecDB.swift
//  Cooking
//
//  Created by Tien Le on 11/21/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import Foundation
import SQLite
class ConnecDB: NSObject {
    
    fileprivate static let instance:ConnecDB = ConnecDB()
    static func share() -> ConnecDB {
        return .instance
    }
    
    func getDataToDB(completionHandle: @escaping ([Dish]?) -> Void) {
        do {
            var arrDish: [Dish] = []
            let db = try Connection(AppResource.bundle.path(forResource: "cooking2", ofType: "sqlite")!)
            for row in try db.prepare("SELECT *FROM Student"){
                guard let name = row[1] as? String , let urlimg = row[2] as? String , let _id = row[3] as? Int64, let cachlam = row[4] as? String else{
                    return
                }
                let dish = Dish()
                dish.name = name
                dish._urlImg = urlimg
                dish._id = _id
                dish.cachlam = cachlam
                arrDish.append(dish)
            }
            completionHandle(arrDish)
        }catch ( let error){
            print("Error : \(error)")
            completionHandle(nil)
        }
    }
}
