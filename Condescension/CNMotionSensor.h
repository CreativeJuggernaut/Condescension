//
//  CNMotionSensor.h
//  Condescension
//
//  Created by Andrew Pouliot on 7/21/12.
//  Copyright (c) 2012 B2 Foundry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CNMotionSensorDelegate;

@interface CNMotionSensor : NSObject

@property (nonatomic, readonly) float annoyanceLevel;

@property (nonatomic, weak) id<CNMotionSensorDelegate> delegate;

@end


@protocol CNMotionSensorDelegate <NSObject>

- (void)shakeEvent:(CNMotionSensor *)sensor;

@end