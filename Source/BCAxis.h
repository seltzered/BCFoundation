//  Created by Pieter Omvlee on 16/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger , BCAxis) {
  BCAxisHorizontal = 0,
  BCAxisVertical   = 1
};

BCAxis BCAxisFlip(BCAxis axis);
CGFloat GKRectMinForAxis(CGRect rect, BCAxis axis);
CGFloat GKRectMaxForAxis(CGRect rect, BCAxis axis);
CGFloat GKRectSizeForAxis(CGRect rect, BCAxis axis);

CGRect GKRectWithSizeForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect GKRectWithMinForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect GKRectWithMaxForAxis(CGRect rect, CGFloat value, BCAxis axis);

CGRect GKRectWithMidX(CGRect rect, CGFloat midX);
CGRect GKRectWithMidY(CGRect rect, CGFloat midY);

CGFloat GKPointPositionForAxis(CGPoint point, BCAxis axis);
CGPoint GKPointWithPositionForAxis(CGPoint point, BCAxis axis, CGFloat value);
