//
//  ScreenView.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/27.
//  显示用户输入的内容
//

import UIKit
import SnapKit

class ScreenView: UIView {
    
    // 显示用户输入信息
    var inputLabel: UILabel?
    // 显示历史输入信息
    var historyLabel: UILabel?
    // 用户输入内容
    var inputContent = ""
    // 历史输入内容
    var historyContent = ""
    // 所有数字字符
    let numberArray: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
    // 所有运算操作符
    let functionArray = ["+", "-", "*", "/", "%", "^"]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        initView()
    }
    
    func initView() {
        inputLabel = UILabel()
        historyLabel = UILabel()
        // 设置右对齐
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        // 设置字号
        inputLabel?.font = UIFont.systemFont(ofSize: 32)
        historyLabel?.font = UIFont.systemFont(ofSize: 28)
        // 设置颜色
        inputLabel?.textColor = UIColor.blue
        historyLabel?.textColor = UIColor.black
        // 设置文字大小可以根据字数进行适配
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        // 设置文字截断方式
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        // 设置文字不限行数
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0
        // 添加到父View
        self.addSubview(inputLabel!)
        self.addSubview(historyLabel!)
        
        // 自动布局
        inputLabel?.snp.makeConstraints({ maker in
            maker.left.equalTo(10)
            maker.right.bottom.equalTo(-10)
            maker.height.equalTo(inputLabel!.superview!.snp.height)
                .multipliedBy(0.5).offset(-10)
        })
        
        historyLabel?.snp.makeConstraints({ maker in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.top.equalTo(20)
            maker.height.equalTo(inputLabel!.superview!.snp.height)
                .multipliedBy(0.5).offset(-10)
        })
    }
    
    // 输入信息
    func acceptInput(_ content: String) {
        print(content, content.last)
        if numberArray.contains(content.last!) && functionArray.contains(content) {
            return
        }
        
        if inputContent.count > 0 {
            // 非首次输入
            if numberArray.contains(inputContent.last!) {
                // 数字后面可以任意输入
                inputContent.append(content)
                inputLabel?.text = inputContent
            } else {
                // 运算符后面只能输入数字
                if numberArray.contains(content.last!) {
                    // 如果输入的是数字
                    inputContent.append(content)
                    inputLabel?.text = inputContent
                }
            }
        } else {
            // 只有数字可以作为运算表达式的首个字符
            if numberArray.contains(content.last!) {
                inputContent.append(content)
                inputLabel?.text = inputContent
            }
        }
    }
    
    // 刷新历史
    func refreshHistory() {
        historyContent = inputContent
        historyLabel?.text = historyContent
    }
    
    // 清空内容
    func clearContent() {
        inputContent = ""
    }
    
    // 删除上一次输入的内容
    func deleteLatestInput() {
        if inputContent.count > 0 {
            inputContent.remove(at: inputContent.index(before: inputContent.endIndex))
            inputLabel?.text = inputContent
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
