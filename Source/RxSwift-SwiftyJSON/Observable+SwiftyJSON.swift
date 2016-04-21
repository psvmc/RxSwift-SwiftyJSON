//
//  Observable+SwiftyJSON.swift
//  RxAlamofireDemo_Swift
//
//  Created by 张剑 on 16/4/21.
//  Copyright © 2016年 张剑. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

/**
 *  JSON转换错误
 */
struct ZJSwiftyJSONError : ErrorType {
    let domain: String
    let code: Int
    let message: String
    
    
    var _domain: String {
        return domain
    }
    
    var _code: Int {
        return code
    }
    
    var _message: String {
        return message
    }
}

// MARK: - 扩展ObservableType 转换String为JSON
public extension ObservableType where E == String {
    
    public func mapSwiftyJSON() -> Observable<JSON> {
        return flatMap { response -> Observable<JSON> in
            if let dataFromString = response.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                return Observable.just(json);
            } else {
                throw ZJObjectError(domain:"SwiftyJSON",code:100,message:"JSON转换错误");
            }  
        }
    }
    
    
    public func mapSwiftyObject<T: ZJSwiftyJSONAble>(type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            if let dataFromString = response.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                
                guard let mappedObject = T(jsonData: json) else {
                    throw ZJObjectError(domain:"SwiftyJSON",code:101,message:"对象转换错误");
                }
                return Observable.just(mappedObject);
            } else {
                throw ZJObjectError(domain:"SwiftyJSON",code:100,message:"JSON转换错误");
            }
        }
    }
    

    public func mapSwiftyArray<T: ZJSwiftyJSONAble>(type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            if let dataFromString = response.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                let mappedObjectsArray = json.arrayValue.flatMap { T(jsonData: $0) }
                return Observable.just(mappedObjectsArray);
            } else {
                throw ZJObjectError(domain:"SwiftyJSON",code:100,message:"JSON转换错误");
            }
        }
    }
    
}