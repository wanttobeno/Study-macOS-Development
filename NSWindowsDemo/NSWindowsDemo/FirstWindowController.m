//
//  FirstWindowController.m
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import "FirstWindowController.h"

#import "AppDelegate.h"

@interface FirstWindowController ()

@end

@implementation FirstWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    NSDate *datenow =[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    _timeLabel.stringValue = [dateFormatter stringFromDate:datenow];
    
    
    // 必须的
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowWillClose:)
                                                 name:NSWindowWillCloseNotification
                                               object:nil];
    
}


- (IBAction)backBtnClick:(id)sender {
    AppDelegate * adelegate = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    [self.window close];

    [[adelegate->mainWindowC window] makeKeyAndOrderFront:nil];
}

// 标题栏的关闭按钮事件
- (void)windowWillClose:(NSNotification *)notification {
    
    [[NSApplication sharedApplication] stopModal];
    
}

- (void) SetSesionCode:(NSModalSession)session {
    _sessionCode = session;
}


@end
