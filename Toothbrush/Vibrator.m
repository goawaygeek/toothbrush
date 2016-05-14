//
//  Vibrator.m
//  Toothbrush
//
//  Created by Scott Brewer on 5/14/16.
//  Copyright © 2016 Organization of Stupid Scott. All rights reserved.
//

#import "Vibrator.h"
#import <AudioToolbox/AudioServices.h>

@interface Vibrator ()
@property (strong, nonatomic) NSTimer *brushingTimer;
@end

@implementation Vibrator

- (id)init {
    self = [super init];
    return self;
}

- (void) startBrushing {
    if (!_brushingTimer) {
        _brushingTimer = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(vibrate:) userInfo:nil repeats:YES];
    }
}

- (void) stopBrushing {
    if([_brushingTimer isValid]) {
        [_brushingTimer invalidate];
    }
    _brushingTimer = nil;
}

- (void) vibrate:(NSTimer *)timer {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
