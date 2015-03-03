//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCCornerGeometry.h"


void BCCornerEnumerate(BCCornerEnumeratorBlock block) {
  for (NSInteger corner = 0; corner<BCCornerCount; corner++)
    block((BCCorner)corner);
}

BCCorner BCCornerByRotating45DegreesCounterClockwise(BCCorner corner) {
  switch (corner) {
    case BCCornerTopLeft:     return BCCornerMidLeft;
    case BCCornerTopRight:    return BCCornerMidTop;
    case BCCornerBottomLeft:  return BCCornerMidBottom;
    case BCCornerBottomRight: return BCCornerMidRight;
    case BCCornerMidTop:      return BCCornerTopLeft;
    case BCCornerMidLeft:     return BCCornerBottomLeft;
    case BCCornerMidRight:    return BCCornerTopRight;
    case BCCornerMidBottom:   return BCCornerBottomRight;
    default:                  return BCCornerMid;
  }
}

BCCorner BCCornerByRotatingByDegrees(BCCorner corner, CGFloat degrees) {
  if (degrees < ceil(45.0/2) && degrees > -ceil(45.0/2))
    return corner;
  else {
    corner = BCCornerByRotating45DegreesCounterClockwise(corner);
    if (degrees < 0)
      return BCCornerByRotatingByDegrees(corner, degrees+45);
    else
      return BCCornerByRotatingByDegrees(corner, degrees-45);
  }
}

BCCorner BCCornerFlip(BCCorner corner) {
  NSUInteger number = corner;
  if (number < BCCornerMidTop)
    number = BCCornerBottomRight - number;
  else
    number = 11- number;
  
  return (BCCorner) number;
}

BOOL BCCornerSatisfiesMask(BCCorner corner, NSUInteger mask) {
  NSUInteger shifted = (NSUInteger) (1 << (NSUInteger)corner);
  return (mask & shifted) == shifted;
}

BOOL BCCornerIsInMidHorizontal(BCCorner corner) {
  return corner == BCCornerMidLeft || corner == BCCornerMidRight;
}

BOOL BCCornerIsInMidVertical(BCCorner corner) {
  return corner == BCCornerMidTop || corner == BCCornerMidBottom;
}

BCCorner BCCornerFlipByAxis(BCCorner corner, BCAxis axis) {
  if (axis == BCAxisHorizontal) {
    switch (corner) {
      case BCCornerTopLeft:
        return BCCornerTopRight;
      case BCCornerTopRight:
        return BCCornerTopLeft;
      case BCCornerBottomLeft:
        return BCCornerBottomRight;
      case BCCornerBottomRight:
        return BCCornerBottomLeft;
      case BCCornerMidLeft:
        return BCCornerMidRight;
      case BCCornerMidRight:
        return BCCornerMidLeft;
      default:
        break;
    }
  } else {
    switch (corner) {
      case BCCornerTopLeft:
        return BCCornerBottomLeft;
      case BCCornerTopRight:
        return BCCornerBottomRight;
      case BCCornerBottomLeft:
        return BCCornerTopLeft;
      case BCCornerBottomRight:
        return BCCornerTopRight;
      case BCCornerMidTop:
        return BCCornerMidBottom;
      case BCCornerMidBottom:
        return BCCornerMidTop;
      default:
        break;
    }
  }
  return corner;
}

NSUInteger BCCornerRectEdgesMask(BCCorner type) {
  switch (type) {
    case BCCornerTopLeft:
      return BCEdgeTop | BCEdgeLeft;
    case BCCornerMidTop:
      return BCEdgeTop;
    case BCCornerTopRight:
      return BCEdgeTop | BCEdgeRight;
    case BCCornerMidLeft:
      return BCEdgeLeft;
    case BCCornerMidRight:
      return BCEdgeRight;
    case BCCornerBottomLeft:
      return BCEdgeBottom | BCEdgeLeft;
    case BCCornerMidBottom:
      return BCEdgeBottom;
    case BCCornerBottomRight:
      return BCEdgeBottom | BCEdgeRight;
    default:
      return 0;
  }
}

BCCorner BCCornerFirstCornerSatisfyingPredicate(BCCornerEnumeratorPredicate block) {
  for (NSInteger corner = 0; corner<BCCornerCount; corner++) {
    if (block((BCCorner)corner))
      return (BCCorner)corner;
  }
  return BCCornerNone;
}
