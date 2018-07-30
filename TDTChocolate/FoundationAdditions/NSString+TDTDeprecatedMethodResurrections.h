//
//  NSString+TDTAdditions.h
//  Talkto
//
//  Created by Yatin Sarbalia on 06/07/12.
//  Copyright (c) 2012 Talk.to FZC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Methods in NSString that were deprecated by Apple during the move to iOS 7.
 */

@interface NSString (TDTDeprecatedMethodResurrections)

/**
 Returns the size that `self` would use when drawn using `font` on a single
 line. The return value may be rounded up to nearest whole number.
 */
- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font;

/**
 Returns the size that `self` would use when drawn using `font` in a `size`
 sized box with `lineBreakMode`.
 */
- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font
                   constrainedToSize:(CGSize)size
                       lineBreakMode:(NSLineBreakMode)lineBreakMode;

/**
 Returns the size that `self` would use when drawn using `font` in a `size`
 sized box. NSLineBreakByWordWrapping is used to wrap.
 */
- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
