//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let boardView = BoardView()
        self.view.addSubview(boardView)
        
        boardView.snp.makeConstraints({ maker in
            maker.left.right.bottom.equalTo(0)
            maker.height.equalTo(self.view).multipliedBy(5.0 / 8)
        })
    }


}

