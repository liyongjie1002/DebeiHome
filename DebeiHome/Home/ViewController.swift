//
//  ViewController.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/15.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let homeViewModel = HomeViewModel()
    var dataArr = [HomeViewModelItemProtocol]()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CommonCell.self, forCellWithReuseIdentifier: "commoncell")
        collectionView.register(TitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        return collectionView
    }()
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        homeViewModel.requestData { (result) in
            dataArr = result
        }
    }
    // 配置视图
    private func configUI() {
        view.addSubview(contentView)
        contentView.addSubview(homeCollectionView)
    }

}


