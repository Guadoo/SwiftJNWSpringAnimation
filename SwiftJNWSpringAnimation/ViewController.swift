//
//  ViewController.swift
//  SwiftJNWSpringAnimation
//
//  Created by Liu Jingkai on 15/9/7.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化一个红色圆角方形
        let redBall = UIView(frame: CGRectMake(50, 50, 100, 100))
        redBall.backgroundColor = UIColor.redColor()
        redBall.layer.cornerRadius = 25
        self.view.addSubview(redBall)
        
        //创建JNW放大实例
        let scale = JNWSpringAnimation(keyPath: "transform.scale")
        scale.damping = 6       //阻尼
        scale.stiffness = 100   //伸展系数 弹簧伸缩的难度
        scale.mass = 2          //质量
        
        scale.fromValue = 0
        scale.toValue = 1
        
        redBall.layer.addAnimation(scale, forKey: scale.keyPath)
        //JNWSpring Animation默认会还原初始状态 所以设置结束状态
        redBall.transform = CGAffineTransformMakeScale(1, 1)
        
        
        //创建JNW旋转实例
        let rotation = JNWSpringAnimation(keyPath: "transform.rotation")
        rotation.damping = 6
        rotation.stiffness = 100
        rotation.mass = 2
        
        rotation.fromValue = 0
        rotation.toValue = M_PI_2
        
        redBall.layer.addAnimation(rotation, forKey: rotation.keyPath)
        redBall.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
    
        
        //创建JNW移动实例
        let translation = JNWSpringAnimation(keyPath: "transform.translation")
        translation.damping = 6
        translation.stiffness = 100
        translation.mass = 2
        
        //设置位移起始点和终止点
        translation.fromValue = NSValue(CGPoint: CGPoint(x: 50, y: 50))
        translation.toValue = NSValue(CGPoint: CGPoint(x: 300, y: 100))

        redBall.layer.addAnimation(translation, forKey: translation.keyPath)
        redBall.transform = CGAffineTransformMakeTranslation(300, 100)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

