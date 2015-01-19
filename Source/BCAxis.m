//  Created by Pieter Omvlee on 16/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCAxis.h"

BCAxis BCAxisFlip(BCAxis axis) {
  return (BCAxis)!axis;
}

CGFloat GKRectMinForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? rect.origin.x : rect.origin.y;
}

CGFloat GKRectMaxForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? NSMaxX(rect) : NSMaxY(rect);
}

CGFloat GKRectSizeForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? rect.size.width : rect.size.height;
}

CGRect GKRectWithSizeForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.size.width = value;
  else
    rect.size.height = value;
  return rect;
}

CGRect GKRectWithMinForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.origin.x = value;
  else
    rect.origin.y = value;
  return rect;
}

CGRect GKRectWithMaxForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.origin.x = value - rect.size.width;
  else
    rect.origin.y = value - rect.size.height;
  return rect;
}

CGRect GKRectWithMidX(CGRect rect, CGFloat midX) {
  rect.origin.x = midX - rect.size.width/2;
  return rect;
}

CGRect GKRectWithMidY(CGRect rect, CGFloat midY) {
  rect.origin.y = midY - rect.size.height/2;
  return rect;
}

#pragma mark - Points

CGFloat GKPointPositionForAxis(CGPoint point, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    return point.x;
  else
    return point.y;
}

CGPoint GKPointWithPositionForAxis(CGPoint point, BCAxis axis, CGFloat value) {
  if (axis == BCAxisHorizontal)
    point.x = value;
  else
    point.y = value;
  
  return point;
}
