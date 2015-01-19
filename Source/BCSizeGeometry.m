//  Created by Pieter Omvlee on 19/01/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCSizeGeometry.h"

CGSize BCSizeScale(CGSize s, CGFloat scale) {
  s.width  *= scale;
  s.height *= scale;
  return s;
}
