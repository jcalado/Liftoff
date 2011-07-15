//
//  liftoffAppDelegate.m
//  liftoff
//
//  Created by Joel Calado on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "liftoffAppDelegate.h"

@implementation liftoffAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    startingTime = 62;
    segundos = startingTime;
    
    if (segundos >= 60) {
        minutos = segundos / 60;
        resto = segundos % 60;
    }
    
    if (segundos < 60) {
        minutos = 0;
        resto = segundos;
    }
    
    NSMutableString *paddedMinutes = [NSMutableString stringWithFormat:@"%02d", minutos];
    NSMutableString *paddedSeconds = [NSMutableString stringWithFormat:@"%02d", resto];
    
    countdownText = [NSMutableString stringWithFormat:@"%@:%@", paddedMinutes, paddedSeconds];
    
    [labelText setStringValue:countdownText];
    
    
    //cordefundo = [[NSColor alloc] init];
    cordefundo = [NSColor colorWithDeviceRed:0.0000 green:0.0000 blue:0.0000 alpha:1.0000];
    [window setBackgroundColor:cordefundo];
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
}

-(void)updateLabel
{
    // update your label
    //dateString = [formatter stringFromDate:[NSDate date]];
    if (segundos == 0 && minutos == 0) {
        [window setBackgroundColor:[NSColor colorWithDeviceRed:1.0000 green:0.0000 blue:0.0000 alpha:1.0000]];
    }
    
    if (segundos >= 60) {
        minutos = segundos / 60;
        resto = segundos % 60;
    }
    
    if (segundos < 60) {
        minutos = 0;
        resto = segundos;
    }
    
    NSMutableString *paddedMinutes = [NSMutableString stringWithFormat:@"%02d", minutos];
    NSMutableString *paddedSeconds = [NSMutableString stringWithFormat:@"%02d", resto];
    
    countdownText = [NSMutableString stringWithFormat:@"%@:%@", paddedMinutes, paddedSeconds];
    
    [labelText setStringValue:countdownText];
    
    if (segundos != 0) {
        segundos = segundos -1 ;
        
    }; 
    
    
}

-(IBAction)startTimer:(id)sender
{

    if (!isCounting) {
        // Gentleman, start your engines!
        timer = [NSTimer scheduledTimerWithTimeInterval:1  target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
        
        isCounting = TRUE;
    }
    
}

-(IBAction)stopTimer:(id)sender
{
    if (isCounting) {
        [timer invalidate];
        timer = nil;
        segundos = startingTime;
        
        isCounting = FALSE;
        [self updateLabel];
    }
    
}
@end
