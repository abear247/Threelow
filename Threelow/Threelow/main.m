//
//  main.m
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger rolls = 0;
        bool held = NO;
        NSInteger highScore;
        NSMutableArray *die = [[NSMutableArray alloc]init];
        GameController *controller = [[GameController alloc]init];
        InputCollector *display = [[InputCollector alloc]init];
        for (int i = 0; i < 5; ++i){
            Dice *dice = [[Dice alloc]init];
            [die addObject:dice];
        }
        bool reroll = YES;
        while(reroll){
            NSString *inputString = [display inputFromPrompt:@"\nroll - Reroll unheld dice \nhold 'value' - Hold dice with value \nreset - Unhold all dice \nquit - Exit program \nEnter command:"];
            
            if ([inputString isEqualToString:@"quit"]){
                reroll = NO;
                break;
            }
            
            if ([inputString isEqualToString:@"roll"]){
                if (rolls == 5)
                    NSLog(@"Max rolls, please reset");
                else if (!held)
                    NSLog(@"Hold required before roll");
                
                else{
                    ++rolls;
                    held = NO;
                    for (Dice *dice in die){
                        if (dice.held == NO)
                            [dice randomize];
                    }
                    
                }
            }
            
            if([inputString isEqualToString:@"reset"]){
                rolls = 0;
                for (Dice *dice in die)
                    dice.held = NO;
            }
            
            if ([inputString containsString:@"hold"]){
                bool haveHeld = NO;
                NSInteger value = [[inputString stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
                for (Dice *dice in die){
                    if (dice.value == value){
                        [controller holdDie:value die:die];
                        held = YES;
                    }
                }
                if (!haveHeld)
                    NSLog(@"Invalid dice value");
            }
            
            for (Dice *dice in die){
                if (dice.held == YES)
                    NSLog(@"[%@]", dice.face);
                else{
                    NSLog(@"%@", dice.face);
                }
            }
            NSLog(@"score:%lu",[controller score:die]);
            NSLog(@"rolls:%lu",rolls);
            
            
            
        }
    }
    return 0;
}
