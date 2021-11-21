//
//  GetDevicesViewModel.m
//  CanaryHomework
//
//  Created by Ashish Jain on 11/20/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "APIClient.h"
#import "CoreDataController.h"
#import "Device+CoreDataClass.h"
#import "GetDevicesViewModel.h"

@interface GetDevicesViewModel()

@end

@implementation GetDevicesViewModel

- (instancetype) init {
    if (self == [super init]) {
        NSLog(@"I'm alive!");
    }
    
    return self;
}

- (void) getAllDevicesWithCompletionHandler:(GetDevicesCompletionHandler)completionHandler {
    __weak GetDevicesViewModel *weakSelf = self;
    
    [[CoreDataController sharedCache] getAllDevices:^(BOOL completed, BOOL success, NSArray * _Nonnull objects) {
        if (success) {
            weakSelf.devices = objects;
            completionHandler(objects, nil);
        } else {
            NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:nil];
            completionHandler(nil, err);
        }
    }];
}



@end
