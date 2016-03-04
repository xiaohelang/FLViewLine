//
//  FLViewLine.swift
//  test_swift
//
//  Created by felix on 16/3/3.
//  Copyright © 2016年 felix. All rights reserved.

/**

设置一个UIview的类型的不同边框的颜色

- top:    上边框的设置
- left:   左边框的设置
- bottom: 下边框的设置
- right:  有边框的设置

*/

import UIKit

enum LayerDirection:Int{
    case top = 0
    case left = 1
    case bottom = 2
    case right = 3
}

@IBDesignable
class FLViewLine: UIView {
    
    var topLayer:CALayer?
    var leftLayer:CALayer?
    var bottomLayer:CALayer?
    var rightLayer:CALayer?
    
    //上边
    @IBInspectable  var switchOfTopLayer:Bool = false
    @IBInspectable var colorOfTopLayer:UIColor = UIColor.clearColor()
    @IBInspectable var widthOfTopLayer:CGFloat = 0.0
    
    //左边
    @IBInspectable var switchOfLeftLayer:Bool = false
    @IBInspectable var colorOfLeftLayer:UIColor = UIColor.clearColor()
    @IBInspectable var widthOfLeftLayer:CGFloat = 0.0
    
    //下面
    @IBInspectable var switchOfBottomLayer:Bool = false
    @IBInspectable var colorOfBottomLayer:UIColor = UIColor.clearColor()
    @IBInspectable var widthOfBottomLayer:CGFloat = 0.0
    
    //右边
    @IBInspectable var switchOfRightLayer:Bool = false
    @IBInspectable var colorOfRightLayer:UIColor = UIColor.clearColor()
    @IBInspectable var widthOfRightLayer:CGFloat = 0.0
    
    //总的
    @IBInspectable var switchOfLayer:Bool = false
    @IBInspectable var widthOfLayer:CGFloat = 0.0
    @IBInspectable var colorOfLayer:UIColor = UIColor.clearColor()
    
    
    override func drawRect(rect: CGRect) {
        
        if switchOfLayer != true {
            
            self.setLayerLineWidth(self.switchOfTopLayer, customLayer: self.topLayer, direction: LayerDirection.top, color: self.colorOfTopLayer, widthOfLayer: self.widthOfTopLayer)
            self.setLayerLineWidth(self.switchOfLeftLayer , customLayer: self.leftLayer, direction:LayerDirection.left , color: self.colorOfLeftLayer, widthOfLayer: self.widthOfLeftLayer)
            self.setLayerLineWidth(self.switchOfBottomLayer, customLayer: self.bottomLayer, direction: LayerDirection.bottom, color: self.colorOfBottomLayer, widthOfLayer: self.widthOfBottomLayer)
            self.setLayerLineWidth(self.switchOfRightLayer, customLayer: self.rightLayer, direction: LayerDirection.right, color: self.colorOfRightLayer, widthOfLayer: self.widthOfRightLayer)
            
        }else{
            //这里是同一的颜色
            let layers:[CALayer?] = [ topLayer , leftLayer , bottomLayer , rightLayer ]
            let directions:[LayerDirection] = [.top , .left , .bottom , .right ]
            
            for direction in 0...3 {
                self.setLayerLineWidth(self.switchOfLayer , customLayer: layers[direction], direction: directions[direction], color: self.colorOfLayer, widthOfLayer: self.widthOfLayer)
            }
        }
    }
    
    func setLayerLineWidth(switchON:Bool , var customLayer:CALayer? , direction:LayerDirection , color:UIColor , widthOfLayer:CGFloat){
        
        if switchON == true {
            if customLayer != nil {
                customLayer?.removeFromSuperlayer()
            }
            
            customLayer = CALayer()
            customLayer?.borderWidth = widthOfLayer
            customLayer?.borderColor = color.CGColor
            
            switch direction {
            case .top:
                customLayer?.frame = CGRectMake(0, 0, self.frame.size.width, widthOfLayer)
            case .left:
                customLayer?.frame = CGRectMake(0, 0, widthOfLayer, self.frame.size.height)
            case .bottom:
                customLayer?.frame = CGRectMake(0, self.frame.size.height-widthOfLayer, self.frame.size.width , widthOfLayer)
            case .right:
                customLayer?.frame = CGRectMake(self.frame.size.width-widthOfLayer, 0, widthOfLayer, self.frame.size.height)
            }
            self.layer.addSublayer(customLayer!)
        }
    }
}
