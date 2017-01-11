//
//  GameController.h
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property NSMutableArray *dice;

-(void)holdDie:(NSInteger)number die:(NSMutableArray *)die;

-(void)resetDice:(NSMutableArray *)die;

@end
