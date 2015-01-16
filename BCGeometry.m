//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>
#import "BCGeometry.h"

CGRect BCRectWithSizeProportionallyInRect(CGSize size, CGRect rect) {
  CGRect result;
  if (size.width/rect.size.width > size.height/rect.size.height) {
    CGFloat scale = size.height/size.width;
    result.size.width  = rect.size.width;
    result.size.height = result.size.width * scale;
    result.origin.x = rect.origin.x + rect.size.width/2 - result.size.width/2;
    result.origin.y = rect.origin.y + rect.size.height/2 - result.size.height/2;;
  } else {
    CGFloat scale = size.width/size.height;
    result.size.height = rect.size.height;
    result.size.width  = result.size.height * scale;
    result.origin.x = rect.origin.x + rect.size.width/2 - result.size.width/2;
    result.origin.y = rect.origin.y + rect.size.height/2 - result.size.height/2;
  }
  return result;
}

CGRect BCRectWithSizeCenteredInRect(CGSize size, CGRect outer) {
  CGRect r;
  r.size = size;
  r.origin.x = (outer.size.width- size.width)/2   + outer.origin.x;
  r.origin.y = (outer.size.height- size.height)/2 + outer.origin.y;
  return r;
}

CGRect BCRectWithSize(CGSize size) {
  return CGRectMake(0, 0, size.width, size.height);
}

CGRect BCRectWithOriginAndSize(CGPoint point, CGSize size) {
  return CGRectMake(point.x, point.y, size.width, size.height);
}


CGRect BCRectWithMarginAroundPoint(CGFloat margin, CGPoint point) {
  return CGRectMake(point.x - margin, point.y - margin, margin * 2, margin * 2);
}

CGRect BCRectWithSizeSizeCenteredAtPoint(CGSize size, CGPoint point) {
  return CGRectMake(point.x - size.width/2, point.y - size.height/2, size.width, size.height);
}

BOOL BCRectFuzzyEqualToRect(CGRect r1, CGRect r2) {
  return (ABS(r1.origin.x - r2.origin.x) < 0.001 &&
          ABS(r1.origin.y - r2.origin.y) < 0.001 &&
          ABS(r1.size.width - r2.size.width) < 0.001 &&
          ABS(r1.size.height - r2.size.height) < 0.001);
}

CGRect BCRectFromCoordinateSpaceRectToRect(CGRect rect, CGRect fromRect, CGRect toRect) {
  return BCRectAbsolute(BCRectRelative(rect, fromRect), toRect);
}

CGRect BCRectExpand(CGRect rect, CGFloat margin) {
  return CGRectMake(rect.origin.x- margin, rect.origin.y- margin, rect.size.width+ margin *2, rect.size.height+ margin *2);
}

CGRect BCRectRelative(CGRect rect, CGRect outer) {
  rect.origin.x    -= outer.origin.x;
  rect.origin.y    -= outer.origin.y;
  rect.origin.x    /= outer.size.width;
  rect.origin.y    /= outer.size.height;
  rect.size.width  /= outer.size.width;
  rect.size.height /= outer.size.height;
  return rect;
}

CGRect BCRectAbsolute(CGRect rect, CGRect outer) {
  rect.origin.x    *= outer.size.width;
  rect.origin.y    *= outer.size.height;
  rect.origin.x    += outer.origin.x;
  rect.origin.y    += outer.origin.y;
  rect.size.width  *= outer.size.width;
  rect.size.height *= outer.size.height;
  return rect;
}

CGRect BCRectScale(CGRect r, CGFloat scale) {
  r.origin.x    *= scale;
  r.origin.y    *= scale;
  r.size.width  *= scale;
  r.size.height *= scale;
  return r;
}

#pragma mark - Points

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

#pragma mark - Sizes

CGSize BCSizeScale(CGSize s, CGFloat scale) {
  s.width  *= scale;
  s.height *= scale;
  return s;
}

#pragma mark - Corners

