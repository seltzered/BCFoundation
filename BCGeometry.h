//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#pragma mark - Rectangles
CGRect BCRectWithSizeProportionallyInRect(CGSize size, CGRect rect);
CGRect BCRectWithSizeCenteredInRect(CGSize size, CGRect outer);
CGRect BCRectExpand(CGRect rect, CGFloat margin);
CGRect BCRectRelative(CGRect rect, CGRect outer);
CGRect BCRectAbsolute(CGRect rect, CGRect outer);
CGRect BCRectWithMarginAroundPoint(CGFloat margin, CGPoint point);
CGRect BCRectWithSizeSizeCenteredAtPoint(CGSize size, CGPoint point);
BOOL BCRectFuzzyEqualToRect(CGRect rect1, CGRect rect2);

#pragma mark - Points
CGPoint BCPointRelative(CGPoint p, CGRect outer);
CGPoint BCPointAbsolute(CGPoint point, CGRect outer);
CGPoint BCPointInvert(CGPoint point);

CGPoint BCPointSubtractPoint(CGPoint point1, CGPoint point2);
CGPoint BCPointAddPoint(NSPoint point1, NSPoint point2);
CGPoint BCPointDivide(CGPoint point, CGFloat div);
CGSize BCOffsetBetweenPoints(CGPoint point1, NSPoint point2);
CGPoint BCPointWithOffset(CGPoint point, CGSize offset);

#pragma mark - Corners
CGPoint BCRectGetMid(CGRect rect);

#pragma mark - Logging
void BCLogRect(CGRect rect);
void BCLogSize(CGSize size);
void BCLogPoint(CGPoint point);

#pragma mark - Rounding
CGRect BCRectByRoundingRect(CGRect rect);
CGSize BCSizeByRoundingSize(CGSize size);
CGPoint BCPointByRoundingPoint(CGPoint point);
CGPoint BCPointByRoundingPointToStep(CGPoint point, CGFloat step);

#pragma mark - Converting
CGPoint BCPointFromSize(CGSize size);
CGSize BCSizeFromPoint(CGPoint point);
CGRect BCRectFromSize(CGSize size);
CGRect BCRectFromOriginAndSize(CGPoint point, CGSize size);
