//
//  SetPlayingDeck.m
//  Matchismo
//
//  Created by Paola Castro on 1/25/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "SetPlayingDeck.h"
#import "SetPlayingCard.h"

@implementation SetPlayingDeck
-(instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *color in [SetPlayingCard validFeatures]) {
            for (NSString *number in [SetPlayingCard validFeatures]) {
                for (NSString *shape in [SetPlayingCard validFeatures]) {
                    for (NSString *shade in [SetPlayingCard validFeatures]){
                        SetPlayingCard *card = [[SetPlayingCard alloc]init];
                        card.color = color;
                        card.number = number;
                        card.shape = shape;
                        card.shade = shade;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end
