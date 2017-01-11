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
        if (dice.value == number){
            if (dice.held == NO)
                dice.held = YES;
            else
                dice.held = NO;
            }
    }
}

-(void)resetDice:(NSMutableArray *)die{
    for (Dice *dice in die)
        dice.held = NO;
}

-(NSInteger)score:(NSMutableArray *)die{
    NSInteger score = 0;
    for (Dice *dice in die)
        if (dice.value != 3)
            score = score+dice.value;
    return score;
}

@end
