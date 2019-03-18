//
//  HomeViewModelExtension.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/15.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewModel: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
// MARK: UICollectionViewDataSource
    // 分区数量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    // 每个分区item数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    // item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commoncell", for: indexPath)
        cell.contentView.backgroundColor = .randomColor
        return cell

    }
    // 头尾视图
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = items[indexPath.section]
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! TitleHeaderView
            view.headerTitle = item.sectionTitle
            view.itemType = item.itemType
            return view
        }
        return UICollectionReusableView()
    }
// MARK: UICollectionViewDelegateFlowLayout
    //首先要设置UICollectionView的delegate，才会执行以下方法。因为UICollectionViewDelegateFlowLayout是UICollectionViewDelegate的子协议
    // item大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = items[indexPath.section]
        switch item.itemType {
        case .header:
            return CGSize(width: kScreenWidth, height: 400)
        case .dataAsset:
            return CGSize(width: kScreenWidth, height: 300)
        case .dataLives:
            return CGSize(width: kScreenWidth, height: 200)
        case .dataService:
            return CGSize(width: kScreenWidth, height: 400)
        case .debeiIndex:
            return CGSize(width: kScreenWidth, height: 200)
        case .platform:
            return CGSize(width: kScreenWidth, height: 200)
        case .footer:
            return CGSize(width: kScreenWidth, height: 50)
        }
        
    }
    // 分区头部size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        let item = items[section]
        switch item.itemType {
        case .header, .footer:
            return CGSize(width: kScreenWidth, height: 0)
        case .dataAsset, .dataLives, .dataService, .debeiIndex, .platform:
            return CGSize(width: kScreenWidth, height: 50)
        }
        
    }
    
}

