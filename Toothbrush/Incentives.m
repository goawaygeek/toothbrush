//
//  Incentives.m
//  Toothbrush
//
//  Created by George Lu on 5/14/16.
//  Copyright © 2016 Organization of Stupid Scott. All rights reserved.
//

#import "Incentives.h"
#import <AVFoundation/AVFoundation.h>

@interface Incentives ()
@property (strong, nonatomic) NSTimer *speechTimer;
@end

@implementation Incentives

- (id)init {
    self = [super init];
    return self;
}

- (void) startCoach {
    if (!_speechTimer) {
        _speechTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(goCoach:) userInfo:nil repeats:YES];
    }
}

- (void) stopCoach {
    if([_speechTimer isValid]) {
        [_speechTimer invalidate];
    }
    _speechTimer = nil;
}

- (void) goCoach:(NSTimer *)timer {
    NSArray *stupidSpeech = @[@"Just ten more minutes!", @"Now brush your crowns", @"Think about your uncle's gross teeth", @"Trump 20 16", @"Visualize how beautiful your teeth will be"];
    
    NSUInteger randomIndex = arc4random() % [stupidSpeech count];
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[stupidSpeech objectAtIndex:randomIndex]];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    
    [syn speakUtterance:utterance];
}

@end
