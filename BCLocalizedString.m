//  Created by Sam Deane on 26/02/2015.
//  Copyright (c) 2015 Bohemian Coding. All rights reserved.

#import "BCLocalizedString.h"

/**
 Currently this exists purely to set the bundle to use for translations.
 
 We want to use the bundle containing this code for looking up translations, rather than just using the main bundle, so
 that we can add localizations to a unit tests bundle and be able to pick them up from unit tests. 
 
 When linked into an application, we will be in the main bundle so everything will work as expected.
 */

@interface BCLocalizedStringHelper : NSObject
@end

@implementation BCLocalizedStringHelper
+(NSBundle*)bundleForTranslations {
  return [NSBundle bundleForClass:self];
}
@end

NSString* BCLocalizedString(NSString* key) {
  static NSBundle* bundleForTranslations = nil;
  if (!bundleForTranslations)
    bundleForTranslations = [BCLocalizedStringHelper bundleForTranslations];
  
  NSString* result = [bundleForTranslations localizedStringForKey:key value:@"" table:nil];
  
  return result;
}



