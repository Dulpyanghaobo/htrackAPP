//
//  HFSHomeWaterView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/12.
//

import UIKit

class HFSHomeWaterView: NiblessView {

    var tempIndex = 0
    
    var dataNums = 12
    
    let collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(HFSHomeWaterCell.self, forCellWithReuseIdentifier:HFSHomeWaterCell.identidifer)
        collectionView.delegate = self
        collectionView.dataSource = self
        p_setUpUI()
    }

    func p_setUpUI() {
        addSubview(collectionView)
        p_addMasonry()
    }
    func p_addMasonry() {
        collectionView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().offset(0)
        }
    }
    func p_setUpData() {
        
    }
    
}

extension HFSHomeWaterView : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click this")
    }
}

extension HFSHomeWaterView : UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataNums
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HFSHomeWaterCell.identidifer, for: indexPath) as! HFSHomeWaterCell
        cell.fullWaterIndex = tempIndex
        cell.index = indexPath.item + 1
        cell.delegate = self
        return cell
    }
    
    
}

extension HFSHomeWaterView : UICollectionViewDelegateFlowLayout
{
    
}

extension HFSHomeWaterView : HFSHomeWaterCellDelegate
{
    
    
    func addWater(index : Int)
    {
        var tempNoFullIndex = 0
        /// 喝的水
        tempIndex = index
        if (index > 5) {
            tempNoFullIndex = index
            
        } else {
            tempNoFullIndex = 6
        }
        dataNums = tempNoFullIndex + 1
        collectionView.reloadData()
    }
}
