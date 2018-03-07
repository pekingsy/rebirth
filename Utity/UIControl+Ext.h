//
//  UIControl+Ext.h
//  objectAssociation
//
//  Created by chaizhiyong on 14-7-18.
//  Copyright (c) 2014年 chaizhiyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Ext)

+ (NSString*)controlEventName:(UIControlEvents)controlEvent;
- (void)removeAllTargets;

@end
