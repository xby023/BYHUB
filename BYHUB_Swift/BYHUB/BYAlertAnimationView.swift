//
//  BYAlertAnimationView.swift
//  SwiftAnimation
//
//  Created by xby023 on 2019/2/11.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit

class BYAlertAnimationView: UIView {

    
    let lineWidth = 2.3
    
    var circleLayer: CAShapeLayer?
    var upLineLayer: CAShapeLayer?
    var downLineLayer: CAShapeLayer?
    
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
        
        
        
        upLineLayer = CAShapeLayer()
        let upLinePath = UIBezierPath()
        upLinePath.move(to: CGPoint(x: width / 10 * 5, y: height / 10 * 2))
        upLinePath.addLine(to: CGPoint(x: width / 10 * 5, y: height / 10 * 2.5))
        upLineLayer?.path = upLinePath.cgPath
        upLineLayer?.fillColor = UIColor.clear.cgColor
        upLineLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        upLineLayer?.strokeColor = UIColor.white.cgColor
        upLineLayer?.strokeStart = 0
        upLineLayer?.strokeEnd = 0
        upLineLayer?.lineWidth = CGFloat(lineWidth)
        upLineLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        upLineLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(upLineLayer!)
        
        
        downLineLayer = CAShapeLayer()
        let downLinePath = UIBezierPath()
        downLinePath.move(to: CGPoint(x: width / 10 * 5, y: height / 10 * 3.5))
        downLinePath.addLine(to: CGPoint(x: width / 10 * 5, y: height / 10 * 8))
        downLineLayer?.path = downLinePath.cgPath
        downLineLayer?.fillColor = UIColor.clear.cgColor
        downLineLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        downLineLayer?.strokeColor = UIColor.white.cgColor
        downLineLayer?.strokeStart = 0
        downLineLayer?.strokeEnd = 0
        downLineLayer?.lineWidth = CGFloat(lineWidth)
        downLineLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        downLineLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(downLineLayer!)
    }
    
    
    func starAnimation() {
        self.stopAnimation()
        canShowAnimation = true
        self.circleAnimation(layer: self.circleLayer!,duration: 0.3)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            if self.canShowAnimation ==  true {
                self.circleAnimation(layer: self.upLineLayer!,duration: 0.05)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.05, execute: {
                    if self.canShowAnimation == true {
                       self.circleAnimation(layer: self.downLineLayer!,duration: 0.1)
                    }
                })
            }
        })
    }
    
    func stopAnimation() {
        canShowAnimation = false
        self.circleLayer?.removeAllAnimations()
        self.upLineLayer?.removeAllAnimations()
        self.downLineLayer?.removeAllAnimations()
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
