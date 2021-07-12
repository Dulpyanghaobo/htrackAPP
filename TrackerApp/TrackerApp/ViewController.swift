//
//  ViewController.swift
//  HFSHealthApp
//
//  Created by 杨皓博 on 2021/7/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let water : HFSHomeWaterView = {
        let water = HFSHomeWaterView()
        return water
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(water)
        water.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().offset(0)
        }
    }


}

