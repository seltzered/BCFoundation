//  Created by Pieter Omvlee on 09/04/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCPrimitiveFunctions.h"

BOOL BCFloatEqualWithMargin(CGFloat a, CGFloat b, CGFloat margin) {
  return fabs(a - b) < margin;
}
