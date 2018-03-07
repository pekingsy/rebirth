//
//  UICopyLabel.m
//  HIYUNTON
//
//  Created by zhaozhibo on 15/2/4.
//  Copyright (c) 2015年 hiyunton.com. All rights reserved.
//

#import "UICopyLabel.h"

@implementation UICopyLabel


//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}

//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    
//    //双击
//    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    touch.numberOfTapsRequired = 2;
//     [self addGestureRecognizer:touch];
   
    //长按1s
    UILongPressGestureRecognizer* LongPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    LongPress.minimumPressDuration = 1.0;
    //双击或者单击
    //LongPress.numberOfTapsRequired = 2;
    [self addGestureRecognizer:LongPress];
   

}

//同上
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}


//我们已经可以接收到事件了！由于我在上方将tap数设为2，所以需要双击才能捕获，接下来，我们需要处理这个tap，以便让菜单栏弹出来：

-(void)handleTap:(UIGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
    UIMenuItem *copyLink = [[UIMenuItem alloc] init]; //UIMenuItem 自己带着拷贝
    

    if (([self.text rangeOfString:@"http://"].length>0)||([self.text rangeOfString:@"https://"].length>0)||([self.text rangeOfString:@"Http://"].length>0)) {
        
    }
    //判断字符串是否包含
//    
//    //if (range.location ==NSNotFound)//不包含
//    if (range.length >0)//包含
    
  //  UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];

    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}


//  自己带有 拷贝按钮  哎呀

//还需要针对复制的操作覆盖两个方法：

// 可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

//针对于响应方法的实现
-(void)copy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}


@end
