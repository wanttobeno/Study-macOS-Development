//
//  SecondWindowController.m
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import "SecondWindowController.h"

@interface SecondWindowController ()

@end

@implementation SecondWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    NSDate *datenow =[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    _timeLabel.stringValue = [dateFormatter stringFromDate:datenow];
}

- (void)windowWillClose:(NSNotification *)notification {
    
    [[NSApplication sharedApplication] stopModal];
    
    NSLog(@"_sessionCode00 : %d",_sessionCode);
    
    if (_sessionCode != 0) {
        [[NSApplication sharedApplication]endModalSession:_sessionCode];
    }
}

- (void) SetSesionCode:(NSModalSession)session {
        _sessionCode = session;
}

@end
