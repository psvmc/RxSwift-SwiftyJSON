//
//  ViewController.swift
//  MoyaRxSwiftDemo_Swift
//
//  Created by 张剑 on 16/4/20.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var showTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func queryData(_ sender: AnyObject) {
        _ = string(.get, "http://www.psvmc.cn/navi_list.json",
                   parameters: nil)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { repos -> Void in
                    self.showTextView.text = repos;
                },
                onError: { (error) -> Void in
                    print("\(error)");
                    self.showTextView.text = "\(error)";
            })
    }
    
    /**
     用SwiftyJSON把结果转为对象
     
     - parameter sender:
     */
    @IBAction func queryDataSwiftyObject(_ sender: AnyObject) {
        _ = string(.get, "http://www.psvmc.cn/navi_list.json",
            parameters: ["userPhone":"15225178360","userLoginPswd":"123456"])
            .observeOn(MainScheduler.instance)
            .mapSwiftyObject(type: ZJResult_S<ZJArticle_S>.self)
            .subscribe(
                onNext: { repos -> Void in
                    self.showTextView.text = "用SwiftyJSON把结果转为对象\n"
                                           + "是否成功：\(repos.success!)\n"
                                           + "信息：\(repos.msg!)";
                },
                onError: { (error) -> Void in
                    self.showTextView.text = "\(error)";
            })
    }
    
    /**
     用SwiftyJSON把结果转为JSON
     
     - parameter sender:
     */
    @IBAction func queryDataSwiftyJsonClick(_ sender: AnyObject) {
        _ = string(.get, "http://www.psvmc.cn/navi_list.json",
            parameters: ["userPhone":"15225178360","userLoginPswd":"123456"])
            .observeOn(MainScheduler.instance)
            .mapSwiftyJSON()
            .subscribe(
                onNext: { repos -> Void in
                    self.showTextView.text = "用SwiftyJSON把结果转为JSON\n"
                                           + "是否成功：\(repos["success"].stringValue)\n"
                                           + "信息：\(repos["msg"].stringValue)";
                },
                onError: { (error) -> Void in
                    self.showTextView.text = "\(error)";
            })
    }
    
}

