//
//  MagicalCreatures.h
//  MCMS
//
//  Created by Evan Vandenberg on 1/13/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreatures : NSObject


//Required properties for Magical Creatures
@property NSString *name;
@property NSString *detail;
@property UIImage *pic;
@property NSMutableArray *accessories;

//Initializing method
- (instancetype)initWithName: (NSString *)creatureName : (NSString *)creatureDescription : (UIImage *)creaturePic;

@end
