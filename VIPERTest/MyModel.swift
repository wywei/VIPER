//
//  MyModel.swift
//  VIPERTest
//
//  Created by 王亚威 on 2022/10/25.
//

import UIKit

class MyModel: NSObject {

    var name: String?
    var age: Int?
    var address: String?
    
    init(_ dict: [String: Any]) {
        print("wyw---dict--", dict)
//        super.init()
//        setValuesForKeys(dict)
        self.name = dict["name"] as? String ?? ""
        self.age = dict["age"] as? Int ?? 0
        self.address = dict["address"] as? String ?? ""
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
