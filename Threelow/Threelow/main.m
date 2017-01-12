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
        NSMutableArray *die = [[NSMutableArray alloc]init];
        GameController *controller = [[GameController alloc]init];
        InputCollector *display = [[InputCollector alloc]init];
        [controller startDice:die];
        NSLog(@"score to beat:%lu",controller.scoreToBeat);
        bool reroll = YES;
        while(reroll){
            NSString *inputString = [display inputFromPrompt:@"\nroll - Reroll unheld dice \nhold 'value' - Hold dice with value \nreset - Unhold all dice \nnew game - Start new game \nquit - Exit program \nEnter command:"];
            
            if ([inputString isEqualToString:@"quit"]){
                reroll = NO;
                break;
            }
            
            if ([inputString isEqualToString:@"roll"]){
                [controller rollDice:die];
            }
            
            if([inputString isEqualToString:@"new game"]){
                controller.rolls = 0;
                [controller resetDice:die];
                for(Dice *dice in die)
                    [dice randomize];
            }
            
            if([inputString isEqualToString:@"reset"]){
                controller.rolls = 0;
                controller.scoreToBeat = [controller score:die];
                [controller resetDice:die];
            }
            
            if ([inputString containsString:@"hold"]){
                NSInteger value = [[inputString stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
                [controller holdDie:value die:die inputCollector:display];
            }
            
            [controller gameState:die];
        }
    }
    return 0;
}
