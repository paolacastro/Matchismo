//
//  Card.h
//  Matchismo
//
//  Created by Paola Castro on 12/15/13.
//  Copyright (c) 2013 thePaola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;
@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) NSDictionary *features;
- (int)match:(NSArray *)otherCards;
@end
