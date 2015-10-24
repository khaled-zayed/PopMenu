//
//  ViewController.m
//  PopMenuDemo
//
//  Created by KZ on 10/24/15.
//  Copyright © 2015 khaledzayed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    PopMenu *popMenu;
}

@end

@implementation ViewController
@synthesize facebookButton, shareButton, instagramButton, twitterButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *menuItemsArray = [[NSArray alloc]initWithObjects:facebookButton, instagramButton, twitterButton, nil]; //create NSArray with the menu items ordered from left to right
    popMenu = [[PopMenu alloc]initWithMenuButton:shareButton menuItems:menuItemsArray]; //initialize PopMenu
    popMenu.delegate = self; //specify delegate
}
#pragma mark - PopMenuDelegate
-(void)menuItemPressed:(UIButton *)button{
    //required - returns the button the user selected
    if (button == facebookButton) {
        NSLog(@"Facebook Selected");
    }
    else if (button == instagramButton) {
        NSLog(@"Instagram Selected");
    }
    else if (button == twitterButton) {
        NSLog(@"Twitter Selected");
    }
    
}
-(void)menuPressed{
    //optional - do something when user presses on the menu button
}
-(void)popMenuCancelled{
    //optional - do something when user cancels menu
}
-(void)fingerDragged:(CGPoint)currentPoint{
    //optional - track user finger
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
