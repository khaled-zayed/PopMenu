//
//  PopMenu.h
//  SnapCafe
//
//  Created by KZ on 10/23/15.
//  Copyright © 2015 NgageU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PopMenuDelegate <NSObject>
@required
-(void)menuItemPressed:(UIButton *)button;
@optional
-(void)menuPressed;
-(void)popMenuCancelled;
-(void)fingerDragged:(CGPoint)currentPoint;


@end


@interface PopMenu : NSObject
@property (nonatomic, strong) id<PopMenuDelegate> delegate;
- (id)initWithMenuButton:(UIButton *)menuButton menuItems:(NSArray *)menuItems;
@property UIButton *menuButton;
@property NSArray *menuItems;
@end
