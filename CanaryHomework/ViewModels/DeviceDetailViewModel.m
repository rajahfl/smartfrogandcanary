//
//  DeviceDetailViewModel.m
//  CanaryHomework
//
//  Created by Ashish Jain on 11/21/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "DeviceDetailViewModel.h"
#import "CoreDataController.h"

@implementation DeviceDetailViewModel

+ (instancetype) deviceDetailViewModelWithDeviceId:(NSString *)deviceId {
    DeviceDetailViewModel *ddvm = [[DeviceDetailViewModel alloc] init];
    ddvm.deviceId = deviceId;
    return ddvm;
}

- (void) getDeviceDetailsWithCompletionHandler:(GetDeviceDetailsCompletionHandler)completionHandler {
    [[CoreDataController sharedCache] getReadingsForDevice:self.deviceId completionBlock:^(BOOL completed, BOOL success, NSArray * _Nullable objects, NSError * _Nullable error) {
        if (success) {
            self.readings = objects;
            completionHandler(objects, nil);
        } else {
            completionHandler(nil, error);
        }
    }];
}

@end
