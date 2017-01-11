//
//  InputCollector.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputFromPrompt:(NSString *)promptString{
    char inputChars[255];
    printf("%s",[promptString UTF8String]);
    fgets(inputChars,255,stdin);
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    NSString *input = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return input;
}


@end
