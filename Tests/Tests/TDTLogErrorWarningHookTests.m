#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTLog.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

static NSString *HookInvocationMessage;
void ArgumentSavingHook (NSString *message) {
  HookInvocationMessage = [message copy];
}

@interface TDTLogErrorWarningHookTests : XCTestCase

@end

@implementation TDTLogErrorWarningHookTests

- (void)testHookIsInvokedForErrorLogsWhenSet {
  TDTLogErrorWarningHook = ArgumentSavingHook;
  NSString *message = [NSString randomString];
  TDTLogError(@"%@", message);
  XCTAssertTrue([HookInvocationMessage containsString:message]);
  HookInvocationMessage = nil;
  TDTLogErrorWarningHook = NULL;
}

- (void)testHookIsInvokedForWarnLogsWhenSet {
  TDTLogErrorWarningHook = ArgumentSavingHook;
  NSString *message = [NSString randomString];
  TDTLogWarn(@"%@", message);
  XCTAssertTrue([HookInvocationMessage containsString:message]);
  HookInvocationMessage = nil;
  TDTLogErrorWarningHook = NULL;
}

- (void)testHookIsNotInvokedForErrorAndWarnLogsWhenNotSet {
  NSString *message = [NSString randomString];
  TDTLogError(@"%@", message);
  TDTLogWarn(@"%@", message);
  XCTAssertNil(HookInvocationMessage);
}

- (void)testHookIsNotInvokedForInfoAndVerboseLogsEvenWhenSet {
  TDTLogErrorWarningHook = ArgumentSavingHook;
  NSString *message = [NSString randomString];
  TDTLogInfo(@"%@", message);
  TDTLogVerbose(@"%@", message);
  XCTAssertNil(HookInvocationMessage);
  TDTLogErrorWarningHook = NULL;
}

@end
