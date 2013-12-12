#import "NSProcessInfo+TDTTEnvironmentDetection.h"

@implementation NSProcessInfo (TDTEnvironmentDetection)

@dynamic isRunningTests;

// Source: http://www.objc.io/issue-1/testing-view-controllers.html

- (BOOL)isRunningTests {
  NSString* injectBundle = self.environment[@"XCInjectBundle"];
  return [injectBundle.pathExtension isEqualToString:@"octest"];
}

@end
