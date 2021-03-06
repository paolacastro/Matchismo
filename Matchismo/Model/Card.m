//
//  Card.m
//  Matchismo
//
//  Created by Paola Castro on 12/15/13.
//  Copyright (c) 2013 thePaola. All rights reserved.
//

#import "Card.h"

@implementation Card
- (int)match:(NSMutableArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]){
            score += 1;
        }
    }
    return score;
}
@end
