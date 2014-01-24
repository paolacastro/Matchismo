//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Paola Castro on 1/23/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}


@end
