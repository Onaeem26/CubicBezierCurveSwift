//
//  ViewController.swift
//  BezierCurve
//
//  Created by Muhammad Osama Naeem on 4/18/20.
//  Copyright © 2020 Muhammad Osama Naeem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bezierPath = UIBezierPath()
    let data = [CGPoint(x: 60, y: 150), CGPoint(x: 140, y: 300),CGPoint(x: 230, y: 140), CGPoint(x: 310, y: 250), CGPoint(x: 390, y: 100), CGPoint(x: 490, y: 200), CGPoint(x: 580, y: 270),CGPoint(x: 650, y: 30) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = BezierConfiguration()
        let controlPoints = config.configureControlPoints(data: data)
        
        
        createPoints()
        
        for i in 0..<data.count {
            let point = data[i]
            if i == 0 {
                bezierPath.move(to: point)
            }else {
                let segment = controlPoints[i - 1]
                bezierPath.addCurve(to: point, controlPoint1: segment.firstControlPoint, controlPoint2: segment.secondControlPoint)
            }
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.lineWidth = 4
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = .none
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 2.5
        
        shapeLayer.add(animation, forKey: "drawKeyAnimation")
        
    }
    
    func createPoints() {
        for point in data {
          let circleLayer = CAShapeLayer()
          circleLayer.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
          circleLayer.path = UIBezierPath(ovalIn: circleLayer.bounds).cgPath
          circleLayer.fillColor = UIColor.red.cgColor
          circleLayer.position = point
          view.layer.addSublayer(circleLayer)
        }
    }
    


}

