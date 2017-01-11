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
        for (int i = 0; i < 5; ++i){
            Dice *dice = [[Dice alloc]init];
            dice.held = NO;
            [dice randomize];
            NSLog(@"%@", dice);
            [die addObject:dice];
        }
        bool reroll = YES;
        while(reroll){
            NSString *inputString = [display inputFromPrompt:@"\nroll - Reroll unheld dice \nhold 'value' - Hold dice with value \nreset - Unhold all dice \nquit - Exit program \nEnter command:"];
            if ([inputString isEqualToString:@"quit"]){
                reroll = NO;
                break;
            }
            if ([inputString isEqualToString:@"roll"])
                for (Dice *dice in die){
                    if (dice.held == YES)
                        NSLog(@"[%lu]", dice.value);
                    else{
                        NSLog(@"%lu", dice.value);
                        [dice randomize];
                    }
                }
            
            if ([inputString containsString:@"hold"]){
                NSInteger value = [[inputString stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
                [controller holdDie:value die:die];
                
            }
        
            
        }
    }
    return 0;
}
