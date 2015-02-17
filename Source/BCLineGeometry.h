// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

#import "BCGeometry.h"
#import "BCRectGeometry.h"

static inline BCLine GKLineLineOnAxis(CGFloat position, BCAxis axis) {
  BCLine line;
  line.position = position;
  line.axis = axis;

  return line;
}

static inline BOOL GKLineSnapToPosition(BCLine line, CGFloat pos, CGFloat margin, CGFloat *snapped) {
  if (ABS(pos - line.position) < margin) {
    *snapped = pos;
    return YES;
  } else
    return NO;
}

static inline BOOL GKLineSnapsToRect(BCLine line, CGRect rect, CGFloat margin, CGFloat *snapped) {
  BCAxis axis = line.axis;
  if (GKLineSnapToPosition(line, BCRectMinForAxis(rect, axis), margin, snapped))
    return YES;
  else if (GKLineSnapToPosition(line, BCRectMaxForAxis(rect, axis), margin, snapped))
    return YES;
  else
    return NO;
}

@interface BCLineObject : NSObject
@property (nonatomic) BCAxis axis;
@property (nonatomic) CGFloat position;
+ (instancetype)lineOnAxis:(BCAxis)axis position:(CGFloat)position;
@end

static inline NSArray* GKLineSortByDistanceToValue(NSArray *lines, CGFloat value) {
  return [lines sortedArrayUsingComparator:^NSComparisonResult(BCLineObject *l1, BCLineObject *l2) {
    return [@((NSInteger) ABS(value - l1.position)) compare:@((NSInteger) ABS(value - l2.position))];
  }];
}
