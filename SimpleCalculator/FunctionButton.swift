//
//  FunctionButton.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/26.
//  自定义功能按钮
//

import Foundation
import UIKit


class FunctionButton : UIButton {
    
    init() {
        // 自动布局，frame 设置 zero，等同(0,0,0,0)
        super.init(frame: CGRect.zero)
        // 为按钮添加边框
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.gray.cgColor
        // 设置字体颜色
        self.setTitleColor(UIColor.gray, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        self.setTitleColor(UIColor.red, for: .highlighted)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
