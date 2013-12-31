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
        self.gameLevel = 1;
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
NSMutableArray *chosenCards;
// how do I add this to git hub?

// to begin with I'm going to make it work with 3 cards then I'll make it toggle

- (void)chooseCardAtIndex:(NSUInteger)index
{
    int IS_CHOSEN_COUNT = 0;
    chosenCards = [NSMutableArray arrayWithObjects:nil];
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) { // if chosen turn it back around
            card.chosen = NO;
        } else {
            //match agaisnt another card OR CARDSS??
            if (self.gameLevel == 1) {
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
                
            } else if ( self.gameLevel ==2 ) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    IS_CHOSEN_COUNT += 1;
                    [chosenCards addObject:otherCard];
                    }
                }
            NSLog(@"Game Level is: %d",self.gameLevel);
            if (IS_CHOSEN_COUNT >= 2) { //choosing 3rd card
                int matchScore = [card match:chosenCards];
                        
                if (matchScore) { // MATCH - mark them matched
                    NSLog(@"Score: %d", matchScore);
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.matched = YES;
                    }
                } else { // NO MATCH
                    self.score -= MISMATCHED_PENALTY;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
                    }
                }
            }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES; // Choose card since not chosen
        }
    }
    //NSLog(@"the IS_CHOSEN_COUNT is %d", IS_CHOSEN_COUNT);
}
@end
