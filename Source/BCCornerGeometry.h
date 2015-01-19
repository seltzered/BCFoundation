//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>
#import "BCGeometry.h"

typedef NS_ENUM(NSInteger, GKCorner) {
  GKCornerNone        = -1,
  GKCornerTopLeft     = 0,
  GKCornerTopRight    = 1,
  GKCornerBottomLeft  = 2,
  GKCornerBottomRight = 3,
  GKCornerMidTop      = 4,
  GKCornerMidLeft     = 5,
  GKCornerMidRight    = 6,
  GKCornerMidBottom   = 7,
  
  //not counting when enumerating
  GKCornerMid         = 8
};

enum {
  GKCornerTopLeftMask     = 1 << GKCornerTopLeft,
  GKCornerTopRightMask    = 1 << GKCornerTopRight,
  GKCornerBottomLeftMask  = 1 << GKCornerBottomLeft,
  GKCornerBottomRightMask = 1 << GKCornerBottomRight,
  GKCornerMidTopMask      = 1 << GKCornerMidTop,
  GKCornerMidLeftMask     = 1 << GKCornerMidLeft,
  GKCornerMidRightMask    = 1 << GKCornerMidRight,
  GKCornerMidBottomMask   = 1 << GKCornerMidBottom
};

#define GKCornerCount 8
#define GKCornerMaskAll    (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask | GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)
#define GKCornerMaskCorner (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask)
#define GKCornerMaskMid    (GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)

typedef void(^GKCornerEnumeratorBlock)(GKCorner corner);
typedef BOOL(^GKCornerEnumeratorPredicate)(GKCorner corner);



void GKCornerEnumerate(GKCornerEnumeratorBlock block);
GKCorner BCCornerByRotating45DegreesCounterClockwise(GKCorner corner);
GKCorner BCCornerByRotatingByDegrees(GKCorner corner, CGFloat degrees);
GKCorner GKCornerFlip(GKCorner corner);
BOOL GKCornerSatisfiesMask(GKCorner corner, NSUInteger mask);
BOOL GKCornerIsInMidHorizontal(GKCorner corner);
BOOL GKCornerIsInMidVertical(GKCorner corner);
GKCorner GKCornerFlipByAxis(GKCorner corner, BCAxis axis);
NSUInteger GKCornerRectEdgesMask(GKCorner type);
GKCorner GKCornerFirstCornerSatisfyingPredicate(GKCornerEnumeratorPredicate block);
