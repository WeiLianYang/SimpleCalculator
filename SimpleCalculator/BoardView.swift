//
//  Board.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/26.
//  操作面板
//

import UIKit
import SnapKit

class BoardView: UIView {
    
    var delegate: BoardButtonClickDelegate?
    
    let dataArray = ["0", ".", "%", "=",
                    "1", "2", "3", "+",
                    "4", "5", "6", "-",
                    "7", "8", "9", "*",
                    "AC", "DEL", "^", "/"]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    func initView() {
        // 声明前一个按钮
        var prevBtn: FunctionButton!
        for index in dataArray.indices {
            let button = FunctionButton()
            // 自动布局前，需要先添加到父View
            self.addSubview(button)
            // 使用 SnapKit 添加约束
            button.snp.makeConstraints({ maker in
                if index % 4 == 0 {
                    // 当按钮为每一行的第一个时，靠父视图左侧摆放
                    maker.left.equalTo(0)
                } else {
                    // 否则将按钮靠上一个按钮的右侧摆放
                    maker.left.equalTo(prevBtn.snp.right)
                }
                
                if index < 4 {
                    // 第一行按钮，靠父视图底部摆放
                    maker.bottom.equalTo(0)
                } else if index % 4 == 0 {
                    // 当按钮不在第一行，且是每行第一个按钮时，将按钮靠上一个按钮的顶部对齐
                    maker.bottom.equalTo(prevBtn.snp.top)
                } else {
                    // 否则将按钮的底部与上一个按钮的底部对齐
                    maker.bottom.equalTo(prevBtn.snp.bottom)
                }
                
                // 约束宽度为父视图宽度的 1/4
                maker.width.equalTo(button.superview!.snp.width).multipliedBy(0.25)
                // 约束高度为父视图高度的 1/5
                maker.height.equalTo(button.superview!.snp.height).multipliedBy(0.2)
            })
            
            button.tag = index
            // 添加点击事件
            button.addTarget(self, action: #selector(onButtonClick(button:)), for: .touchUpInside)
            // 设置标题
            button.setTitle(dataArray[index], for: .normal)
            // 赋值上一个按钮
            prevBtn = button
        }
    }
    
    @objc func onButtonClick(button: FunctionButton) {
        print(button.title(for: .normal) ?? "title is nil")
        delegate?.onBoardButtonClick(content: button.currentTitle ?? "")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// 面板按钮点击协议
protocol BoardButtonClickDelegate {
    func onBoardButtonClick(content: String)
}
