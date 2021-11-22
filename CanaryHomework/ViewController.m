//
//  ViewController.m
//  CanaryHomework
//
//  Created by Michael Schroeder on 9/19/19.
//  Copyright © 2019 Michael Schroeder. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Device+CoreDataProperties.h"
#import "GetDevicesViewModel.h"

@interface ViewController ()

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) UILayoutGuide *safeArea;
@property(nonatomic, strong) GetDevicesViewModel *viewModel;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Devices";
    // Do any additional setup after loading the view.
    self.safeArea = self.view.layoutMarginsGuide;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.viewModel = [[GetDevicesViewModel alloc] init];

    __weak ViewController *weakSelf = self;
    [self.viewModel getAllDevicesWithCompletionHandler:^(NSArray * _Nonnull devices, NSError * _Nonnull error) {
        NSLog(@"devices: %@", devices.description);

        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
        
        if (nil != error) {
            NSLog(@"error:%@", error.description);
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.viewModel getAllDevicesWithCompletionHandler:^(NSArray * _Nullable devices, NSError * _Nullable error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf.tableView reloadData];
                    });
                }];
            });
        }
    }];
    
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.tableView];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.safeArea.topAnchor] setActive:true];
    [[self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:true];
    [[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:true];
    [[self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:true];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableView Data Source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Device *device = [self.viewModel.devices objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = device.name;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.devices.count;
}

#pragma mark UITableView Delegate 

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Device *device = [self.viewModel.devices objectAtIndex:[indexPath row]];    
    DeviceDetailViewModel *ddvm = [DeviceDetailViewModel deviceDetailViewModelWithDeviceId:device.deviceID];
    DetailViewController *dvc = [DetailViewController deviceDetailViewController:ddvm];
    dvc.title = device.name;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

@end
