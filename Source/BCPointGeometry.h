//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCGeometry.h"

CGFloat BCPointPositionForAxis(CGPoint point, BCAxis axis);
CGPoint BCPointWithPositionForAxis(CGPoint point, CGFloat value, BCAxis axis);

CGPoint BCPointRelative(CGPoint p, CGRect outer);
CGPoint BCPointAbsolute(CGPoint point, CGRect outer);
BOOL BCPointsEqualWithMargin(CGPoint p1, CGPoint p2, CGFloat margin);

CGPoint BCPointInvert(CGPoint point);
CGPoint BCPointSubtractPoint(CGPoint point1, CGPoint point2);
CGPoint BCPointAddPoint(CGPoint point1, CGPoint point2);
CGPoint BCPointDivide(CGPoint point, CGFloat div);
CGSize BCOffsetBetweenPoints(CGPoint point1, CGPoint point2);
CGPoint BCPointWithOffset(CGPoint point, CGSize offset);
CGPoint BCPointFromCoordinateSpaceRectToRect(CGPoint point, CGRect fromRect, CGRect toRect);

CGFloat BCDistanceBetweenPoints(CGPoint p1, CGPoint p2);

CGPoint BCPointBetweenPointsAt(NSPoint p1, NSPoint p2, CGFloat position);
CGPoint BCPointBetweenPoints(NSPoint p1, NSPoint p2);
CGPoint BCSnapPointToPointWithMargin(CGPoint p1, CGPoint p2, CGFloat margin);

CGPoint BCPointAtDistanceAndSlopeFromPoint(CGFloat distance, CGFloat slope, CGPoint point);
CGPoint BCPointAlignStraightAngleToPoint(CGPoint p1, CGPoint p2);

CGPoint BCPointSnapToPointWithMargin(CGPoint me, CGPoint other, CGFloat margin);
CGPoint BCPointSnapToRectWithMargin(CGPoint point, CGRect rect, CGFloat margin);
CGPoint BCPointSnapToLinesWithMargin(CGPoint point, NSArray *lines, CGFloat margin);