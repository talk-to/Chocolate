#import "NSProcessInfo+TDTEnvironmentDetection.h"

@implementation NSProcessInfo (TDTEnvironmentDetection)

@dynamic tdt_isRunningTests;

// Source: http://www.objc.io/issue-1/testing-view-controllers.html

- (BOOL)tdt_isRunningTests {
  NSString* injectBundle = self.environment[@"XCInjectBundle"];
  return [injectBundle.pathExtension isEqualToString:@"octest"];
}

@end
