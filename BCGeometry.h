//  Created by Pieter Omvlee on 15/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#pragma mark - Axis
typedef NS_ENUM(NSUInteger , BCAxis) {
  BCAxisHorizontal = 0,
  BCAxisVertical   = 1
};

BCAxis BCAxisFlip(BCAxis axis);

#pragma mark - Edge
typedef NS_ENUM(NSUInteger, BCEdge) {
  BCEdgeLeft   = 1<<0,
  BCEdgeRight  = 1<<1,
  BCEdgeTop    = 1<<2,
  BCEdgeBottom = 1<<3,
  BCEdgeMidX   = 1<<4,
  BCEdgeMidY   = 1<<5,
  
  BCEdgeAll = BCEdgeLeft | BCEdgeRight | BCEdgeTop | BCEdgeBottom | BCEdgeMidX | BCEdgeMidY
};

#pragma mark - Line
typedef struct _BCLine {
  CGFloat position;
  BCAxis axis;
} BCLine;

#pragma mark - Logging
void BCLogRect(CGRect rect);
void BCLogSize(CGSize size);
void BCLogPoint(CGPoint point);

#pragma mark - Rounding
CGRect BCRectByRoundingRect(CGRect rect);
CGSize BCSizeByRoundingSize(CGSize size);
CGPoint BCPointByRoundingPoint(CGPoint point);
CGPoint BCPointByRoundingPointToStep(CGPoint point, CGFloat step);

#pragma mark - Converting
CGPoint BCPointFromSize(CGSize size);
CGSize BCSizeFromPoint(CGPoint point);
CGRect BCRectFromSize(CGSize size);

#pragma mark - Trigonometry
CGFloat BCSlopeBetweenPoints(CGPoint a, CGPoint b);
CGFloat BCNormalizeRadians(CGFloat radians);
CGFloat BCSlopeToStraightAngles(CGFloat slope);
CGFloat BCRadiansToDegrees(CGFloat radians);
CGFloat BCDegreesToRadians(CGFloat degrees);

#pragma mark - Safety
CGPoint BCPointSafe(CGPoint point);
CGRect BCRectSafe(CGRect rect);
CGFloat BCFloatMakeNotInfOrNan(CGFloat value);
CGFloat BCFloatValidValue(CGFloat value);

CGSize BCSizeScale(CGSize s, CGFloat scale);
