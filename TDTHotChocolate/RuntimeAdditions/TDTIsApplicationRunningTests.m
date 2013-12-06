#import "TDTIsApplicationRunningTests.h"

// Source: http://www.objc.io/issue-1/testing-view-controllers.html

BOOL TDTIsApplicationRunningTests(void) {
  NSDictionary* environment = [[NSProcessInfo processInfo] environment];
  NSString* injectBundle = environment[@"XCInjectBundle"];
  return [injectBundle.pathExtension isEqualToString:@"octest"];
}
