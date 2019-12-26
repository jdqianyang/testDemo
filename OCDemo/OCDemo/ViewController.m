//
//  ViewController.m
//  OCDemo
//
//  Created by 千阳 on 2019/11/29.
//  Copyright © 2019 千阳. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/FlutterViewController.h>
#import <GeneratedPluginRegistrant.h>

@interface ViewController ()

@property(nonatomic,strong)UIButton *showFlutterButton;
//@property(nonatomic,strong)FlutterViewController *flutterViewController;

@end

@implementation ViewController
//@synthesize flutterViewController;

+(ViewController *)shareInstance
{
    static ViewController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ViewController alloc] init];
    });
    return instance;
}
 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showFlutterButton];
    
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"com.hio.dev/testMethod" binaryMessenger:flutterViewController];
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"fuck...");
    }];
    [flutterViewController setFlutterViewDidRenderCallback:^{
        
    }];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [self addChildViewController:flutterViewController];
    flutterViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 750);
    [self.view addSubview:flutterViewController.view];
//    flutterViewController.view.hidden = YES;
      
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
//    [UIView animateWithDuration:.3 animations:^{
//      flutterViewController.view.hidden = NO;
//    }];
}

@end
