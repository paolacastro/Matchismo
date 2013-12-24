//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Paola Castro on 12/15/13.
//  Copyright (c) 2013 thePaola. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init]; //super's designated initializer
    if (self) {
        for (int i = 0; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MATCH_BONUS = 4;
static const int MISMATCHED_PENALTY = 2;
static const int COST_TO_CHOSE = 1;

// how do I add this to git hub?

// to begin with I'm going to make it work with 3 cards then I'll make it toggle
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) { // if chosen turn it back around
            card.chosen = NO;
        } else {
            //matcha agaisnt another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]]; // matching happens here
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                    } else {
                        self.score -= MISMATCHED_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
}
@end
