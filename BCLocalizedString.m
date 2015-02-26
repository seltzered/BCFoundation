//  Created by Sam Deane on 26/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCLocalizedString.h"

@interface BCLocalizedStringHelper : NSObject
@end

@implementation BCLocalizedStringHelper
@end

NSString* BCLocalizedString(NSString* key) {
  NSBundle* bundle = [NSBundle bundleForClass:[BCLocalizedStringHelper class]];
  NSString* result = [bundle localizedStringForKey:key value:@"" table:nil];
  
  return result;
}



