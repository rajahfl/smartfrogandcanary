//
//  GetDevicesViewModelMock.m
//  CanaryHomeworkTests
//
//  Created by Ashish Jain on 11/21/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import "GetDevicesViewModelMock.h"

@interface GetDevicesViewModelMock()

@property (nonatomic, strong) NSArray *devices;
@property (nonatomic, strong) NSError *error;

@end

@implementation GetDevicesViewModelMock

- (instancetype) init {
    if (self == [super init]) {
        NSLog(@"I'm alive!");
    }
    
    return self;
}

- (void) getallDevicesWithError:(nonnull GetDevicesCompletionHandler)completionHandler {
    self.devices = nil;
    self.error = [NSError errorWithDomain:@"Some error" code:99 userInfo:nil];
    [self getAllDevicesWithCompletionHandler:completionHandler];
}

- (void) getallDevicesWithSomeDevices:(nonnull GetDevicesCompletionHandler)completionHandler {
    self.devices = [NSArray arrayWithObjects:(@(1)), @(2), @(3), nil];
    [self getAllDevicesWithCompletionHandler:completionHandler];
}

- (void) getAllDevicesWithNoDevices:(nonnull GetDevicesCompletionHandler)completionHandler {
    self.devices = [NSArray array];
    [self getAllDevicesWithCompletionHandler:completionHandler];
}

- (void)getAllDevicesWithCompletionHandler:(nonnull GetDevicesCompletionHandler)completionHandler {
    completionHandler(self.devices, self.error);
}

@end
