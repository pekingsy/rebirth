//
//  UIButton+Ext.h
//  objectAssociation
//
//  Created by chaizhiyong on 14-7-18.
//  Copyright (c) 2014年 chaizhiyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buttonControlEventBlock)(id sender);

@interface UIButton (Ext)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(buttonControlEventBlock)block;
- (void)removeHandleControlEvent:(UIControlEvents)controlEvent;

@end
