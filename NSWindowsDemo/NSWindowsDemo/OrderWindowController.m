//
//  OrderWindowController.m
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import "OrderWindowController.h"

#import "AppDelegate.h"

#include <stdlib.h>


@interface OrderWindowController ()

@end

@implementation OrderWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    NSDate *datenow =[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    _timeLabel.stringValue = [dateFormatter stringFromDate:datenow];
    
}
- (IBAction)ordefOutBtnClick:(id)sender {
    AppDelegate * adelegate = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    [self.window close];
    // 或者
    //[self.window orderOut:nil];
    [[adelegate->mainWindowC window] makeKeyAndOrderFront:nil];
}

@end
