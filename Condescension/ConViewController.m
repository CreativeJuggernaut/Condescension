//
//  ConViewController.m
//  Condescension
//
//  Created by Chloë Bregman on 7/21/12.
//  Copyright (c) 2012 B2 Foundry. All rights reserved.
//

#import "ConViewController.h"

#import "CNMotionSensor.h"

@interface ConViewController () <CNMotionSensorDelegate>

@end

@implementation ConViewController {
	float _annoyanceLevel;
	
	NSArray *_characters;
	NSArray *_events;
	NSArray *_eyeAnimations;
	NSArray *_soundFiles;
	
	CNMotionSensor *_motionSensor;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (!self) return nil;
	
	_motionSensor = [[CNMotionSensor alloc] init];
	_motionSensor.delegate = self;
	
	return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)shakeEvent:(CNMotionSensor *)sensor;
{
	NSLog(@"Controller recieved shake event");
}

@end
