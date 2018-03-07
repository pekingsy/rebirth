//
//  UITextField+Ext.m
//  HIYUNTON
//
//  Created by YULING MINA on 14-10-10.
//  Copyright (c) 2014年 hiyunton.com. All rights reserved.
//

#import "UITextField+Ext.h"

@implementation UITextField (Ext)

- (BOOL)isTextFieldEmptyWithWarning:(NSString *)warning
{
    if (KCNSSTRING_ISEMPTY(self.text)) {
        [ATMHud showMessage:warning];
        return YES;
    }
    return NO;
}

@end
