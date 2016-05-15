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
    
    [self playVideo:@"https://youtu.be/gk8eKm4ajgM" frame:CGRectMake(20, 70, 280, 250)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) vibrate: (NSTimer *)timer {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}


- (void)playVideo:(NSString *)urlString frame:(CGRect)frame
{
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
    [videoView loadHTMLString:html baseURL:nil];
    [self.view addSubview:videoView];
    NSLog(@"%@",html);
}

@end
