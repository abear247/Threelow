//
//  Dice.m
//  Threelow
//
//  Created by Alex Bearinger on 2017-01-11.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//
#import "Dice.h"

@implementation Dice

-(instancetype)init{
    self = [super init];
    if (self){
        _held = NO;
        [self randomize];
        NSLog(@"%@", self.face);
    }
    return self;
}

-(void)randomize{
    self.value = arc4random_uniform(6)+1;
    switch(self.value){
        case 1:{
            self.face = @"⚀";
            break;
        }
        case 2:{
            self.face = @"⚁";
            break;
        }
        case 3:{
            self.face = @"⚂";
            break;
        }
        case 4:{
            self.face = @"⚃";
            break;
        }
        case 5:{
            self.face = @"⚄";
            break;
        }
        case 6:{
            self.face = @"⚅";
            break;
        }
    }
}



@end
