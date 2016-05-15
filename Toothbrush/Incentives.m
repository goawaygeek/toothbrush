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
    NSArray *stupidSpeech = @[@"Just ten more minutes!", @"Now brush your crowns", @"Think about your uncle's gross teeth", @"Trump 20 16", @"Visualize how beautiful your teeth will be",@"Why did the toothbrush cross the road? To get to other side. L O L", @"Give me 5 more strokes!", @"Put your shoulder into it.",@"Hey, stop getting so much water on me",@"For best results, brush 3 times a day",@"Did you floss?",@"Your tongue could use more brushing",@"What do you think happens when you die?",@"Those cavities don't stand a chance",@"Tartar? I hardly even know her",@"Take that, plaque!",@"Nice teeth",@"Fun fact, the average American spends 3 years brushing teeth over his or her lifetime.",@"Brush at a 90 degree angle",@"Replace your toothbrush every month",@"Replace your toothbrush when you hear my screams",@"AAAAHHHHHHHH",@"Brush at least twice a day",@"You have really nice teeth",@"Heh",@"Give your gums a bit more attention",@"You're moving too fast",@"You're moving too slow"];
    
    NSUInteger randomIndex = arc4random() % [stupidSpeech count];
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[stupidSpeech objectAtIndex:randomIndex]];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    
    [syn speakUtterance:utterance];
}

@end
