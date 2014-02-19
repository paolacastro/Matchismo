//
//  SetPlayingCard.m
//  Matchismo
//
//  Created by Paola Castro on 1/25/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "SetPlayingCard.h"

@implementation SetPlayingCard

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    BOOL isColorFeatureSet = NO;
    BOOL isNumberFeatureSet = NO;
    BOOL isShadeFeatureSet = NO;
    BOOL isShapeFeatureSet = NO;
    BOOL set = NO;
    SetPlayingCard *otherCardOne = otherCards[0];
    SetPlayingCard *otherCardTwo = otherCards[1];
    isColorFeatureSet = [ self isFeatureSetwith:@"color" card:otherCardOne andCard:otherCardTwo];
    isNumberFeatureSet = [ self isFeatureSetwith:@"number" card:otherCardOne andCard:otherCardTwo];
    isShadeFeatureSet = [ self isFeatureSetwith:@"shade" card:otherCardOne andCard:otherCardTwo];
    isShapeFeatureSet = [ self isFeatureSetwith:@"shape" card:otherCardOne andCard:otherCardTwo];
    set = isColorFeatureSet && isNumberFeatureSet && isShadeFeatureSet && isShapeFeatureSet;
    if (set) {
        score = 100;
    }
    return score;
}
-(BOOL)isFeatureSetwith:(NSString*)feature card:(SetPlayingCard*)cardOne andCard:(SetPlayingCard *)cardTwo
{
    BOOL allSame = NO;
    BOOL allDifferentPassOne = NO;
    BOOL allDifferentPassTwo = NO;
    BOOL allDifferent = NO;
    BOOL isSet = NO;
    if ([cardOne.features[feature] isEqualToString:cardTwo.features[feature]]) { // if two match
        allSame = [cardOne.features[feature] isEqualToString:self.features[feature]]; // do all 3 match
    }else{
        allDifferentPassOne = [cardOne.features[feature] isEqualToString:self.features[feature]];
        allDifferentPassTwo = [cardTwo.features[feature] isEqualToString:self.features[feature]];
        allDifferent = !allDifferentPassTwo && !allDifferentPassOne;
    }
    if (allSame) {
        isSet = YES;
    }else if (allDifferent){
        isSet = YES;
    }else{
        isSet = NO;
    }
    return isSet;
}

+(NSArray *)validFeatures
{
    return @[@"1",@"2",@"3"];
}

-(void)setNumber:(NSString *)number
{
    if ([[SetPlayingCard validFeatures] containsObject:number]) {
        _number = number;
    }
}
-(void)setShade:(NSString *)shade
{
    if ([[SetPlayingCard validFeatures] containsObject:shade]) {
        _shade = shade;
    }
}
-(void)setColor:(NSString *)color
{
    if ([[SetPlayingCard validFeatures] containsObject:color]) {
        _color = color;
    }
}
-(void)setShape:(NSString *)shape
{
    if ([[SetPlayingCard validFeatures] containsObject:shape]) {
        _shape = shape;
    }
}
- (NSDictionary *)features
{
    return @{@"color" : self.color,
             @"number" : self.number,
             @"shape" : self.shape,
             @"shade" : self.shade};
}
- (NSString *)contents
{
    return [[[self.color stringByAppendingString:self.number] stringByAppendingString:self.shape]stringByAppendingString:self.shade];
}


@end
