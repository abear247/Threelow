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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *die = [[NSMutableArray alloc]init];
        GameController *controller = [[GameController alloc]init];
        for (int i = 0; i < 5; ++i){
//          NSString *name = [NSString stringWithFormat:@"dice%d",(i+1)];
            Dice *dice = [[Dice alloc]init];
            dice.held = NO;
            [dice randomize];
            NSLog(@"%@", dice);
            [die addObject:dice];
        }
        bool reroll = YES;
        while(reroll){
            char inputChars[255];
            printf("Enter roll or hold 'value':");
            fgets(inputChars, 255, stdin);
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            if ([inputString isEqualToString:@"roll"])
                for (Dice *dice in die){
                    [dice randomize];
                    if (dice.held == YES)
                        NSLog(@"[%lu]", dice.value);
                    else
                        NSLog(@"%lu", dice.value);
                }
            if ([inputString containsString:@"hold"]){
                NSInteger value = [[inputString stringByReplacingOccurrencesOfString:@"hold " withString:@""] intValue];
                [controller holdDie:value die:die];
                
            }
        
            
        }
    }
    return 0;
}
