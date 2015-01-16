//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

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

CGRect BCRectFromSize(CGSize size) {
  return CGRectMake(0, 0, size.width, size.height);
}

CGRect BCRectFromOriginAndSize(CGPoint point, CGSize size) {
  return CGRectMake(point.x, point.y, size.width, size.height);
}
