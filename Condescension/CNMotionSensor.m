//
//  CNMotionSensor.m
//  Condescension
//
//  Created by Andrew Pouliot on 7/21/12.
//  Copyright (c) 2012 B2 Foundry. All rights reserved.
//

#import "CNMotionSensor.h"

#import <CoreMotion/CoreMotion.h>
#import <QuartzCore/QuartzCore.h>

static const float lowPassCoefficient = 0.9;

static const NSTimeInterval timeBetweenShakes = 0.5;

@interface CNMotionSensor ()

@property (nonatomic, readwrite) float annoyanceLevel;

@end


@implementation CNMotionSensor {
	CMMotionManager *_motionManager;
	float _filteredAcceleration;
	NSTimeInterval _lastShakeEventTime;
}

- (id)init;
{
	self = [super init];
	if (!self) return nil;
	
	_motionManager = [[CMMotionManager alloc] init];
	
	__weak CNMotionSensor *weakSelf = self;
	[_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
		CNMotionSensor *self = weakSelf;
		if (!self) return;
		
		CMAcceleration acceleration = motion.userAcceleration;
		
		float magnitude = sqrtf( acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z );
		
		_filteredAcceleration = lowPassCoefficient * _filteredAcceleration + (1.0f - lowPassCoefficient) * magnitude;
		
		if (_filteredAcceleration > 1.0 && CACurrentMediaTime() - self->_lastShakeEventTime > timeBetweenShakes ) {
			self.annoyanceLevel = self.annoyanceLevel + 0.1;
			[self.delegate shakeEvent:self];
			self->_lastShakeEventTime = CACurrentMediaTime();
		}
		
	}];
	 return self;
}

@end

