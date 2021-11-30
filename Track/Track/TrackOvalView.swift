//
//  TrackOvalView.swift
//  Track
//
//  Created by Daniel Williams on 11/22/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit
import Parse

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}

class TrackOvalView: UIView {

    var path: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createTrack(percentStart: CGFloat, percentComplete: CGFloat, color: CGColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let lineWidth:CGFloat = 40.0
        
        layer.path = UIBezierPath(roundedRect: CGRect(x: lineWidth / 2, y: lineWidth / 2, width: self.frame.width - lineWidth, height: self.frame.height - lineWidth), cornerRadius: 150).cgPath
        
        layer.strokeColor = color
        layer.fillColor = nil
        layer.strokeStart = percentStart
        layer.strokeEnd = percentComplete
        layer.lineCap = .round
        layer.lineWidth = lineWidth
        
        // Animate stroke
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = percentComplete
        animation.duration = 0.7
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        layer.add(animation, forKey: "line")
        return layer
    }
    
    func drawTrack(percentStart:CGFloat, percentComplete: CGFloat){
        let redTrack = createTrack(percentStart: percentStart, percentComplete: percentComplete, color: UIColor(red: 1.00, green: 0.33, blue: 0.29, alpha: 1.00).cgColor)
        self.layer.addSublayer(redTrack)
    }
    
    func updateStats(){
        
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//    }


}
