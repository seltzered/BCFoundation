//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCCornerGeometry.h"


void GKCornerEnumerate(GKCornerEnumeratorBlock block) {
  for (NSInteger corner = 0; corner<GKCornerCount; corner++)
    block((GKCorner)corner);
}

GKCorner BCCornerByRotating45DegreesCounterClockwise(GKCorner corner) {
  switch (corner) {
    case GKCornerTopLeft:     return GKCornerMidLeft;
    case GKCornerTopRight:    return GKCornerMidTop;
    case GKCornerBottomLeft:  return GKCornerMidBottom;
    case GKCornerBottomRight: return GKCornerMidRight;
    case GKCornerMidTop:      return GKCornerTopLeft;
    case GKCornerMidLeft:     return GKCornerBottomLeft;
    case GKCornerMidRight:    return GKCornerTopRight;
    case GKCornerMidBottom:   return GKCornerBottomRight;
    default:                  return GKCornerMid;
  }
}

GKCorner BCCornerByRotatingByDegrees(GKCorner corner, CGFloat degrees) {
  if (degrees < 45.0/2 && degrees > -45.0/2)
    return corner;
  else {
    corner = BCCornerByRotating45DegreesCounterClockwise(corner);
    if (degrees < 0)
      return BCCornerByRotatingByDegrees(corner, degrees+45);
    else
      return BCCornerByRotatingByDegrees(corner, degrees-45);
  }
}

GKCorner GKCornerFlip(GKCorner corner) {
  NSUInteger number = corner;
  if (number < GKCornerMidTop)
    number = GKCornerBottomRight - number;
  else
    number = 11- number;
  
  return (GKCorner) number;
}

BOOL GKCornerSatisfiesMask(GKCorner corner, NSUInteger mask) {
  NSUInteger shifted = (NSUInteger) (1 << (NSUInteger)corner);
  return (mask & shifted) == shifted;
}

BOOL GKCornerIsInMidHorizontal(GKCorner corner) {
  return corner == GKCornerMidLeft || corner == GKCornerMidRight;
}

BOOL GKCornerIsInMidVertical(GKCorner corner) {
  return corner == GKCornerMidTop || corner == GKCornerMidBottom;
}

GKCorner GKCornerFlipByAxis(GKCorner corner, BCAxis axis) {
  if (axis == BCAxisHorizontal) {
    switch (corner) {
      case GKCornerTopLeft:
        return GKCornerTopRight;
      case GKCornerTopRight:
        return GKCornerTopLeft;
      case GKCornerBottomLeft:
        return GKCornerBottomRight;
      case GKCornerBottomRight:
        return GKCornerBottomLeft;
      case GKCornerMidLeft:
        return GKCornerMidRight;
      case GKCornerMidRight:
        return GKCornerMidLeft;
      default:
        break;
    }
  } else {
    switch (corner) {
      case GKCornerTopLeft:
        return GKCornerBottomLeft;
      case GKCornerTopRight:
        return GKCornerBottomRight;
      case GKCornerBottomLeft:
        return GKCornerTopLeft;
      case GKCornerBottomRight:
        return GKCornerTopRight;
      case GKCornerMidTop:
        return GKCornerMidBottom;
      case GKCornerMidBottom:
        return GKCornerMidTop;
      default:
        break;
    }
  }
  return corner;
}

NSUInteger GKCornerRectEdgesMask(GKCorner type) {
  switch (type) {
    case GKCornerTopLeft:
      return GKEdgeTopMask | GKEdgeLeftMask;
    case GKCornerMidTop:
      return GKEdgeTopMask;
    case GKCornerTopRight:
      return GKEdgeTopMask | GKEdgeRightMask;
    case GKCornerMidLeft:
      return GKEdgeLeftMask;
    case GKCornerMidRight:
      return GKEdgeRightMask;
    case GKCornerBottomLeft:
      return GKEdgeBottomMask | GKEdgeLeftMask;
    case GKCornerMidBottom:
      return GKEdgeBottomMask;
    case GKCornerBottomRight:
      return GKEdgeBottomMask | GKEdgeRightMask;
    default:
      return 0;
  }
}


GKCorner GKCornerFirstCornerSatisfyingPredicate(GKCornerEnumeratorPredicate block) {
  for (NSInteger corner = 0; corner<GKCornerCount; corner++) {
    if (block((GKCorner)corner))
      return (GKCorner)corner;
  }
  return GKCornerNone;
}
