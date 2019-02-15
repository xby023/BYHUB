//
//  BYHUB.swift
//  BYHUB_Swift
//
//  Created by xby023 on 2019/1/31.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit
import SnapKit

enum BYHUBShowType {
    case  BYHUBShowTypeSuccess
    case  BYHUBShowTypeError
    case  BYHUBShowTypeMessage
    case  BYHUBShowTypeLoading
}

class BYHUB: UIView {
    
    //单利
    static let BYHUBManager = BYHUB()
    
    //弹窗黑色背景
    var aletView: UIView?
    
    //内容标签
    var infoLabel: UILabel?
    
    //图标
    var iconView: UIImageView?
    
    var successAnimationView: BYSuccessAminationView?
    
    var errorAnimationView: BYErrorAminationView?
    
    var alertAnimationView: BYAlertAnimationView?
    
    var loadingAnimationView: BYLoadingAnimationView?
    
    
    var showNumber = 0;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //HUB添加到根视图
        UIApplication.shared.keyWindow?.addSubview(self)
        
        //添加弹窗视图
        aletView = UIView()
        aletView?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        aletView?.layer.cornerRadius = 10
        aletView?.layer.masksToBounds = true
        aletView?.transform = CGAffineTransform(translationX: 0, y: -50)
        self.addSubview(aletView!)
        aletView?.snp.makeConstraints({ (make) in
            make.height.equalTo(95)
            make.width.equalTo(90)
            make.center.equalTo(UIApplication.shared.keyWindow!)
        })
        
        iconView = UIImageView()
        iconView?.frame = CGRect(x: 17, y: 8, width: 56, height: 56)
//        aletView?.addSubview(iconView!)
        
