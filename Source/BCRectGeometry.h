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

CGFloat BCRectMinForAxis(CGRect rect, BCAxis axis);
CGFloat BCRectMaxForAxis(CGRect rect, BCAxis axis);
CGFloat BCRectSizeForAxis(CGRect rect, BCAxis axis);

CGRect BCRectWithSizeForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect BCRectWithMinForAxis(CGRect rect, CGFloat value, BCAxis axis);
CGRect BCRectWithMaxForAxis(CGRect rect, CGFloat value, BCAxis axis);

CGPoint BCRectGetMid(CGRect rect);
CGRect BCRectWithMid(CGRect rect, CGPoint point);

CGRect BCRectWithMidX(CGRect rect, CGFloat midX);
CGRect BCRectWithMidY(CGRect rect, CGFloat midY);

CGRect BCRectResizeMinXTo(CGRect rect, CGFloat minX);
CGRect BCRectResizeMaxXTo(CGRect rect, CGFloat maxX);
CGRect BCRectResizeMinYTo(CGRect rect, CGFloat minY);
CGRect BCRectResizeMaxYTo(CGRect rect, CGFloat maxY);
CGRect BCRectResizeByPuttingCorner(CGRect rect, BCCorner corner, CGPoint point);
CGRect BCRectMoveToCorner(CGRect rect, BCCorner corner, CGPoint point);

CGPoint BCRectPointForCorner(CGRect rect, BCCorner corner);
BCCorner BCRectClosestCornerForPoint(CGRect rect, CGPoint point, CGFloat margin, NSUInteger cornerMask);
CGSize BCRectDistanceFromCornerToMid(CGRect rect, BCCorner corner);

NSComparisonResult BCRectCompare(CGRect rect1, CGRect rect2, BCAxis axis);

CGFloat BCRectValueForKey(CGRect rect, NSString *key);
CGRect BCRectNormalise(CGRect rect);
CGRect BCRectWithSizeOnAxisAspectRatio(CGRect rect, CGFloat size, BCAxis axis, CGFloat aspectRatio);
CGRect BCRectMoveCornerToPoint(CGRect rect, BCCorner corner, CGPoint point);