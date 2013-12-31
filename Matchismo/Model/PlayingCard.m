//
//  PlayingCard.m
//  Matchismo
//
//  Created by Paola Castro on 12/15/13.
//  Copyright (c) 2013 thePaola. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if ([otherCard.suit isEqualToString:self.suit ]){
            score = 1;
        }
    } else if ([otherCards count] >= 1) {
        BOOL allMatch;
        allMatch = NO;
        NSLog(@"size from in match %d", [otherCards count]);
        NSLog(@"array %@", otherCards);
        for (PlayingCard *otherCard in otherCards) {
            if (otherCard.rank == self.rank) {
                allMatch = YES;
            } else {
                allMatch = NO;
            }
            if (!allMatch) {
                break;
            }
        }
        if (allMatch) {
            score = 50;
        }
        for (PlayingCard *otherCard in otherCards) {
            if ([otherCard.suit isEqualToString:self.suit]) {
                allMatch = YES;
            } else {
                allMatch = NO;
            }
            if (!allMatch) {
                break;
            }
        }
        if (allMatch) {
            score = 30  ;
        }

    }
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit; //because we provide setter AND getter

+ (NSArray *)validSuits
{
    return @[@"♣",@"♠",@"♦",@"♥"];
}
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {return [[self rankStrings] count]-1;}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
