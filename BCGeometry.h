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
typedef enum GKEdgeType : NSUInteger {
  GKEdgeLeftMask          = 1,
  GKEdgeRightMask         = 2,
  GKEdgeTopMask           = 4,
  GKEdgeBottomMask        = 8,
} GKEdgeType;

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
