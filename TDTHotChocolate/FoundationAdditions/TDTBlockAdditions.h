#import <Foundation/Foundation.h>

/**
 Functions to schedule blocks for execution on a given thread's runloop.
 */

typedef void (^TDTSimpleBlock)(void);

void TDTRunInBackground(TDTSimpleBlock block);
void TDTRunOnMainThread(BOOL wait, TDTSimpleBlock block);
void TDTRunOnThread(NSThread *thread, BOOL wait, TDTSimpleBlock block);
void TDTRunAfterDelay(NSTimeInterval delay, TDTSimpleBlock block);
