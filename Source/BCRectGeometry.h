//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>
#import "BCGeometry.h"
#import "BCCornerGeometry.h"

CGRect BCRectWithSizeProportionallyInRect(CGSize size, CGRect rect);
CGRect BCRectWithSizeCenteredInRect(CGSize size, CGRect outer);
CGRect BCRectWithOriginAndSize(CGPoint point, CGSize size);
CGRect BCRectWithSizeProportionallyAroundRect(NSSize size, CGRect rect);
CGRect BCRectWithMarginAroundPoint(CGFloat margin, CGPoint point);

CGRect BCRectWithSizeSizeCenteredAtPoint(CGSize size, CGPoint point);
CGRect BCRectFromCoordinateSpaceRectToRect(CGRect rect, CGRect fromRect, CGRect toRect);

CGRect BCRectExpand(CGRect rect, CGFloat margin);
CGRect BCRectRelative(CGRect rect, CGRect outer);
CGRect BCRectAbsolute(CGRect rect, CGRect outer);
CGRect BCRectScale(CGRect r, CGFloat scale);

CGRect BCRectFromPoints(CGPoint point1, CGPoint point2);
CGRect BCUnionRectSafe(CGRect r1, CGRect r2);

BOOL BCRectFuzzyEqualToRect(CGRect rect1, CGRect rect2);
BOOL BCRectIsZero(CGRect rect);

CGFloat GKRectMinForAxis(CGRect rect, BCAxis axis);
CGFloat GKRectMaxForAxis(CGRect rect, BCAxis axis);
CGFloat GKRectSizeForAxis(CGRect rect, BCAxis axis);

CGRect GKRectWithSizeForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect GKRectWithMinForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect GKRectWithMaxForAxis(CGRect rect, CGFloat value, BCAxis axis);

CGPoint BCRectGetMid(CGRect rect);
CGRect GKRectWithMidX(CGRect rect, CGFloat midX);
CGRect GKRectWithMidY(CGRect rect, CGFloat midY);

CGRect GKRectResizeMinXTo(CGRect rect, CGFloat minX);
CGRect GKRectResizeMaxXTo(CGRect rect, CGFloat maxX);
CGRect GKRectResizeMinYTo(CGRect rect, CGFloat minY);
CGRect GKRectResizeMaxYTo(CGRect rect, CGFloat maxY);
CGRect GKRectResizeByPuttingCorner(CGRect rect, GKCorner corner, CGPoint point);
CGRect GKRectMoveToCorner(CGRect rect, GKCorner corner, CGPoint point);

CGPoint GKRectPointForCorner(CGRect rect, GKCorner corner);
GKCorner GKRectClosestCornerForPoint(CGRect rect, CGPoint point, CGFloat margin, NSUInteger cornerMask);
CGSize GKRectDistanceFromCornerToMid(CGRect rect, GKCorner corner);

NSComparisonResult GKRectCompare(CGRect rect1, CGRect rect2, BCAxis axis);

CGFloat GKRectValueForKey(CGRect rect, NSString *key);
CGRect GKRectNormalise(CGRect rect);
