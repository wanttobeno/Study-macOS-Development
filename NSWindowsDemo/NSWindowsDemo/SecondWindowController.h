//
//  SecondWindowController.h
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SecondWindowController : NSWindowController

@property(nonatomic,assign)NSModalSession sessionCode;


- (void) SetSesionCode:(NSModalSession)session;
@property (weak) IBOutlet NSTextField *timeLabel;

@end





