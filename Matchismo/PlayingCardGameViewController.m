//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Paola Castro on 1/13/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

@end
