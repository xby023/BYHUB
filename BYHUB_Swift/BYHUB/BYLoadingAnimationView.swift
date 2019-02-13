//
//  BYLoadingAnimationView.swift
//  SwiftAnimation
//
//  Created by xby023 on 2019/2/12.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit

class BYLoadingAnimationView: UIView {

    
    let lineWidth = 2.3
    
    var circleLayer: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        circleLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: width/2, y: height/2), radius: (height - CGFloat(lineWidth))/2, startAngle: -CGFloat(Float.pi)/2, endAngle: CGFloat(Float.pi) * 2 * 0.9 - CGFloat(Float.pi)/2, clockwise: true)
        circleLayer?.path = path.cgPath
        circleLayer?.fillColor = UIColor.clear.cgColor
        circleLayer?.fillRule = CAShapeLayerFillRule.init(rawValue: "even-odd")
        circleLayer?.strokeColor = UIColor.white.cgColor
        circleLayer?.strokeStart = 0
        circleLayer?.strokeEnd = 0
        circleLayer?.lineWidth = CGFloat(lineWidth)
        circleLayer?.lineJoin = CAShapeLayerLineJoin.init(rawValue: "round")
        circleLayer?.lineCap = CAShapeLayerLineCap.init(rawValue: "round")
        self.layer.addSublayer(circleLayer!)
    }
    
    //开始动画
    func starAnimation() {
        self.stopAnimation()
        self.toCircleAnimation(layer: self.circleLayer!,duration: 0.4,fromValue: 0,toValue: 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.38) {
            self.rotatingAnimation(layer: self.layer, duration: 0.7)
        }
    }
    
    //结束动画
    func stopAnimation() {
        self.circleLayer?.removeAllAnimations()
        self.layer.removeAllAnimations()
    }

    
    func toCircleAnimation(layer:CAShapeLayer,duration:TimeInterval,fromValue:CGFloat,toValue:CGFloat) {
        let animation = CABasicAnimation()
        animation.keyPath = "strokeEnd"
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.repeatCount = 1
        animation.duration = duration
        //保持动画状态
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.setValue("BYLoadingAnimation1", forKey: "animation")
        layer.add(animation, forKey:"BYLoadingAnimation1")
    }
    
    func fromCircleAnimation(layer:CAShapeLayer,duration:TimeInterval,fromValue:CGFloat,toValue:CGFloat) {
        let animation = CABasicAnimation()
        animation.keyPath = "strokeEnd"
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.repeatCount = HUGE
        animation.duration = duration
        //保持动画状态
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.setValue("BYLoadingAnimation2", forKey: "animation")
        layer.add(animation, forKey: "BYLoadingAnimation2")
    }

    
    private func rotatingAnimation(layer:CALayer,duration:TimeInterval) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = Double.pi * 2
        animation.repeatCount = HUGE
        animation.fillMode = CAMediaTimingFillMode.both
        layer.add(animation, forKey: "rotationX")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
