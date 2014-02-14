#import "NSProcessInfo+TDTEnvironmentDetection.h"

static NSString *const InjectedBundleEnvironmentKey = @"XCInjectBundle";
static NSString *const OCTestBundlePathExtension = @"octest";
static NSString *const XCTestBundlePathExtension = @"xctest";

@implementation NSProcessInfo (TDTEnvironmentDetection)

- (BOOL)tdt_isRunningTests {
  NSString *injectedBundle = self.environment[InjectedBundleEnvironmentKey];
  NSArray *knownTestBundleExtensions = @[OCTestBundlePathExtension,
                                         XCTestBundlePathExtension];
  return [knownTestBundleExtensions containsObject:injectedBundle.pathExtension];
}

@end
