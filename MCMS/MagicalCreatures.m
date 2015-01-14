//
//  MagicalCreatures.m
//  MCMS
//
//  Created by Evan Vandenberg on 1/13/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "MagicalCreatures.h"
#import "CreatureViewController.h"

@implementation MagicalCreatures


//Initialize creature object with necessary properties
- (instancetype)initWithName:(NSString *)creatureName :(NSString *)creatureDescription :(UIImage *)creaturePic
{
    self = [super init];
    if (self)
    {
        self.name = creatureName;
        self.detail = creatureDescription;
        self.pic = creaturePic;
        self.accessories = [NSMutableArray new];
    }

    return self;
}

@end


