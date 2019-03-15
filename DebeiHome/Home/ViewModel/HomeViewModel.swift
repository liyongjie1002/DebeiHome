//
//  HomeViewModel.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/15.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import Foundation
import UIKit
import HandyJSON
 
enum HomeViewModelItemType {
    case header
    case dataAsset
    case dataLives
    case dataService
    case debeiIndex
    case platform
    case footer
}
protocol HomeViewModelItem {
    var itemType: HomeViewModelItemType { get }
    var sectionTitle: String { get }
    var itemSize: CGSize { get }
    var itemCount: Int { get }
    
}

class HomeViewModel: NSObject {
    var items = [HomeViewModelItem]()
    override init() {
        super.init()
        let data = dataFromFile("HomeModel")
        let json = String(data: data!, encoding: .utf8)
        if let homeModel = JSONDeserializer<HomeModel>.deserializeFrom(json: json!, designatedPath: "data") {
            
            let headerItem = HomeViewModelHeaderItem()
            items.append(headerItem)
            
            let assetItem = HomeViewModelAssetItem(totalSubsidyNum: homeModel.totalSubsidyNum)
            items.append(assetItem)
            
            let dataLives = homeModel.dataLives
            if !dataLives.isEmpty {
                let dataLivesItem = HomeViewModelDataLivesItem(dataLives: homeModel.dataLives)
                items.append(dataLivesItem)
            }
            
            let dataServiceItem = HomeViewModelDataServiceItem()
            items.append(dataServiceItem)
            
            let debeiIndexItem = HomeViewModelDebeiIndexItem()
            items.append(debeiIndexItem)
            
            let platform = homeModel.docList
            if !platform.isEmpty {
                let platformItem = HomeViewModelPlatformItem(platform: homeModel.docList)
                items.append(platformItem)
            }
            
            let footerItem = HomeViewModelFooterItem()
            items.append(footerItem)
        }
        
    }
}
class HomeViewModelHeaderItem: HomeViewModelItem {
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: 400)
    }
    
    var itemType: HomeViewModelItemType {
        return .header
    }
    var sectionTitle: String {
        return ""
    }
    var itemCount: Int {
        return 0
    }

}
class HomeViewModelAssetItem: HomeViewModelItem {
    var itemType: HomeViewModelItemType {
        return .dataAsset
    }
    
    var sectionTitle: String {
        return "数据资产"
    }
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: 124)
    }
    
    var itemCount: Int {
        return 1
    }
    
    var totalSubsidyNum: Int = 0
    
    init(totalSubsidyNum: Int) {
        self.totalSubsidyNum = totalSubsidyNum
    }
}
class HomeViewModelDataLivesItem: HomeViewModelItem {
    var itemType: HomeViewModelItemType {
        return .dataLives
    }
    
    var sectionTitle: String {
        return "数据生活"
    }
    
    var itemSize: CGSize {
        return CGSize(width: (kScreenWidth -  3*12 - 5)/2, height: ((kScreenWidth-3*12-5)/2)*(95.0/168.0)+10)
    }
    
    var itemCount: Int {
        return dataLives.count
    }
    
    var dataLives: [DataLives]
    
    init(dataLives: [DataLives]) {
        self.dataLives = dataLives
    }
    
}
class HomeViewModelDataServiceItem: HomeViewModelItem {
    var itemType: HomeViewModelItemType {
        return .dataService
    }
    
    var sectionTitle: String {
        return "数据服务"
    }
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: ((kScreenWidth-38)/3)*(83.0/124.0)+30+21)
    }
    
    var itemCount: Int {
        return 1
    }
    
    
}
class HomeViewModelDebeiIndexItem: HomeViewModelItem {
    var itemType: HomeViewModelItemType {
        return .debeiIndex
    }
    
    var sectionTitle: String {
        return "得呗指数"
    }
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: 396)
    }
    
    var itemCount: Int {
        return 1
    }
}
class HomeViewModelPlatformItem: HomeViewModelItem {
    
    var itemType: HomeViewModelItemType {
        return .platform
    }
    
    var sectionTitle: String {
        return "平台保障"
    }
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: 95)
    }
    
    var itemCount: Int {
        return platform.count
    }
    
    var platform: [DocList]
    
    init(platform: [DocList]) {
        self.platform = platform
    }

}
class HomeViewModelFooterItem: HomeViewModelItem {
    var itemType: HomeViewModelItemType {
        return .footer
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var itemSize: CGSize {
        return CGSize(width: kScreenWidth, height: 50)
    }
    
    var itemCount: Int {
        return 0
    }
}
