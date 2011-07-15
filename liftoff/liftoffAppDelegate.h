//
//  liftoffAppDelegate.h
//  liftoff
//
//  Created by Joel Calado on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface liftoffAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextField  *timerText;
    NSDateFormatter *formatter;
    NSString        *dateString;
    NSColor *cordefundo;
    
    NSInteger segundos;
    NSInteger startingTime;
    
    NSInteger minutos;
    NSInteger resto;
    
    NSTimer *timer;
    
    BOOL isCounting;
    NSMutableString *countdownText;
    IBOutlet NSTextField *labelText;
}

@property (assign) IBOutlet NSWindow *window;

-(void)updateLabel;
-(IBAction)startTimer:(id)sender;
-(IBAction)stopTimer:(id)sender;
@end
