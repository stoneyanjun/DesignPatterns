//
//  ViewController.swift
//  DesignPatterns
//
//  Created by stone on 2022/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }

    private func test() {
        let atm = ATM([(.hundred, 10000),
                       (.fifty, 10000),
                       (.ten, 10000)])
        
        print(atm.withdraw(1305))
        
        let haseOper = HaseOperation("Best Door")
        haseOper.open()
        haseOper.close()
    }
}

