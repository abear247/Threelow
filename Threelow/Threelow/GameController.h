//
//  GameController.h
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

@interface GameController : NSObject

@property NSMutableArray *dice;
@property NSInteger rolls;
@property BOOL held;
@property BOOL haveHeld;
@property NSInteger scoreToBeat;

-(void)holdDie:(NSInteger)number die:(NSMutableArray *)die inputCollector:(InputCollector *)inputCollector;

-(void)resetDice:(NSMutableArray *)die;

-(NSInteger)score:(NSMutableArray *)die;

-(void)rollDice:(NSMutableArray *)die;

-(void)gameState:(NSMutableArray *)die;

-(NSMutableArray *)startDice:(NSMutableArray *)die;



@end
