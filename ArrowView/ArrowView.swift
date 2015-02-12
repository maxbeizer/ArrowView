//
//  ArrowView.swift
//  ArrowView
//
//  Created by Max Beizer on 2/11/15.
//  Copyright (c) 2015 Max Beizer. All rights reserved.
//

import UIKit

class ArrowView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
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
