//
//  Dice.h
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property NSInteger value;
@property BOOL held;

-(void)randomize;

@end
