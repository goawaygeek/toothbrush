//
//  ViewController.m
//  Toothbrush
//
//  Created by Scott Brewer on 5/14/16.
//  Copyright © 2016 Organization of Stupid Scott. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Vibrator.h"
#import "Incentives.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Vibrator *vibe = [[Vibrator alloc] init];
    [vibe startBrushing];
    
    Incentives *jerk = [[Incentives alloc] init];
    [jerk startCoach];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) vibrate: (NSTimer *)timer {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
