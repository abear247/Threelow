//
//  Dice.m
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Dice.h"

@implementation Dice


-(void)randomize{
    self.value = arc4random_uniform(6)+1;
}



@end
