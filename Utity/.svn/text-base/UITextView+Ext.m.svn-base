//
//  UITextView+Ext.m
//  HIYUNTON
//
//  Created by chaizhiyong on 14-10-18.
//  Copyright (c) 2014年 hiyunton.com. All rights reserved.
//

#import "UITextView+Ext.h"

@implementation UITextView (Ext)

- (BOOL)isTextFieldEmptyWithWarning:(NSString *)warning
{
    if (KCNSSTRING_ISEMPTY(self.text)) {
        [ATMHud showMessage:warning];
        return YES;
    }
    return NO;
}
@end
