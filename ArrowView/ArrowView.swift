//
//  ArrowView.swift
//  ArrowView
//
//  Created by Max Beizer on 2/11/15.
//  Copyright (c) 2015 Max Beizer. All rights reserved.
//

import UIKit

enum ArrowDirection: Int {
    case Up
    case Down
    case Left
    case Right
}

class ArrowView: UIView {
    
    var direction: ArrowDirection = .Up {
        didSet {
            switch direction {
            case .Up:
                transform = CGAffineTransformIdentity
            case .Down:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI))
            case .Left:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI_2))
            case .Right:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI_2 * 3.0))
            }
            setNeedsDisplay()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clearColor()
        self.direction = .Down
        
        // lots of gesture recognizers this one is tap
        let tapGesutureRecognizer = UITapGestureRecognizer(target: self, action: Selector("rotateArrow"))
        self.addGestureRecognizer(tapGesutureRecognizer)
    }
    
    func rotateArrow() {
        switch direction {
        case .Up:
            self.direction = .Right
        case .Down:
            self.direction = .Left
        case .Left:
            self.direction = .Up
        case .Right:
            self.direction = .Down
        }
    }

    override func drawRect(rect: CGRect) {
        // Drawing code
        let currentContext: CGContextRef  = UIGraphicsGetCurrentContext()
        
        let width: CGFloat = rect.size.width
        let height: CGFloat = rect.size.height
        
        let triangleCenterX: CGFloat = width / 2.0
        let triangleLeftX: CGFloat = rect.origin.x
        let triangleRightSideX: CGFloat = width
        let triangleTopY: CGFloat = rect.origin.y
        let triangleBottomY: CGFloat = height / 2.0
        
        let baseLeftX: CGFloat = width / 4.0
        let baseRightX: CGFloat = baseLeftX * 3.0
        let baseTopY: CGFloat = triangleBottomY
        let baseBottomY: CGFloat = height
        
        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, triangleCenterX, triangleTopY)
        CGPathAddLineToPoint(path, nil, triangleRightSideX, triangleBottomY)
        CGPathAddLineToPoint(path, nil, baseRightX, baseTopY)
        CGPathAddLineToPoint(path, nil, baseRightX, baseBottomY)
        CGPathAddLineToPoint(path, nil, baseLeftX, baseBottomY)
        CGPathAddLineToPoint(path, nil, baseLeftX, baseTopY)
        CGPathAddLineToPoint(path, nil, triangleLeftX, triangleBottomY)
        CGPathCloseSubpath(path)
        
        CGContextSetFillColorWithColor(currentContext, UIColor.whiteColor().CGColor )
        
        CGContextAddPath(currentContext, path)
        CGContextDrawPath(currentContext, kCGPathFill)
    }

}
