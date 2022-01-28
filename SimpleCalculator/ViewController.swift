//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, BoardButtonClickDelegate {

    let boardView = BoardView()
    let screenView = ScreenView()
    let core = CalculatorCore()
    var needRefresh = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.addSubview(boardView)
        
        boardView.delegate = self
        boardView.snp.makeConstraints({ maker in
            maker.left.right.bottom.equalTo(0)
            maker.height.equalTo(self.view).multipliedBy(5.0 / 8)
        })
        
        self.view.addSubview(screenView)
        
        screenView.snp.makeConstraints({ maker in
            maker.left.right.top.equalTo(0)
            maker.bottom.equalTo(boardView.snp.top)
        })
    }
    
    func onBoardButtonClick(content: String) {
        if content == "AC" || content == "DEL" || content == "=" {
            switch content {
            case "AC":
                // 清空
                screenView.clearContent()
                screenView.refreshHistory()
            case "DEL":
                screenView.deleteLatestInput()
            case "=":
                let result = core.calculate(equation: screenView.inputContent)
                screenView.refreshHistory()
                screenView.clearContent()
                var str = String(result)
                if str.hasSuffix(".0") {
                    str = String(Int(result))
//                    str.removeSubrange(str.index(str.endIndex, offsetBy: -2)..<str.endIndex)
                }
                screenView.acceptInput(str)
                needRefresh = true
            default:
                screenView.refreshHistory()
            }
        } else {
            if needRefresh {
                screenView.clearContent()
                needRefresh = false
            }
            screenView.acceptInput(content)
        }
    }


}

