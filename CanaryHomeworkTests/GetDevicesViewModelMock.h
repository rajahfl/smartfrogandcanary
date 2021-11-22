//
//  GetDevicesViewModelMock.h
//  CanaryHomeworkTests
//
//  Created by Ashish Jain on 11/21/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetDevicesViewModel.h"

typedef void (^GetDevicesCompletionHandler)(NSArray *_Nullable devices, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface GetDevicesViewModelMock : NSObject <GetDevicesProtocol>

- (void) getallDevicesWithError:(nonnull GetDevicesCompletionHandler)completionHandler;
- (void) getallDevicesWithSomeDevices:(nonnull GetDevicesCompletionHandler)completionHandler;
- (void) getAllDevicesWithNoDevices:(nonnull GetDevicesCompletionHandler)completionHandler;
- (void) getAllDevicesWithCompletionHandler:(GetDevicesCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
