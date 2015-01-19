//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCPointGeometry.h"
#import "BCRectGeometry.h"
#import "BCLineGeometry.h"

CGFloat GKPointPositionForAxis(CGPoint point, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    return point.x;
  else
    return point.y;
}

CGPoint GKPointWithPositionForAxis(CGPoint point, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    point.x = value;
  else
    point.y = value;
  
  return point;
}

CGPoint BCPointRelative(CGPoint p, CGRect outer) {
  p.x -= outer.origin.x;
  p.y -= outer.origin.y;
  if (outer.size.width > 0.001)
    p.x /= outer.size.width;
  if (outer.size.height > 0.001)
    p.y /= outer.size.height;
  return p;
}

CGPoint BCPointAbsolute(CGPoint point, CGRect outer) {
  point.x *= outer.size.width;
  point.y *= outer.size.height;
  point.x += outer.origin.x;
  point.y += outer.origin.y;
  return point;
}

BOOL BCPointsEqualWithMargin(CGPoint p1, CGPoint p2, CGFloat margin) {
  return BCDistanceBetweenPoints(p1, p2) < margin;
}


CGPoint BCPointInvert(CGPoint point) {
  return CGPointMake(-point.x,-point.y);
}

CGPoint BCPointSubtractPoint(CGPoint point1, CGPoint point2) {
  return CGPointMake(point1.x - point2.x, point1.y - point2.y);
}

CGPoint BCPointAddPoint(NSPoint point1, NSPoint point2) {
  return CGPointMake(point1.x + point2.x, point1.y + point2.y);
}

CGPoint BCPointDivide(CGPoint point, CGFloat div) {
  return CGPointMake(point.x / div, point.y / div);
}

CGSize BCOffsetBetweenPoints(CGPoint point1, NSPoint point2) {
  return CGSizeMake(point1.x - point2.x, point1.y - point2.y);
}

CGPoint BCPointWithOffset(CGPoint point, CGSize offset) {
  return CGPointMake(point.x+offset.width, point.y+offset.height);
}

CGPoint BCPointFromCoordinateSpaceRectToRect(CGPoint point, CGRect fromRect, CGRect toRect) {
  return BCPointAbsolute(BCPointRelative(point, fromRect), toRect);
}

CGFloat BCDistanceBetweenPoints(NSPoint p1, NSPoint p2) {
  return sqrt((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y));
}

CGPoint BCPointBetweenPointsAt(NSPoint p1, NSPoint p2, CGFloat position) {
  return CGPointMake(p1.x + (p2.x - p1.x) * position, p1.y + (p2.y - p1.y) * position);
}

CGPoint BCSnapPointToPointWithMargin(CGPoint p1, CGPoint p2, CGFloat margin) {
  if (ABS(p1.x - p2.x) < margin)
    p1.x = p2.x;
  if (ABS(p1.y - p2.y) < margin)
    p1.y = p2.y;
  return p1;
}

CGPoint BCPointAtDistanceAndSlopeFromPoint(CGFloat distance, CGFloat slope, CGPoint point) {
  CGPoint p = CGPointZero;
  
  CGAffineTransform t = CGAffineTransformIdentity;
  t = CGAffineTransformRotate(t, slope);
  t = CGAffineTransformTranslate(t, distance, 0);
  
  p = CGPointApplyAffineTransform(p, t);
  p.x += point.x;
  p.y += point.y;
  
  return p;
}

CGPoint BCPointAlignStraightAngleToPoint(CGPoint p1, CGPoint p2) {
  CGFloat slope = BCSlopeBetweenPoints(p2, p1);
  CGFloat distance = BCDistanceBetweenPoints(p2, p1);
  return BCPointAtDistanceAndSlopeFromPoint(distance, BCSlopeToStraightAngles(slope), p2);
}

CGPoint BCPointSnapToPointWithMargin(CGPoint me, CGPoint other, CGFloat margin) {
  if (ABS(me.x - other.x) < margin)
    me.x = other.x;
  if (ABS(me.y - other.y) < margin)
    me.y = other.y;
  return me;
}

CGPoint BCPointSnapToRectWithMargin(CGPoint point, CGRect rect, CGFloat margin) {
  CGPoint __block result = point;
  GKCornerEnumerate(^(GKCorner corner) {
    result = BCPointSnapToPointWithMargin(result, GKRectPointForCorner(rect, corner), margin);
  });
  return result;
}

CGPoint BCPointSnapToLinesWithMargin(CGPoint point, NSArray *lines, CGFloat margin) {
  BCAxis axis = BCAxisFlip([(BCLineObject*)[lines firstObject] axis]);
  
  CGFloat position = GKPointPositionForAxis(point, axis);
  NSArray *sortedLines = GKLineSortByDistanceToValue(lines, position);
  BCLineObject *line = [sortedLines firstObject];
  
  if (ABS(position - line.position) < margin)
    point = GKPointWithPositionForAxis(point, line.position, axis);
  
  return point;
}
