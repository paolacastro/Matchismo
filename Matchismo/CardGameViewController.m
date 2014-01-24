//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Paola Castro on 12/15/13.
//  Copyright (c) 2013 thePaola. All rights reserved.
//

#import "CardGameViewController.h"
//#import "Deck.h"
//#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gameLevelButton;

@end

@implementation CardGameViewController

-(CardMatchingGame *) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck //abstract
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex]; //play
    [self updateUI];

}
  -(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        // get index of button
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        // get the card at that index
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}
- (IBAction)reset:(UIButton *)sender {
    [self resetGame];
}
- (void)resetGame
{
    self.game = Nil;
    self.game = [self game];
    for(UIButton *cardButton in self.cardButtons) {
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
}

- (IBAction)gameLevel:(UISegmentedControl *)sender {
    if (self.gameLevelButton.selectedSegmentIndex == 0) {
        [self resetGame];
        self.game.gameLevel = 1;
        NSLog(@"2-Card");
    } else if (self.gameLevelButton.selectedSegmentIndex == 1) {
        NSLog(@"3-Card");
        [self resetGame];
        self.game.gameLevel = 2;
    }
}


- (NSString *) titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
