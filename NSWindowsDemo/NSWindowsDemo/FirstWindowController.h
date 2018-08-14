//
//  FirstWindowController.h
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FirstWindowController : NSWindowController
@property(nonatomic,assign)NSModalSession sessionCode;
@property (weak) IBOutlet NSTextField *timeLabel;

- (void) SetSesionCode:(NSModalSession)session;
@end
