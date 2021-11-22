//
//  GetDevicesTests.m
//  CanaryHomeworkTests
//
//  Created by Ashish Jain on 11/21/21.
//  Copyright © 2021 Michael Schroeder. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GetDevicesViewModelMock.h"

@interface GetDevicesTests : XCTestCase

@end

@implementation GetDevicesTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGetAllDevicesSomeObjects {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test 1: task longer than timeout"];
    
    GetDevicesViewModelMock *vmm = [[GetDevicesViewModelMock alloc] init];
    
    [vmm getallDevicesWithSomeDevices:^(NSArray * _Nullable devices, NSError * _Nullable error) {
        XCTAssertNil(error);
        XCTAssertNotNil(devices);
        XCTAssertTrue(devices.count > 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

- (void)testGetAllDevicesNoObjects {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test 1: task longer than timeout"];
    
    GetDevicesViewModelMock *vmm = [[GetDevicesViewModelMock alloc] init];
    
    [vmm getAllDevicesWithNoDevices:^(NSArray * _Nullable devices, NSError * _Nullable error) {
        XCTAssertNil(error);
        XCTAssertNotNil(devices);
        XCTAssertTrue(devices.count == 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

- (void)testGetAllDevicesError {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test 1: task longer than timeout"];
    
    GetDevicesViewModelMock *vmm = [[GetDevicesViewModelMock alloc] init];
    __block NSError *err = nil;
    
    [vmm getallDevicesWithError:^(NSArray * _Nullable devices, NSError * _Nullable error) {
        err = error;
        
        XCTAssertNotNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}


@end
