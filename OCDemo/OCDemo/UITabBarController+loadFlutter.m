
//
//  UITabBarController+loadFlutter.m
//  OCDemo
//
//  Created by 千阳 on 2019/12/24.
//  Copyright © 2019 千阳. All rights reserved.
//

#import "UITabBarController+loadFlutter.h"

#import <objc/runtime.h>

@implementation UITabBarController (loadFlutter)

+ (void)load
{
    Class swizzClass = [self class];
    Method original_selectedIndex = class_getInstanceMethod(swizzClass, @selector(selectedIndex));
    Method owner_selectedIndex = class_getInstanceMethod(swizzClass, @selector(hook_selectedIndex));
    IMP imp_original_selectedIndex = method_getImplementation(original_selectedIndex);
    IMP imp_owner_selectedIndex = method_getImplementation(owner_selectedIndex);
    char * const methodselectedIndex = method_copyReturnType(original_selectedIndex);
    if(class_addMethod(swizzClass, @selector(selectedIndex), imp_owner_selectedIndex, methodselectedIndex))
    {
        class_replaceMethod(swizzClass, @selector(hook_selectedIndex), imp_original_selectedIndex, methodselectedIndex);
    }
    else
    {
        method_exchangeImplementations(original_selectedIndex, owner_selectedIndex);
    }
    
    
    
  Method original_selectedViewController = class_getInstanceMethod(swizzClass, @selector(selectedViewController));
    Method owner_selectedViewController = class_getInstanceMethod(swizzClass, @selector(hook_selectedViewController));
    IMP imp_original_selectedViewController = method_getImplementation(original_selectedViewController);
    IMP imp_owner_selectedViewController = method_getImplementation(owner_selectedViewController);
    char * const methodselectedViewController = method_copyReturnType(original_selectedViewController);
    if(class_addMethod(swizzClass, @selector(selectedViewController), imp_owner_selectedViewController, methodselectedViewController))
    {
        class_replaceMethod(swizzClass, @selector(hook_selectedViewController), imp_original_selectedViewController, methodselectedViewController);
    }
    else
    {
        method_exchangeImplementations(original_selectedIndex, owner_selectedIndex);
    }
    
}

- (UIViewController *)hook_selectedViewController
{
    UIViewController *viewController = [self hook_selectedViewController];
    
    
    
    return viewController;
}

- (NSUInteger)hook_selectedIndex
{
    NSUInteger index = [self hook_selectedIndex];
    NSLog(@"hook_selectedIndex");
    return index;
}

@end
