//
//  ViewController.h
//  PopMenuDemo
//
//  Created by KZ on 10/24/15.
//  Copyright © 2015 khaledzayed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopMenu.h"

@interface ViewController : UIViewController <PopMenuDelegate>
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *instagramButton;

@end

