//
//  MainWindowController.m
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.contentViewController.view.wantsLayer = YES;
    self.contentViewController.view.layer.backgroundColor = [NSColor magentaColor].CGColor;
    
    
    self->orderWindowC = [[OrderWindowController alloc] initWithWindowNibName:@"OrderWindowController"];
    
    self->firstWindowC = [[FirstWindowController alloc]initWithWindowNibName:@"FirstWindowController"];
    
    self->secondWindowC = [[SecondWindowController alloc] initWithWindowNibName:@"SecondWindowController"];
    
}

- (IBAction)mainBtnClick:(id)sender {
    
    [self->orderWindowC.window center];
    // 显示要跳出来的窗口
    [self->orderWindowC.window orderFront:nil];
    // 关闭当前窗口
    //[self.window orderOut:nil];
}

- (IBAction)showModelWindowAction:(id)sender {
    _sessionFirstCode = 0; //防止 session 模式弹出窗口后，sessionCode 没有更改。
    NSLog(@"_sessionCode2 : %d",_sessionFirstCode);
    
    [self->firstWindowC.window center];
    [[NSApplication sharedApplication]runModalForWindow:self->firstWindowC.window];
    [self->firstWindowC setSessionCode:_sessionFirstCode];
}

- (IBAction)showSessionsWindow:(id)sender {
    _sessionSecondCode = [[NSApplication sharedApplication] beginModalSessionForWindow:self->secondWindowC.window];
    [self->secondWindowC setSessionCode:_sessionSecondCode];
    NSLog(@"_sessionCode3 : %d",_sessionSecondCode);
}



@end
