//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Paola Castro on 1/23/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetPlayingDeck.h"
#import "StatsSetCardGameViewController.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) NSDictionary *colors;
@property (strong, nonatomic) NSDictionary *numbers;
@property (strong, nonatomic) NSDictionary *shapes;
@property (strong, nonatomic) NSDictionary *shades;
@end

@implementation SetCardGameViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"set stats"]) {
        if ( [segue.destinationViewController isKindOfClass:[StatsSetCardGameViewController class]] ) {
            StatsSetCardGameViewController *ss = (StatsSetCardGameViewController *)segue.destinationViewController;
            ss.colors = self.colors;
        }
    }
}

- (NSDictionary *)colors
{
    _colors = @{@"1": [UIColor greenColor],@"2": [UIColor redColor],@"3": [UIColor blueColor]};
    return _colors;
}
- (NSDictionary *)numbers
{
    _numbers = @{@"1": @1,@"2": @2,@"3": @3};
    return _colors;
}
- (NSDictionary *)shapes
{
    _shapes = @{@"1":@"O", @"2":@"A", @"3":@"I"};
    return _shapes;
}

- (NSDictionary *)shades
{
    _shades = @{@"1": @0,@"2": @1,@"3": @1};
    return _shades;
}

- (Deck *)createDeck
{
    return [[SetPlayingDeck alloc]init];
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:@"cardfront"];
}
- (NSString *)cardString:(NSString *)mold repeat:(NSString *)repeatString
{
    NSString *s = Nil;
    if ([repeatString isEqualToString: @"1"]){
        s = mold;
    }else if ([repeatString isEqualToString: @"2"]) {
        
        s = [mold stringByAppendingString:mold];
        
    }else if ([repeatString isEqualToString:@"3"]){
        s = [[mold stringByAppendingString:mold] stringByAppendingString:mold];
    }
    return s;
}

//- (NSString *) setShading:(NSString *)color withAlpha:(CGFloat)alphaToUse
//{
//    NSString *s = Nil;
//    if ([color isEqualToString: @"1"]){
//        UIColor *colorApplied = [UIColor colorWithRed:0 green:1 blue:0 alpha:alphaToUse];
//    }else if ([color isEqualToString: @"2"]) {
//
//        UIColor *colorApplied = [UIColor colorWithRed:1 green:0 blue:0 alpha:alphaToUse];
//    }else if ([color isEqualToString:@"3"]){
//        UIColor *colorApplied = [UIColor colorWithRed:0 green:0 blue:1 alpha:3alphaToUse];
//    }
//    return s;
//}

- (NSMutableAttributedString *) titleForCard:(Card *)card
// here the controller will figure out how to display the card attribues
{
    NSMutableAttributedString *title =
    [[NSMutableAttributedString alloc] initWithString:[self cardString:self.shapes[card.features[@"shape"]] repeat:card.features[@"number"]]];
    
    [title setAttributes: @{ NSStrokeWidthAttributeName : @-3,
                              NSStrokeColorAttributeName: self.colors[card.features[@"color"]]}
//                             NSForegroundColorAttributeName : [self setShading:card.features[@"color"] withAlpha:self.shades[card.features[@"shade"]]]}
                   range:NSMakeRange(0, [title length])];
    
    // DEBUGGING
    
    return title;
}

@end
