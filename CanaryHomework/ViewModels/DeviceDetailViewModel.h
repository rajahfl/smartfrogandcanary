//
//  DeviceDetailViewModel.h
//  CanaryHomework
//
//  Created by Ashish Jain on 11/21/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GetDeviceDetailsCompletionHandler)(NSArray *_Nullable readings, NSError *_Nullable error);

@interface DeviceDetailViewModel : NSObject

@property (nonatomic, strong) NSString *deviceId;
@property (nonatomic, strong) NSArray *readings;

+ (instancetype) deviceDetailViewModelWithDeviceId:(NSString *)deviceId;
- (void) getDeviceDetailsWithCompletionHandler:(GetDeviceDetailsCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
