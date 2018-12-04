//
//  ViewController.swift
//  RXTest
//
//  Created by 姬冠杰 on 2018/12/3.
//  Copyright © 2018年 姬冠杰. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var acountTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var summitBt: UIButton!
    let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController {
    // 账号密码绑定到一起
    func test1() {
        Observable.combineLatest(acountTextField.rx.text.orEmpty, passTextField.rx.text.orEmpty) { (test1, test2) -> String in
            return "账号:\(test1) 密码:\(test2)"
            }.bind(to: countLabel.rx.text).disposed(by: dispose)
    }
}
