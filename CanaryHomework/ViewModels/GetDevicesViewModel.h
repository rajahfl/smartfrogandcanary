//
//  GetDevicesViewModel.h
//  CanaryHomework
//
//  Created by Ashish Jain on 11/20/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GetDevicesCompletionHandler)(NSArray *_Nullable devices, NSError *_Nullable error);

@interface GetDevicesViewModel : NSObject

@property (nonatomic, strong) NSArray *devices;

- (instancetype) init;
- (void) getAllDevicesWithCompletionHandler:(GetDevicesCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
