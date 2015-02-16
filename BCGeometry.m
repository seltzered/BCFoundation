//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>
#import "BCGeometry.h"

BCAxis BCAxisFlip(BCAxis axis) {
  return (BCAxis)!axis;
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

CGRect BCRectFromSize(CGSize size) {
  return CGRectMake(0, 0, size.width, size.height);
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


CGPoint BCPointBetweenPoints(NSPoint p1, NSPoint p2) {
  return CGPointMake((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
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

CGSize BCSizeScale(CGSize s, CGFloat scale) {
  s.width  *= scale;
  s.height *= scale;
  return s;
}

#pragma mark - Ranges

BOOL BCRangeContainsRange(NSRange outerRange, NSRange innerRange) {
  return NSEqualRanges(outerRange, NSUnionRange(outerRange, innerRange));
}