CGPoint BCRectGetMid(CGRect rect) {
  return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

#pragma mark - Logging

void BCLogRect(CGRect rect) {
  NSLog(@"x:%f y:%f w:%f h:%f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

void BCLogSize(CGSize size) {
  NSLog(@"w:%f h:%f", size.width, size.height);
}

void BCLogPoint(CGPoint point) {
  NSLog(@"x:%f y:%f", point.x, point.y);
}

#pragma mark - Rounding

CGRect BCRectByRoundingRect(CGRect rect) {
  return CGRectMake(round(rect.origin.x), round(rect.origin.y), round(rect.size.width), round(rect.size.height));
}

CGSize BCSizeByRoundingSize(CGSize size) {
  return CGSizeMake(round(size.width), round(size.height));
}

CGPoint BCPointByRoundingPoint(CGPoint point) {
  return CGPointMake(round(point.x), round(point.y));
}

CGPoint BCPointByRoundingPointToStep(CGPoint point, CGFloat step) {
  point.x = round(point.x/step)*step;
  point.y = round(point.y/step)*step;
  return point;
}

#pragma mark - Converting

CGPoint BCPointFromSize(CGSize size) {
  return CGPointMake(size.width, size.height);
}

CGSize BCSizeFromPoint(CGPoint point) {
  return CGSizeMake(point.x, point.y);
}


#pragma mark -

BOOL BCPointsEqualWithMargin(CGPoint p1, CGPoint p2, CGFloat margin) {
  return BCDistanceBetweenPoints(p1, p2) < margin;
}

BOOL BCRectIsZero(CGRect rect) {
  return CGRectEqualToRect(rect, NSZeroRect);
}

CGRect BCRectFromPoints(CGPoint point1, CGPoint point2) {
  CGRect  r;
  r.origin.x = MIN(point1.x, point2.x);
  r.origin.y = MIN(point1.y, point2.y);
  r.size.width = ABS(point2.x - point1.x);
  r.size.height = ABS(point2.y - point1.y);
  return r;
}

CGRect BCUnionRectSafe(CGRect r1, CGRect r2) {
  CGRect r;
  r.origin.x = MIN(CGRectGetMinX(r1), CGRectGetMinX(r2));
  r.origin.y = MIN(CGRectGetMinY(r1), CGRectGetMinY(r2));
  r.size.width = MAX(CGRectGetMaxX(r1), CGRectGetMaxX(r2)) - r.origin.x;
  r.size.height = MAX(CGRectGetMaxY(r1), CGRectGetMaxY(r2)) - r.origin.y;
  return r;
}

CGRect BCRectWithSizeProportionallyAroundRect(CGSize size, CGRect rect)
{
  CGRect result = BCRectWithSizeProportionallyInRect(size, rect);
  if (NSWidth(result) < NSWidth(rect)) {
    CGFloat zoom = NSWidth(rect)/NSWidth(result);
    result = BCRectScale(result, zoom);
  }
  if (NSHeight(result) < NSHeight(rect)) {
    CGFloat zoom = NSHeight(rect)/NSHeight(result);
    result = BCRectScale(result, zoom);
  }
  return BCRectWithSizeCenteredInRect(result.size, rect);
}

CGFloat BCDistanceBetweenPoints(NSPoint p1, NSPoint p2) {
  return sqrt((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y));
}

#pragma mark - Trigonometry
CGFloat BCSlopeBetweenPoints(CGPoint a, CGPoint b) {
  return atan2(b.y - a.y, b.x - a.x);
}

CGFloat BCNormalizeRadians(CGFloat radians) {
  while (radians > M_PI)
    radians -= M_PI + M_PI;
  while (radians < -M_PI)
    radians += M_PI + M_PI;
  return radians;
}


CGFloat BCSlopeToStraightAngles(CGFloat slope) {
  if (slope > 0) {
    for (NSInteger i = 1; i < 10; i += 2) {
      if (slope < M_PI * i / 8)
        return M_PI* (i - 1) / 8;
    }
  } else {
    for (NSInteger i = 1; i < 10; i += 2) {
      if (slope > -M_PI * i / 8)
        return -M_PI * (i - 1) / 8;
    }
  }
  return slope;
}

CGPoint BCPointBetweenPointsAt(NSPoint p1, NSPoint p2, CGFloat position) {
  return CGPointMake(p1.x + (p2.x - p1.x) * position, p1.y + (p2.y - p1.y) * position);
}

CGPoint BCPointBetweenPoints(NSPoint p1, NSPoint p2) {
  return CGPointMake((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
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

CGPoint BCSnapPointToPointWithMargin(CGPoint p1, CGPoint p2, CGFloat margin) {
  if (ABS(p1.x - p2.x) < margin)
    p1.x = p2.x;
  if (ABS(p1.y - p2.y) < margin)
    p1.y = p2.y;
  return p1;
}

CGFloat BCFloatMakeNotInfOrNan(CGFloat value) {
  if (isinf(value) || isnan(value))
    return 0.1;
  else
    return value;
}

CGFloat BCFloatValidValue(CGFloat value) {
  value = BCFloatMakeNotInfOrNan(value);
  if (value > 0)
    return MAX(0.1, value);
  else
    return MIN(-0.1, value);
}

CGPoint BCPointSafe(CGPoint point) {
  point.x = BCFloatMakeNotInfOrNan(point.x);
  point.y = BCFloatMakeNotInfOrNan(point.y);
  return point;
}

CGRect BCRectSafe(CGRect rect) {
  rect.origin.x = BCFloatMakeNotInfOrNan(rect.origin.x);
  rect.origin.y = BCFloatMakeNotInfOrNan(rect.origin.y);
  rect.size.width = BCFloatValidValue(rect.size.width);
  rect.size.height = BCFloatValidValue(rect.size.height);
  return rect;
}

CGFloat BCRadiansToDegrees(CGFloat radians)  {
  return radians * (180.0 / M_PI);
}

CGFloat BCDegreesToRadians(CGFloat degrees)  {
  return degrees / (180.0 / M_PI);
}
