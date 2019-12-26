//
//  NativeViewController.m
//  OCDemo
//
//  Created by 千阳 on 2019/12/1.
//  Copyright © 2019 千阳. All rights reserved.
//

#import "NativeViewController.h"
#import "ViewController.h"
#import <Flutter/FlutterViewController.h>

@interface NativeViewController ()
 
@property(nonatomic,strong)UIButton *showFlutterButton;
@property(nonatomic,strong)FlutterViewController *flutterViewController;
@end

@implementation NativeViewController
@synthesize flutterViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showFlutterButton];
      
//
//     flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"com.hio.dev/testMethod" binaryMessenger:flutterViewController];
//    [batteryChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//        NSLog(@"fuck...");
//    }];
//    [self addChildViewController:flutterViewController];
//    flutterViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 750);
//    [self.view addSubview:flutterViewController.view];
//    flutterViewController.view.hidden = YES;
      
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"com.hio.dev/testMethod" binaryMessenger:flutterViewController];
//       [batteryChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//           NSLog(@"fuck...");
//       }];
//       [self addChildViewController:flutterViewController];
//       flutterViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 750);
//       [self.view addSubview:flutterViewController.view];
//       flutterViewController.view.hidden = YES;
}


-(UIButton *)showFlutterButton
{
    if(!_showFlutterButton)
    {
        CGRect butFrame = CGRectMake(0, 750, self.view.frame.size.width, 30);
        _showFlutterButton = [[UIButton alloc] initWithFrame:butFrame];
        [_showFlutterButton addTarget:self action:@selector(showFlutterViewController:) forControlEvents:UIControlEventTouchUpInside];
        _showFlutterButton.backgroundColor = [UIColor blueColor];
        [_showFlutterButton setTitle:@"showFlutterVC" forState:UIControlStateNormal];
    }
    return _showFlutterButton;
}

-(void)showFlutterViewController:(UIButton *)sender
{
    [UIView animateWithDuration:.3 animations:^{
      flutterViewController.view.hidden = NO;
    }];
    
}

@end
