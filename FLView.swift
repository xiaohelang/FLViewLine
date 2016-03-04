//
//  FLView.swift
//  test_swift
//
//  Created by felix on 16/3/3.
//  Copyright © 2016年 felix. All rights reserved.
//

import UIKit

@IBDesignable
class FLView: UIView {
    
    //基本属性
    var borderTop:CALayer?
    var borderLeft:CALayer?
    var borderRight:CALayer?
    var borderBottom:CALayer?
    
    @IBInspectable var topBorderWith:CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = topBorderWith / UIScreen.mainScreen().scale;
        }
    }

    @IBInspectable var topBorderColor:UIColor?{
        didSet{
            self.layer.borderColor = topBorderColor?.CGColor
        }
    }
    
       
    @IBInspectable var borderCornerRadius:CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = borderCornerRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    self.borderTop?.frame = CGRectMake(0, 0, self.frame.size.width, self.borderTop!.frame.size.height)
    self.borderLeft?.frame = CGRectMake(0, 0, (self.borderLeft?.frame.size.height)!, self.frame.size.height)
    self.borderBottom?.frame = CGRectMake(0, self.frame.size.height-self.borderBottom!.frame.size.height, self.frame.size.width, self.borderBottom!.frame.size.height)
    self.borderRight?.frame = CGRectMake(self.frame.size.width-(self.borderRight?.frame.size.width)!, 0, self.borderRight!.frame.size.width, self.frame.size.height)
    }
}
