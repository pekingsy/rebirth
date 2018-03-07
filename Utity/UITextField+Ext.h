//
//  UITextField+Ext.h
//  HIYUNTON
//
//  Created by YULING MINA on 14-10-10.
//  Copyright (c) 2014年 hiyunton.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Ext)

/**
 *  输入文字为空，给予提示
 *
 *  @param warning 提示文字
 *
 *  @return 是否为空
 */
- (BOOL)isTextFieldEmptyWithWarning:(NSString *)warning;

@end
