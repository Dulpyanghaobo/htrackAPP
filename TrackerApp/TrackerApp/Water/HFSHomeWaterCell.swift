//
//  HFSHomeWaterCell.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/12.
//

import UIKit

protocol HFSHomeWaterCellDelegate : NSObjectProtocol{
    func addWater(index : Int)
}

class HFSHomeWaterCell: UICollectionViewCell {
    
    var isFullWater = false {
        didSet {
            if (isFullWater == true) {
                fullImageView.isHidden = false
            } else {
                fullImageView.isHidden = true
            }
        }
    }
    
    static let identidifer = "HFSHomeWaterCell"
    
    var fullWaterIndex = 0
    
    /// 下标
    var index = 0 {
        didSet {
            if (fullWaterIndex >= index ) {
                isFullWater = true
            } else {
                isFullWater = false
            }
            
        }
    }
    
    weak var delegate : HFSHomeWaterCellDelegate?
    
    
    fileprivate let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "hfs_home_water_1")
        imageView.isUserInteractionEnabled = true
        return imageView
    } ()
    
    fileprivate let fullImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "hfs_home_water_2")
        imageView.isHidden = true
        return imageView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.addSubview(fullImageView)
        imageView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().offset(0)
        }
        fullImageView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().offset(0)
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didClickCell))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("demo")
    }
    
    
    @objc private func didClickCell() {
        self.delegate?.addWater(index:index)
        
    }
    
    
}
