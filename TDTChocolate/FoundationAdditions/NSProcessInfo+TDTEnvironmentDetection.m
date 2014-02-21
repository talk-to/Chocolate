#import "NSProcessInfo+TDTEnvironmentDetection.h"
#import "TDTAssert.h"
#include <sys/sysctl.h>

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

- (BOOL)tdt_isDebugged {
  int                 junk;
  int                 mib[4];
  struct kinfo_proc   info;
  size_t              size;

  // Initialize the flags so that, if sysctl fails for some bizarre
  // reason, we get a predictable result.
  info.kp_proc.p_flag = 0;

  // Initialize mib, which tells sysctl the info we want, in this case
  // we're looking for information about a specific process ID.
  mib[0] = CTL_KERN;
  mib[1] = KERN_PROC;
  mib[2] = KERN_PROC_PID;
  mib[3] = getpid();

  // Call sysctl.
  size = sizeof(info);
  junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
  TDTCAssert(junk == 0);

  // We're being debugged if the P_TRACED flag is set.
  return ((info.kp_proc.p_flag & P_TRACED) != 0);
}

@end
