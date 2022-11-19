//
//  Presenter.swift
//  VIPERTest
//
//  Created by 王亚威 on 2022/10/22.
//

import UIKit



class MyCellPresenter: NSObject {
    var model: MyModel?
    init(_ model: MyModel) {
        self.model = model
    }
}

extension MyCellPresenter {
    var name: String {
        var nameStr = ""
        if let name = model?.name {
            nameStr = name
        }
        return nameStr
    }
    
    var age: String {
        var ageTemp = 5
        if let age = model?.age, age > 0 {
            ageTemp = age
        }
        return "\(ageTemp)"
    }
    
    var address: String {
        var addressStr = ""
        if let address = model?.address {
            addressStr = address
        }
        return addressStr
    }
    
    func bindToCell(_ cell: UITableViewCell) {
        guard let cell = cell as? MyCell else { return }
        cell.delegate = self
        cell.iconImageView.backgroundColor = UIColor.red
        cell.nameLabel.text = name
        cell.ageLabel.text = age
        cell.addressLabel.text = address
    }
}

//MARK: -MyCellDelegate
extension MyCellPresenter: MyCellDelegate {
    
    func cell(_ cell: MyCell, didClicked type: MyCellBtnType, at: IndexPath) {
        switch type {
        case .share:
            print("share")
        case .like:
            print("like")
        case .collection:
            print("collection")
        }
        print("wyw----indexPath--", at.section, at.row)
    }
    
    
    func cell(_ cell: MyCell, didClicked type: MyCellBtnType) {
        switch type {
        case .share:
            print("share")
        case .like:
            print("like")
        case .collection:
            print("collection")
        }
    }
}
