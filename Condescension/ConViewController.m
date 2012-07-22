//
//  ConViewController.m
//  Condescension
//
//  Created by Chloë Bregman on 7/21/12.
//  Copyright (c) 2012 B2 Foundry. All rights reserved.
//

#import "ConViewController.h"

#import "CNMotionSensor.h"

#import <AVFoundation/AVFoundation.h>

@interface ConViewController () <CNMotionSensorDelegate, AVAudioPlayerDelegate>

@end

@implementation ConViewController {
	float _annoyanceLevel;
	
	NSArray *_characters;
	NSArray *_events;
	NSArray *_eyeAnimations;
	NSArray *_soundFiles;
	
	CNMotionSensor *_motionSensor;
	AVAudioPlayer *_audioPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (!self) return nil;
	
	return self;
}

- (void)viewDidLoad;
{
	[super viewDidLoad];
	_motionSensor = [[CNMotionSensor alloc] init];
	_motionSensor.delegate = self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)shakeEvent:(CNMotionSensor *)sensor;
{

	
	NSLog(@"Controller recieved shake event %@", _audioPlayer ? @"already playing" : @"not playing");

	NSURL *url = [[NSBundle mainBundle] URLForResource:@"UhHuhTest1" withExtension:@"m4a"];
	
	if (!_audioPlayer) {
		_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
		_audioPlayer.delegate = self;
		[_audioPlayer play];
	}
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
	_audioPlayer = nil;
}

@end
