//
//  GameController.m
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "inputCollector.h"

@implementation GameController

-(NSMutableArray *)startDice:(NSMutableArray *)die{
    for (int i = 0; i < 5; ++i){
        Dice *dice = [[Dice alloc]init];
        [die addObject:dice];
        self.scoreToBeat = [self score:die];
    }
    return die;
}

-(void)holdDie:(NSInteger)number die:(NSMutableArray *)die inputCollector:(InputCollector *)inputCollector{
    NSString *input = [inputCollector inputFromPrompt:[NSString stringWithFormat:@"is %lu value to be held? 'y/n'", number]];
    if([input isEqualToString:@"n"]){
        return;
    }
    self.haveHeld = NO;
    
    for (Dice *dice in die){
        if (dice.value == number){
            for (Dice *dice in die){
                if (dice.value == number){
                    if (dice.held == NO)
                        dice.held = YES;
                }
            }
            self.haveHeld = YES;
        }
    }
    
    if (!self.haveHeld)
        NSLog(@"Invalid dice value");
    
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

-(void)rollDice:(NSMutableArray *)die{
    if (self.rolls == 5)
        NSLog(@"Max rolls, please reset");
    else if (!self.haveHeld)
        NSLog(@"Hold required before roll");
    
    else{
        ++self.rolls;
        self.haveHeld = NO;
        for (Dice *dice in die){
            if (dice.held == NO)
                [dice randomize];
        }
        
    }
}

-(void)gameState:(NSMutableArray *)die{
    for (Dice *dice in die){
        if (dice.held == YES)
            NSLog(@"[%@]", dice.face);
        else{
            NSLog(@"%@", dice.face);
        }
    }
    NSLog(@"score:%lu",[self score:die]);
    NSLog(@"rolls:%lu",self.rolls);
    NSLog(@"score to beat:%lu",self.scoreToBeat);
}




@end
