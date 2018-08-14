//
//  MainWindowController.h
//  NSWindowsDemo
//
//  Created by wow on 2018/8/14.
//  Copyright © 2018年 wow. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OrderWindowController.h"
#import "FirstWindowController.h"
#import "SecondWindowController.h"


@interface MainWindowController : NSWindowController
{
@public
    OrderWindowController *orderWindowC;
    FirstWindowController *firstWindowC;
    SecondWindowController *secondWindowC;
}
@property(nonatomic,assign)NSModalSession sessionFirstCode;
@property(nonatomic,assign)NSModalSession sessionSecondCode;

- (IBAction)mainBtnClick:(id)sender;



@end
