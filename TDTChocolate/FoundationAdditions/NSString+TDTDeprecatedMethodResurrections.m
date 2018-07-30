//
//  NSString+TDTAdditions.m
//  Talkto
//
//  Created by Yatin Sarbalia on 06/07/12.
//  Copyright (c) 2012 Talk.to FZC. All rights reserved.
//

#import "NSString+TDTDeprecatedMethodResurrections.h"

@implementation NSString (TDTDeprecatedMethodResurrections)

- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font {
  CGSize size = [self sizeWithAttributes:@{ NSFontAttributeName : font }];
  return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font
                   constrainedToSize:(CGSize)size
                       lineBreakMode:(NSLineBreakMode)lineBreakMode {
  NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
  paragraphStyle.lineBreakMode = lineBreakMode;
  CGRect rect = [self boundingRectWithSize:size
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{ NSFontAttributeName : font,
                                              NSParagraphStyleAttributeName : paragraphStyle}
                                   context:nil];
  return CGRectIntegral(rect).size;
}

- (CGSize)tdt_supersededSizeWithFont:(UIFont *)font
                   constrainedToSize:(CGSize)size {
  return [self tdt_supersededSizeWithFont:font
                        constrainedToSize:size
                            lineBreakMode:NSLineBreakByWordWrapping];
}

@end
