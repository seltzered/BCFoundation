//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCRectGeometry.h"
#import "BCPointGeometry.h"

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

CGRect BCRectWithOriginAndSize(CGPoint point, CGSize size) {
  return CGRectMake(point.x, point.y, size.width, size.height);
}

CGRect BCRectWithSizeProportionallyAroundRect(CGSize size, CGRect rect) {
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

CGFloat BCRectMinForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? rect.origin.x : rect.origin.y;
}

CGFloat BCRectMaxForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? NSMaxX(rect) : NSMaxY(rect);
}

CGFloat BCRectSizeForAxis(CGRect rect, BCAxis axis) {
  return axis == BCAxisHorizontal ? rect.size.width : rect.size.height;
}

CGRect BCRectWithSizeForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.size.width = value;
  else
    rect.size.height = value;
  return rect;
}

CGRect BCRectWithMinForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.origin.x = value;
  else
    rect.origin.y = value;
  return rect;
}

CGRect BCRectWithMaxForAxis(CGRect rect, CGFloat value, BCAxis axis) {
  if (axis == BCAxisHorizontal)
    rect.origin.x = value - rect.size.width;
  else
    rect.origin.y = value - rect.size.height;
  return rect;
}

CGPoint BCRectGetMid(CGRect rect) {
  return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect BCRectWithMidX(CGRect rect, CGFloat midX) {
  rect.origin.x = midX - rect.size.width/2;
  return rect;
}

CGRect BCRectWithMidY(CGRect rect, CGFloat midY) {
  rect.origin.y = midY - rect.size.height/2;
  return rect;
}

CGRect BCRectResizeMinXTo(CGRect rect, CGFloat minX) {
  rect.size.width = CGRectGetMaxX(rect) - minX;
  rect.origin.x = minX;
  return rect;
}

CGRect BCRectResizeMaxXTo(CGRect rect, CGFloat maxX) {
  rect.size.width = maxX - rect.origin.x;
  return rect;
}

CGRect BCRectResizeMinYTo(CGRect rect, CGFloat minY) {
  rect.size.height = CGRectGetMaxY(rect) - minY;
  rect.origin.y = minY;
  return rect;
}

CGRect BCRectResizeMaxYTo(CGRect rect, CGFloat maxY) {
  rect.size.height = maxY - rect.origin.y;
  return rect;
}

CGRect BCRectResizeByPuttingCorner(CGRect rect, BCCorner corner, CGPoint point) {
  switch (corner) {
    case BCCornerTopLeft: {
      rect = BCRectResizeMinXTo(rect, point.x);
      rect = BCRectResizeMinYTo(rect, point.y);
      break;
    }
    case BCCornerTopRight: {
      rect = BCRectResizeMaxXTo(rect, point.x);
      rect = BCRectResizeMinYTo(rect, point.y);
      break;
    }
    case BCCornerBottomLeft: {
      rect = BCRectResizeMinXTo(rect, point.x);
      rect = BCRectResizeMaxYTo(rect, point.y);
      break;
    }
    case BCCornerBottomRight: {
      rect = BCRectResizeMaxXTo(rect, point.x);
      rect = BCRectResizeMaxYTo(rect, point.y);
      break;
    }
    case BCCornerMidTop: {
      rect = BCRectResizeMinYTo(rect, point.y);
      break;
    }
    case BCCornerMidLeft: {
      rect = BCRectResizeMinXTo(rect, point.x);
      break;
    }
    case BCCornerMidRight: {
      rect = BCRectResizeMaxXTo(rect, point.x);
      break;
    }
    case BCCornerMidBottom: {
      rect = BCRectResizeMaxYTo(rect, point.y);
      break;
    }
    default:
      break;
  }
  return rect;
}

CGRect BCRectMoveToCorner(CGRect rect, BCCorner corner, CGPoint point) {
  switch (corner) {
    case BCCornerTopLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y;
      break;
    case BCCornerTopRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y;
      break;
    case BCCornerBottomLeft:
      rect.origin.x  = point.x;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerBottomRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerMidTop:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y;
      break;
    case BCCornerMidLeft:
      rect.origin.x  = point.x;
      rect.origin.y = point.y-rect.size.height/2.0;
      break;
    case BCCornerMidRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height/2;
      break;
    case BCCornerMidBottom:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerMid:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height/2.0;
    default:
      break;
  }
  return rect;
}

CGPoint BCRectPointForCorner(CGRect rect, BCCorner corner) {
  switch (corner) {
    case BCCornerTopLeft:
      return NSMakePoint(NSMinX(rect), NSMinY(rect));
    case BCCornerTopRight:
      return NSMakePoint(NSMaxX(rect), NSMinY(rect));
    case BCCornerBottomLeft:
      return NSMakePoint(NSMinX(rect), NSMaxY(rect));
    case BCCornerBottomRight:
      return NSMakePoint(NSMaxX(rect), NSMaxY(rect));
    case BCCornerMidTop:
      return NSMakePoint(NSMidX(rect), NSMinY(rect));
    case BCCornerMidLeft:
      return NSMakePoint(NSMinX(rect), NSMidY(rect));
    case BCCornerMidRight:
      return NSMakePoint(NSMaxX(rect), NSMidY(rect));
    case BCCornerMidBottom:
      return NSMakePoint(NSMidX(rect), NSMaxY(rect));
    case BCCornerMid:
      return NSMakePoint(NSMidX(rect), NSMidY(rect));
    default:
      return NSZeroPoint;
  }
}

BCCorner BCRectClosestCornerForPoint(CGRect rect, CGPoint point, CGFloat margin, NSUInteger cornerMask) {
  return BCCornerFirstCornerSatisfyingPredicate(^BOOL(BCCorner corner) {
    return BCCornerSatisfiesMask(corner, cornerMask) && BCDistanceBetweenPoints(BCRectPointForCorner(rect, corner), point) < margin;
  });
}

CGSize BCRectDistanceFromCornerToMid(CGRect rect, BCCorner corner) {
  CGPoint cornerPoint = BCRectPointForCorner(rect, corner);
  CGPoint mid = BCRectPointForCorner(rect, BCCornerMid);
  return CGSizeMake(mid.x-cornerPoint.x, mid.y-cornerPoint.y);
}

NSComparisonResult BCRectCompare(CGRect rect1, CGRect rect2, BCAxis axis) {
  CGFloat a = BCRectMinForAxis(rect1, axis);
  CGFloat b = BCRectMinForAxis(rect2, axis);
  
  if (a > b) return NSOrderedDescending;
  if (a < b) return NSOrderedAscending;
  else return NSOrderedSame;
}

CGFloat BCRectValueForKey(CGRect rect, NSString *key) {
  if ([key isEqualToString:@"minX"])
    return CGRectGetMinX(rect);
  else if ([key isEqualToString:@"midX"])
    return CGRectGetMidX(rect);
  else if ([key isEqualToString:@"maxX"])
    return CGRectGetMaxX(rect);
  
  else if ([key isEqualToString:@"minY"])
    return CGRectGetMinY(rect);
  else if ([key isEqualToString:@"midY"])
    return CGRectGetMidY(rect);
  else if ([key isEqualToString:@"maxY"])
    return CGRectGetMaxY(rect);
  else
    return 0;
}

CGRect BCRectNormalise(CGRect rect) {
  return CGRectMake(CGRectGetMinX(rect),
                    CGRectGetMinY(rect),
                    ABS(rect.size.width),
                    ABS(rect.size.height));
}

CGRect BCRectWithSizeOnAxisAspectRatio(CGRect rect, CGFloat size, BCAxis axis, CGFloat aspectRatio) {
  if (axis == BCAxisVertical) {
    rect.size.width = aspectRatio != 0 ? size * aspectRatio : rect.size.width;
    rect.size.height = size;
  } else {
    rect.size.width = size;
    rect.size.height = aspectRatio != 0 ? size / aspectRatio : rect.size.height;
  }
  return rect;
}

CGRect BCRectMoveCornerToPoint(CGRect rect, BCCorner corner, CGPoint point) {
  switch (corner) {
    case BCCornerTopLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y;
      break;
    case BCCornerTopRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y;
      break;
    case BCCornerBottomLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerBottomRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerMidTop:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y;
      break;
    case BCCornerMidLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y-rect.size.height/2.0;
      break;
    case BCCornerMidRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height/2;
      break;
    case BCCornerMidBottom:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height;
      break;
    case BCCornerMid:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height/2.0;
    default:
      break;
  }
  return rect;
}
