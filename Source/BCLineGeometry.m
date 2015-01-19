// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

#import "BCLineGeometry.h"

@implementation BCLineObject

+ (instancetype)lineOnAxis:(BCAxis)axis position:(CGFloat)position {
  BCLineObject *line = [[self alloc] init];
  line.axis = axis;
  line.position = position;
  return line;
}

@end
