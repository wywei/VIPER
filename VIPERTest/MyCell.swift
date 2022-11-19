//
//  MyCell.swift
//  VIPERTest
//
//  Created by 王亚威 on 2022/10/25.
//

import UIKit

enum MyCellBtnType {
    case share      // 分享
    case like       // 喜欢
    case collection // 收藏
}

protocol MyCellDelegate: NSObjectProtocol {
    func cell(_ cell: MyCell, didClicked type: MyCellBtnType, at indexPath: IndexPath)
}

extension UITableViewCell {
    var indexPath: IndexPath {
        guard let tableView = self.superview as? UITableView,
              let indexPath = tableView.indexPath(for: self) else { return IndexPath.init(row: 0, section: 0) }
        return indexPath
    }
}

extension UICollectionViewCell {
    var indexPath: IndexPath {
        guard let collectionView = self.superview as? UICollectionView,
              let indexPath = collectionView.indexPath(for: self) else { return IndexPath.init(row: 0, section: 0) }
        return indexPath
    }
}

class MyCell: UITableViewCell {
    
    weak var delegate: MyCellDelegate?
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
      
    // 点击分享
    @IBAction func shareBtnClicked(_ sender: UIButton) {
        delegate?.cell(self, didClicked: .share, at: indexPath)
    }

    // 点击喜欢
    @IBAction func likeBtnClicked(_ sender: UIButton) {
        delegate?.cell(self, didClicked: .like, at: indexPath)
    }
    
    // 点击收藏
    @IBAction func collectionBtnClicked(_ sender: UIButton) {
        delegate?.cell(self, didClicked: .collection, at: indexPath)
    }

//    var model: MyModel? {
//        didSet {
//            guard let model = model else { return }
//            iconImageView.backgroundColor = UIColor.red
//            
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
