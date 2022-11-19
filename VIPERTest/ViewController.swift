//
//  ViewController.swift
//  VIPERTest
//
//  Created by 王亚威 on 2022/10/22.
//

import UIKit

fileprivate let kCellID = "kCellID"


class ViewController: UIViewController {

//    lazy var dataArr =  [MyModel]()
//    var dataArr: [MyModel]?
    var presenters: [MyCellPresenter]?
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: -生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        AYDataTool.share.loadData1 { [weak self] models in
            guard let self = self else { return }
            self.presenters = models.compactMap { MyCellPresenter($0) }
            //self.dataArr = models
            self.tableview.reloadData()
        }
        
    }


}

//MARK: -初始化子视图
extension ViewController {
    
    fileprivate func setupUI() {
        tableview.register(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: kCellID)
        tableview.delegate = self
        tableview.dataSource = self
    }

}

//MARK: -网络请求
//extension ViewController {
//    func loadData1() {
//
//    }
//
//    func loadData2() {
//
//    }
//
//    func loadData3() {
//
//    }
//
//    func loadData4() {
//
//    }
//
//}

//MARK: -UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

//MARK: -UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenters?.count ?? 0
        //return dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID, for: indexPath) as! MyCell
        let presenter = self.presenters?[indexPath.row]
        presenter?.bindToCell(cell)
        //cell.model = dataArr?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
