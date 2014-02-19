//
//  SetPlayingCard.h
//  Matchismo
//
//  Created by Paola Castro on 1/25/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "Card.h"

@interface SetPlayingCard : Card
@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *shade;
+(NSArray *) validFeatures;
@end
