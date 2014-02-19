//
//  StatsSetCardGameViewController.m
//  Matchismo
//
//  Created by Paola Castro on 1/26/14.
//  Copyright (c) 2014 thePaola. All rights reserved.
//

#import "StatsSetCardGameViewController.h"

@interface StatsSetCardGameViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@end

@implementation StatsSetCardGameViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSMutableAttributedString *chars = [[NSMutableAttributedString alloc] initWithString:@"yolo"];
    [chars setAttributes : @{ NSStrokeWidthAttributeName : @-3,
                             NSStrokeColorAttributeName : self.colors[@"1"]}
                    range:NSMakeRange(0, [chars length])];
    [self.body setAttributedText:chars];
    
}
@end
