//
//  ZJUser.swift
//  HttpDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import SwiftyJSON

class ZJArticle_S: ZJSwiftyJSONAble {
    var title: String!
    var keywords: String!
    var description: String!
    var date: String!
    var path: String!
    var url: String!
    
    
    required init?(jsonData:JSON){
        self.title = jsonData["title"].stringValue
        self.keywords = jsonData["keywords"].stringValue
        self.description = jsonData["description"].stringValue
        self.date = jsonData["date"].stringValue
        self.path = jsonData["path"].stringValue
        self.url = jsonData["url"].stringValue
    }
}
