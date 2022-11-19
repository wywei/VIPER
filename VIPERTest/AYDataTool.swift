//
//  AYDataTool.swift
//  VIPERTest
//
//  Created by 王亚威 on 2022/10/22.
//  该模块的网络请求都放在这里

import UIKit

fileprivate let url = "http://xxx.com"

class AYDataTool: NSObject {
    static let share = AYDataTool()
    private override init() { }

}

extension AYDataTool {
    func loadData1(finishedCallback: (([MyModel]) -> Void)) {
        let models = [
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"],
            ["name": "zhangsan",
             "age": 12,
             "address": "ShangHai"]
        ].map { MyModel($0) }
        
        finishedCallback(models)
    }
    
    func loadData2() {
        
    }
    
    func loadData3() {
        
    }
    
    func loadData4() {
        
    }
}
