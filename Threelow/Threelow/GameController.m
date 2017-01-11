//
//  GameController.m
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

-(void)holdDie:(NSInteger)number die:(NSMutableArray *)die{
    for (Dice *dice in die){
        if (dice.value == number)
            dice.held = YES;
    }
}

@end
