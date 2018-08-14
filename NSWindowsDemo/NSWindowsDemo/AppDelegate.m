//
//  AppDelegate.m
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self initMainWindow];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// add code

- (void)initMainWindow{
    
    mainWindowC = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];

    [mainWindowC.window orderFront:nil];
    
}


@end