        successAnimationView = BYSuccessAminationView(frame: CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48))
        aletView?.addSubview(successAnimationView!)
        
        errorAnimationView = BYErrorAminationView(frame: CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48))
        aletView?.addSubview(errorAnimationView!)
        
        alertAnimationView = BYAlertAnimationView(frame: CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48))
        aletView?.addSubview(alertAnimationView!)
        
        loadingAnimationView = BYLoadingAnimationView(frame: CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48))
        aletView?.addSubview(loadingAnimationView!)
        
        infoLabel = UILabel()
        infoLabel?.frame = CGRect(x: 0, y: 62, width: 90, height: 26)
        infoLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        infoLabel?.textColor = UIColor.white
        infoLabel?.numberOfLines = 0
        infoLabel?.textAlignment = NSTextAlignment.center
        aletView?.addSubview(infoLabel!)

        //隐藏弹窗
        self.alpha = 0;
        
    }
    

    /// 成功
    ///
    /// - Parameter info: 信息
    public func showSuccessHUB(info: String){
       showNumber += 1
       errorAnimationView?.stopAnimation()
       alertAnimationView?.stopAnimation()
       loadingAnimationView?.stopAnimation()
//       iconView?.image = UIImage(named: "BYSUCCESS")
       successAnimationView?.starAnimation()
       iconView?.isHidden = true
       infoLabel?.text = info
       layoutForHUB(info: info)
       UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 1;
       })
       hiddenHUB(deadline: DispatchTime.now() + 1.5)
    }
    
    /// 错误
    ///
    /// - Parameter info: 信息
    public func showErrorHUB(info: String){
        showNumber += 1
        successAnimationView?.stopAnimation()
        alertAnimationView?.stopAnimation()
        loadingAnimationView?.stopAnimation()
//        iconView?.image = UIImage(named: "BYERROR")
        errorAnimationView?.starAnimation()
        iconView?.isHidden = true
        infoLabel?.text = info
        layoutForHUB(info: info)
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 1;
        })
        hiddenHUB(deadline: DispatchTime.now() + 1.5)
    }
    
    /// 消息
    ///
    /// - Parameter info: 信息
    public func showMessageHUB(info: String){
        showNumber += 1
        successAnimationView?.stopAnimation()
        errorAnimationView?.stopAnimation()
        loadingAnimationView?.stopAnimation()
//        iconView?.image = UIImage(named: "BYMARK")
        alertAnimationView?.starAnimation()
        iconView?.isHidden = true
        infoLabel?.text = info
        layoutForHUB(info: info)
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 1;
        })
        hiddenHUB(deadline: DispatchTime.now() + 1.5)
    }
    
    /// 加载
    ///
    /// - Parameter info: 信息
    public func showLoadingHUB(info: String){
        showNumber += 1
        successAnimationView?.stopAnimation()
        errorAnimationView?.stopAnimation()
        alertAnimationView?.stopAnimation()
        rotatingAnimation(icon: iconView!)
//        iconView?.image = UIImage(named: "BYLOAD")
        loadingAnimationView?.starAnimation()
        iconView?.isHidden = true
        infoLabel?.text = info
        layoutForHUB(info: info)
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 1;
        })
    }
    
    /// 隐藏弹窗
    ///
    /// - Parameters:
    ///   - deadline: 延时时长
    public func hiddenHUB(deadline: DispatchTime) {
        print("before: number = \(self.showNumber)")
        //通过 showNumber 来判断重复打开HUB时误关闭了HUB
        DispatchQueue.main.asyncAfter(deadline:deadline) {
            self.showNumber -= 1
            print("after: number = \(self.showNumber)")
            if self.showNumber < 0  {
                self.showNumber = 0
            } else if self.showNumber == 0  {
                UIView.animate(withDuration: 0.1, animations: {
                    self.alpha = 0
                })
            }
        }
    }
    
    private func rotatingAnimation(icon:UIImageView) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.7
        animation.fromValue = Double.pi * 2
        animation.toValue = 0
        animation.repeatCount = HUGE
        animation.fillMode = CAMediaTimingFillMode.both
        icon.layer.add(animation, forKey: "rotationX")
    }
    
    func layoutForHUB(info:String) {
    
        if info.count <= 5 {
            aletView?.snp.updateConstraints({ (make) in
                make.height.equalTo(95)
                make.width.equalTo(90)
                make.center.equalTo(UIApplication.shared.keyWindow!)
            })
            iconView?.frame = CGRect(x: 17, y: 8, width: 56, height: 56)
            successAnimationView?.frame = CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48)
            errorAnimationView?.frame = CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48)
            alertAnimationView?.frame = CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48)
            loadingAnimationView?.frame = CGRect(x: 17 + 4, y: 8 + 4, width: 48, height: 48)
            infoLabel?.frame = CGRect(x: 0, y: 62, width: 90, height: 26)
            
        } else {
            let statusLabelText: NSString = info as NSString
            let size = CGSize(width: 140, height: CGFloat(HUGE))
            let dic = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)]
            let strSize = statusLabelText.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes:dic, context: nil).size
            
            if strSize.height < 26 {
                
                let width = strSize.width + 30
                aletView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(95)
                    make.width.equalTo(width)
                    make.center.equalTo(UIApplication.shared.keyWindow!)
                })
                iconView?.frame = CGRect(x: (width - 56)/2, y: 8, width: 56, height: 56)
                successAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                errorAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                alertAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                loadingAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                infoLabel?.frame = CGRect(x: 15, y: 62, width: width - 30, height: 26)
            } else {
                let width = strSize.width + 30
                let labHeight = strSize.height + 8
                aletView?.snp.updateConstraints({ (make) in
                    make.height.equalTo(95 - 26 + labHeight)
                    make.width.equalTo(width)
                    make.center.equalTo(UIApplication.shared.keyWindow!)
                })
                iconView?.frame = CGRect(x: (width - 56)/2, y: 8, width: 56, height: 56)
                successAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                errorAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                alertAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                loadingAnimationView?.frame = CGRect(x: (width - 56)/2 + 4, y: 8 + 4, width: 48, height: 48)
                infoLabel?.frame = CGRect(x: 15, y: 62, width: width - 30, height: labHeight)
            }
    
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
