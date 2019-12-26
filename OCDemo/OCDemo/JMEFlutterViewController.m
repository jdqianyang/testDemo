//
//  JMEFlutterViewController.m
//  OCDemo
//
//  Created by 千阳 on 2019/12/4.
//  Copyright © 2019 千阳. All rights reserved.
//
#import "JMEFlutterViewController.h"
#import <objc/runtime.h>


@interface JMEFlutterViewController ()

@property(nonatomic,strong)UIView *loadingWindow;

@end

@implementation JMEFlutterViewController

+(instancetype)shareInstance
{
    static JMEFlutterViewController *flutterViewController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flutterViewController = [[JMEFlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    });
    return flutterViewController;
}

+ (void)load
{
    /*
    Class swizzClass = [self class];
    Method original_FlutterViewDidRenderCallback = class_getInstanceMethod(swizzClass, @selector(setFlutterViewDidRenderCallback:));
    Method owner_FlutterViewDidRenderCallback = class_getInstanceMethod(swizzClass, @selector(hook_setFlutterViewDidRenderCallback:));
    IMP imp_original_FlutterViewDidRenderCallbacl = method_getImplementation(original_FlutterViewDidRenderCallback);
    IMP imp_owner_FlutterViewDidRenderCallback = method_getImplementation(owner_FlutterViewDidRenderCallback);
    char * const methodTypeFlutterViewDidRenderCallback = method_copyReturnType(original_FlutterViewDidRenderCallback);
    if(class_addMethod(swizzClass, @selector(setFlutterViewDidRenderCallback:), imp_owner_FlutterViewDidRenderCallback, methodTypeFlutterViewDidRenderCallback))
    {
        class_replaceMethod(swizzClass, @selector(hook_setFlutterViewDidRenderCallback:), imp_original_FlutterViewDidRenderCallbacl, methodTypeFlutterViewDidRenderCallback);
    }
    else
    {
        method_exchangeImplementations(original_FlutterViewDidRenderCallback, owner_FlutterViewDidRenderCallback);
    }
     */
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication].keyWindow addSubview:self.loadingWindow];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.loadingWindow.frame = [UIScreen mainScreen].bounds;
}

- (UIView *)splashScreenView
{
    UIView * splashView = [super splashScreenView];
    UIView *view = [[UIView alloc] initWithFrame:splashView.bounds];
    view.backgroundColor = [UIColor blueColor];
    [splashView addSubview:view];
    return splashView;
}

-(UIView *)loadingWindow
{
    if(!_loadingWindow)
    {
        _loadingWindow = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _loadingWindow.userInteractionEnabled = NO;
        _loadingWindow.backgroundColor = [UIColor whiteColor];
    }
    return _loadingWindow;
}

- (void)hook_setFlutterViewDidRenderCallback:(void (^)(void))callback
{
    
    [self hook_setFlutterViewDidRenderCallback:^{
        
        [self.loadingWindow removeFromSuperview];
        
        if(callback)
            callback();
        
    }];
    
}
@end
