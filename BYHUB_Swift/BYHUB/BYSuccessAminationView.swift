//
//  BYSuccessAminationView.swift
//  SwiftAnimation
//
//  Created by xby023 on 2019/2/11.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit

class BYSuccessAminationView: UIView {

    
    let lineWidth = 2.3
    
    var circleLayer: CAShapeLayer?
    var hookLayer: CAShapeLayer?
    
    var canShowAnimation = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        circleLayer = CAShapeLayer()
        circleLayer?.path = UIBezierPath(roundedRect: CGRect(x: CGFloat(lineWidth)/2, y: CGFloat(lineWidth)/2, width: (width - CGFloat(lineWidth)), height: (height - CGFloat(lineWidth))), cornerRadius: (height - CGFloat(lineWidth))).cgPath
        circleLayer?.fillColor = UIColor.clear.cgColor
        circleLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        circleLayer?.strokeColor = UIColor.white.cgColor
        circleLayer?.strokeStart = 0
        circleLayer?.strokeEnd = 0
        circleLayer?.lineWidth = CGFloat(lineWidth)
        circleLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        circleLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(circleLayer!)
        
        
        hookLayer = CAShapeLayer()
        let hookPath = UIBezierPath()
        hookPath.move(to: CGPoint(x: width / 10 * 2, y: height / 10 * 5))
        hookPath.addLine(to: CGPoint(x: width / 10 * 4, y: height / 10 * 7))
        hookPath.addLine(to: CGPoint(x: width / 10 * 8, y: height / 10 * 3))
        hookLayer?.path = hookPath.cgPath
        hookLayer?.fillColor = UIColor.clear.cgColor
        hookLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        hookLayer?.strokeColor = UIColor.white.cgColor
        hookLayer?.strokeStart = 0
        hookLayer?.strokeEnd = 0
        hookLayer?.lineWidth = CGFloat(lineWidth)
        hookLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        hookLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(hookLayer!)
    
    }
    
    //开始动画
    func starAnimation() {
        self.stopAnimation()
        canShowAnimation = true
        self.circleAnimation(layer: self.circleLayer!,duration: 0.3)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            if self.canShowAnimation == true {
               self.circleAnimation(layer: self.hookLayer!,duration: 0.1)
            }
        })
    }
    
    //结束动画
    func stopAnimation() {
        canShowAnimation = false
        self.circleLayer?.removeAllAnimations()
        self.hookLayer?.removeAllAnimations()
    }
 
    func circleAnimation(layer:CAShapeLayer,duration:TimeInterval) {
        let animation = CABasicAnimation()
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = duration
        //保持动画状态
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: "circleLayer")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
