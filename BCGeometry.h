//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#pragma mark - Rectangles
CGRect BCRectWithSizeProportionallyInRect(CGSize size, CGRect rect);
CGRect BCRectWithSizeCenteredInRect(CGSize size, CGRect outer);
CGRect BCRectWithOriginAndSize(CGPoint point, CGSize size);
CGRect BCRectWithSizeProportionallyAroundRect(NSSize size, NSRect rect);
CGRect BCRectWithMarginAroundPoint(CGFloat margin, CGPoint point);
CGRect BCRectWithSize(CGSize size);

CGRect BCRectWithSizeSizeCenteredAtPoint(CGSize size, CGPoint point);
CGRect BCRectFromCoordinateSpaceRectToRect(CGRect rect, CGRect fromRect, CGRect toRect);

CGRect BCRectExpand(CGRect rect, CGFloat margin);
CGRect BCRectRelative(CGRect rect, CGRect outer);
CGRect BCRectAbsolute(CGRect rect, CGRect outer);
CGRect BCRectScale(CGRect r, CGFloat scale);

CGRect BCRectFromPoints(NSPoint point1, NSPoint point2);
CGRect BCUnionRectSafe(NSRect r1, NSRect r2);

BOOL BCRectFuzzyEqualToRect(CGRect rect1, CGRect rect2);
BOOL BCRectIsZero(CGRect rect);


#pragma mark - Points
CGPoint BCPointRelative(CGPoint p, CGRect outer);
CGPoint BCPointAbsolute(CGPoint point, CGRect outer);
BOOL BCPointsEqualWithMargin(CGPoint p1, CGPoint p2, CGFloat margin);

CGPoint BCPointInvert(CGPoint point);
CGPoint BCPointSubtractPoint(CGPoint point1, CGPoint point2);
CGPoint BCPointAddPoint(NSPoint point1, NSPoint point2);
CGPoint BCPointDivide(CGPoint point, CGFloat div);
CGSize BCOffsetBetweenPoints(CGPoint point1, NSPoint point2);
CGPoint BCPointWithOffset(CGPoint point, CGSize offset);
CGPoint BCPointFromCoordinateSpaceRectToRect(CGPoint point, CGRect fromRect, CGRect toRect);

CGFloat BCDistanceBetweenPoints(NSPoint p1, NSPoint p2);


#pragma mark - Sizes
CGSize BCSizeScale(CGSize s, CGFloat scale);


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

