//
//  PopMenu.m
//  SnapCafe
//
//  Created by KZ on 10/23/15.
//  Copyright © 2015 NgageU. All rights reserved.
//

#import "PopMenu.h"

@implementation PopMenu
- (id)initWithMenuButton:(UIButton *)menuButton menuItems:(NSArray *)menuItems{
    
    self.menuButton = menuButton;
    self.menuItems = menuItems;
    
    for(UIButton *itemButton in self.menuItems){
        [itemButton setHidden:YES];
    }
    
    [self.menuButton addTarget:self action:@selector(dragMoving:withEvent: )
              forControlEvents: UIControlEventTouchDragInside | UIControlEventTouchDragOutside];
    
    [self.menuButton addTarget:self action:@selector(dragEnded:withEvent: )
              forControlEvents: UIControlEventTouchUpInside |
     UIControlEventTouchUpOutside];
    
    [self.menuButton addTarget:self action:@selector(menuButtonTouchDown:withEvent: )
              forControlEvents: UIControlEventTouchDown];
    
    NSLog(@"PopMenu: created");
    
    
    return self;
}


- (void)menuButtonTouchDown:(UIControl *)c withEvent:event{
    
    NSLog(@"PopMenu: opened");
    if ([self.delegate respondsToSelector:@selector(menuPressed)]) {
        [self.delegate menuPressed];
    }
    int i = 1;
    for(UIButton *itemButton in self.menuItems){
        [itemButton setHidden:NO];
        itemButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
        //        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //            // animate it to the identity transform (100% scale)
        //            itemButton.transform = CGAffineTransformIdentity;
        //        } completion:^(BOOL finished){
        //            // if you want to do something once the animation finishes, put it here
        //        }];
        
        
        [UIView animateWithDuration:0.7*i delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.3 options:0 animations:^{
            //Animations
            itemButton.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            //Completion Block
        }];
        i++;
        
    }
    
}

- (void)dragMoving:(UIControl *)c withEvent:event{
    
    NSSet* touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:[self.menuButton superview]];
    if ([self.delegate respondsToSelector:@selector(fingerDragged:)]) {
        [self.delegate fingerDragged:currentPoint];
    }
    
    
    for(UIButton *itemButton in self.menuItems){
        if ( CGRectContainsPoint(itemButton.frame, currentPoint) ) {
            NSLog(@"PopMenu: dragging in %ld",(long)itemButton.tag);
            
//            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                // animate it to the identity transform (100% scale)
//                itemButton.transform = CGAffineTransformMakeScale(1.9, 1.9);
//            } completion:^(BOOL finished){
//                // if you want to do something once the animation finishes, put it here
//            }];
            
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.2 options:0 animations:^{
                //Animations
                itemButton.transform = CGAffineTransformMakeScale(1.35, 1.35);;
                
                
            } completion:^(BOOL finished) {
                //Completion Block
            }];
            
        }
        else {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                // animate it to the identity transform (100% scale)
                itemButton.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                // if you want to do something once the animation finishes, put it here
            }];
        }
    }
    
}

- (void) dragEnded:(UIControl *)c withEvent:event{
    
    NSSet* touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:[self.menuButton superview]];
    BOOL menuItemSelected = false;
    for(UIButton *itemButton in self.menuItems){
        if ( CGRectContainsPoint(itemButton.frame, currentPoint) ) {
            NSLog(@"PopMenu: selected %ld",(long)itemButton.tag);
            menuItemSelected = true;
            [self.delegate menuItemPressed:itemButton];
        }
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            itemButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
        } completion:^(BOOL finished){
            [itemButton setHidden:YES];
            itemButton.transform = CGAffineTransformIdentity;
        }];
    }
    if (!menuItemSelected) {
        NSLog(@"PopMenu: cancelled");
        if ([self.delegate respondsToSelector:@selector(popMenuCancelled)]) {
            [self.delegate popMenuCancelled];
        }
    }
}
@end
