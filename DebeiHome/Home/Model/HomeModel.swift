//
//  HomeModel.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/15.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import Foundation
import HandyJSON

class HomeModel: HandyJSON {
    
    var dataLives = [DataLives]()
    var isSignIn: String?
    var msgCount: Int = 0
    var totalSubsidyNum: Int = 0
    var solidData = [SolidData]()
    var consumptionList = [ConsumptionList]()
    var virtualData: VirtualData?
    var noticeData = [NoticeData]()
    var docList = [DocList]()
   
    required init() {
        
    }
}
class DataLives: HandyJSON {
    
    var id: Int = 0
    var onlineTime: String?
    var describe: String?
    var link: String?
    var disabled: Bool = false
    var appType: Int = 0
    var createTime: String?
    var appName: String?
    var cover: String?
    var appIcon: String?
    var offlineTime: String?
    var appTitle: String?
    required init() {
        
    }
    
}

class SolidData: HandyJSON {
    
    var offlineTime: String?
    var id: Int = 0
    var describe: String?
    var onlineTime: String?
    var linkType: String?
    var link: String?
    var cover: String?
    var disabled: Bool = false
    var createTime: String?
    required init() {
        
    }
    
}

class ConsumptionList: HandyJSON {
    var consumptionID: String?
    var scoreCount: String?
    required init() {
        
    }
    
}

class VirtualData: HandyJSON {
    var totalUserNum: Int = 0
    var totalUserNumSort: String?
    var id: Int = 0
    var increaseUploadNum: Int = 0
    var totalAmount: Int = 0
    var totalAmountSort: String?
    var totalUploadNum: Int = 0
    var totalUploadNumSort: String?
    var increaseUserNum: Int = 0
    required init() {
        
    }
    
}

class NoticeData: HandyJSON {
    var messageStatus: Int = 0
    var linkUrl: String?
    var id: Int = 0
    var endTime: String?
    var title: String?
    var sendTime: Int = 0
    var linkType: String?
    var messageDescription: String?
    var messageType: Int = 0
    var createTime: Int = 0
    var disabled: Bool = false
    required init() {
        
    }
    
}

class DocList: HandyJSON {
    var disabled: Int = 0
    var content: String?
    var subtitle: String?
    var id: Int = 0
    var sortNum: Int = 0
    var title: String?
    var lastUpdateTime: Int = 0
    var createTime: Int = 0
    var icon: String?
    required init() {
        
    }
    
}


