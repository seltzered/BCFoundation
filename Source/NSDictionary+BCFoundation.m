//
//  NSDictionary+BCFoundation.m
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import "NSDictionary+BCFoundation.h"

@implementation NSDictionary (BCFoundation)
#define TypeForKey(Type) Type *obj = [self objectForKey:aKey]; if (! [obj isKindOfClass:[Type class]]) return nil; return obj;

- (NSString *)stringForKey_BC:(id)aKey {
  TypeForKey(NSString)
}

- (NSArray *)arrayForKey_BC:(id)aKey {
  TypeForKey(NSArray)
}

- (NSDictionary *)dictionaryForKey_BC:(id)aKey {
  TypeForKey(NSDictionary)
}

- (NSNumber *)numberForKey_BC:(id)aKey {
  TypeForKey(NSNumber)
}

- (BOOL)boolForKey_BC:(id)aKey {
  return [[self numberForKey_BC:aKey] boolValue];
}

- (NSURL *)urlForKey_BC:(id)key {
  NSString *string = [self stringForKey_BC:key];
  NSURL *url = nil;
  if (string) {
    url = [NSURL URLWithString:string];
  }
  return url;
}
@end
