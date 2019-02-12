//
//  BYErrorAminationView.swift
//  SwiftAnimation
//
//  Created by xby023 on 2019/2/11.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit

class BYErrorAminationView: UIView {

    
    let lineWidth = 2.3
    
    var circleLayer: CAShapeLayer?
    var leftLineLayer: CAShapeLayer?
    var rightLineLayer: CAShapeLayer?

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
        
        
        
        leftLineLayer = CAShapeLayer()
        let leftLinePath = UIBezierPath()
        leftLinePath.move(to: CGPoint(x: width / 10 * 2.5, y: height / 10 * 2.5))
        leftLinePath.addLine(to: CGPoint(x: width / 10 * 7.5, y: height / 10 * 7.5))
        leftLineLayer?.path = leftLinePath.cgPath
        leftLineLayer?.fillColor = UIColor.clear.cgColor
        leftLineLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        leftLineLayer?.strokeColor = UIColor.white.cgColor
        leftLineLayer?.strokeStart = 0
        leftLineLayer?.strokeEnd = 0
        leftLineLayer?.lineWidth = CGFloat(lineWidth)
        leftLineLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        leftLineLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(leftLineLayer!)
        
        
        rightLineLayer = CAShapeLayer()
        let rightLinePath = UIBezierPath()
        rightLinePath.move(to: CGPoint(x: width / 10 * 7.5, y: height / 10 * 2.5))
        rightLinePath.addLine(to: CGPoint(x: width / 10 * 2.5, y: height / 10 * 7.5))
        rightLineLayer?.path = rightLinePath.cgPath
        rightLineLayer?.fillColor = UIColor.clear.cgColor
        rightLineLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        rightLineLayer?.strokeColor = UIColor.white.cgColor
        rightLineLayer?.strokeStart = 0
        rightLineLayer?.strokeEnd = 0
        rightLineLayer?.lineWidth = CGFloat(lineWidth)
        rightLineLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        rightLineLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(rightLineLayer!)
        
    }
    
    func starAnimation() {
        self.stopAnimation()
        self.circleAnimation(layer: self.circleLayer!,duration: 0.3)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            self.circleAnimation(layer: self.leftLineLayer!,duration: 0.1)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {
                self.circleAnimation(layer: self.rightLineLayer!,duration: 0.1)
            })
        })
    }
    
    func stopAnimation() {
        self.circleLayer?.removeAllAnimations()
        self.leftLineLayer?.removeAllAnimations()
        self.rightLineLayer?.removeAllAnimations()
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
