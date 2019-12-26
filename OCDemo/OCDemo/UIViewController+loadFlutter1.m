//
//  UIViewController+loadFlutter1.m
//  OCDemo
//
//  Created by 千阳 on 2019/12/24.
//  Copyright © 2019 千阳. All rights reserved.
//

#import "UIViewController+loadFlutter1.h"
#import <objc/runtime.h>

@implementation UIViewController (loadFlutter1)

+ (void)load
{
    Class swizzClass = [self class];
    Method original_viewDidAppear = class_getInstanceMethod(swizzClass, @selector(viewDidAppear:));
    Method owner_viewDidAppear = class_getInstanceMethod(swizzClass, @selector(hook_viewDidAppear:));
    IMP imp_original_viewDidAppear = method_getImplementation(original_viewDidAppear);
    IMP imp_owner_viewDidAppear = method_getImplementation(owner_viewDidAppear);
    char * const methodTypeviewDidAppear = method_copyReturnType(original_viewDidAppear);
    if(class_addMethod(swizzClass, @selector(viewDidAppear:), imp_owner_viewDidAppear, methodTypeviewDidAppear))
    {
        class_replaceMethod(swizzClass, @selector(hook_viewDidAppear:), imp_original_viewDidAppear, methodTypeviewDidAppear);
    }
    else
    {
        method_exchangeImplementations(original_viewDidAppear, owner_viewDidAppear);
    }
}

-(void)hook_viewDidAppear:(BOOL)animation
{
    [self hook_viewDidAppear:animation];
    NSLog(@"hook_viewDidAppear1");
}

@end
