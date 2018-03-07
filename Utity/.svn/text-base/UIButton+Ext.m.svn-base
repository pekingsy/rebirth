//
//  UIButton+Ext.m
//  objectAssociation
//
//  Created by chaizhiyong on 14-7-18.
//  Copyright (c) 2014年 chaizhiyong. All rights reserved.
//

#import "UIButton+Ext.h"
#import "UIControl+Ext.h"
#import <objc/runtime.h>

@implementation UIButton (Ext)
static char OperationKey;

- (void)removeHandleControlEvent:(UIControlEvents)controlEvent
{
    NSString *methodName = [UIControl controlEventName:controlEvent];
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations removeObjectForKey:methodName];
    [self removeTarget:self action:NSSelectorFromString(methodName) forControlEvents:controlEvent];
}

- (void)handleControlEvent:(UIControlEvents)event withBlock:(buttonControlEventBlock)block{
    
    NSString *buttonTapMethodName = [UIControl controlEventName:event];
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if (!opreations) {
        opreations = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [opreations setObject:block forKey:buttonTapMethodName];
    [self addTarget:self action:NSSelectorFromString(buttonTapMethodName) forControlEvents:event];
}

- (void)callActionBlock:(UIControlEvents)controlEvent{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if (!opreations) {
        return;
    }
    NSString *buttonTapMethodName = [UIControl controlEventName:controlEvent];
    buttonControlEventBlock block = [opreations objectForKey:buttonTapMethodName];
    if (block) {
        block(self);
    }
}

-(void) UIControlEventTouchDown{[self callActionBlock:UIControlEventTouchDown];}
-(void) UIControlEventTouchDownRepeat{[self callActionBlock:UIControlEventTouchDownRepeat];}
-(void) UIControlEventTouchDragInside{[self callActionBlock:UIControlEventTouchDragInside];}
-(void) UIControlEventTouchDragOutside{[self callActionBlock:UIControlEventTouchDragOutside];}
-(void) UIControlEventTouchDragEnter{[self callActionBlock:UIControlEventTouchDragEnter];}
-(void) UIControlEventTouchDragExit{[self callActionBlock:UIControlEventTouchDragExit];}
-(void) UIControlEventTouchUpInside{[self callActionBlock:UIControlEventTouchUpInside];}
-(void) UIControlEventTouchUpOutside{[self callActionBlock:UIControlEventTouchUpOutside];}
-(void) UIControlEventTouchCancel{[self callActionBlock:UIControlEventTouchCancel];}
-(void) UIControlEventValueChanged{[self callActionBlock:UIControlEventValueChanged];}
-(void) UIControlEventEditingDidBegin{[self callActionBlock:UIControlEventEditingDidBegin];}
-(void) UIControlEventEditingChanged{[self callActionBlock:UIControlEventEditingChanged];}
-(void) UIControlEventEditingDidEnd{[self callActionBlock:UIControlEventEditingDidEnd];}
-(void) UIControlEventEditingDidEndOnExit{[self callActionBlock:UIControlEventEditingDidEndOnExit];}
-(void) UIControlEventAllTouchEvents{[self callActionBlock:UIControlEventAllTouchEvents];}
-(void) UIControlEventAllEditingEvents{[self callActionBlock:UIControlEventAllEditingEvents];}
-(void) UIControlEventApplicationReserved{[self callActionBlock:UIControlEventApplicationReserved];}
-(void) UIControlEventSystemReserved{[self callActionBlock:UIControlEventSystemReserved];}
-(void) UIControlEventAllEvents{[self callActionBlock:UIControlEventAllEvents];}

@end
