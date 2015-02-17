//
//  NSDictionary+BCFoundation.h
//  BCFoundation
//
//  Created by Johnnie Walker on 17/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BCFoundation)
- (NSString *)stringForKey_BC:(id)aKey;
- (NSArray *)arrayForKey_BC:(id)aKey;
- (NSDictionary *)dictionaryForKey_BC:(id)aKey;
- (NSNumber *)numberForKey_BC:(id)aKey;
- (NSURL *)urlForKey_BC:(id)key;
@end
