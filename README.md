# PopMenu
PopMenu is a simple library that implements a pop out menu. 
<p align="center" >
  <img src="http://khaledzayed.com/PopMenu/animated.gif" alt="PopMenu" title="PopMenu">
</p>


The menu pops out around the menu button and the user simply drags his finger to the menu item of his choice. 

When the user's finger is dragged over a menu item the button is enlarged. If the user removes his finger from the screen outside the borders of all menu items the menu closes. 

The menu is simple, fast and user friendly.

##Get Started
- [Download PopMenu](https://github.com/khaled-zayed/PopMenu/archive/master.zip) and try the bundled example project
- Read the README file or the documentation below

##Installing PopMenu
- Just add the files in PopMenu folder to your project

##How to use PopMenu
include the `PopMenu.h` to your ViewController and implement `PopMenu Delegate`
```objective-c
#import "PopMenu.h"

@interface ViewController : UIViewController <PopMenuDelegate>
```

###Declare PopMenu Object
```objective-c
#import "ViewController.h"

@interface ViewController (){
    PopMenu *popMenu;
}
```
###Initializing PopMenu
- Declare UIButtons in your ViewConroller
- Create NSArray with menuItems Buttons
```objective-c
    NSArray *menuItemsArray = [[NSArray alloc]initWithObjects:facebookButton, instagramButton, twitterButton, nil]; //create NSArray with the menu items ordered from left to right
```
- Initialize PopMenu Object
```objective-c
    popMenu = [[PopMenu alloc]initWithMenuButton:shareButton menuItems:menuItemsArray]; //initialize PopMenu
```
- Specify PopMenu Delegate
```objective-c
popMenu.delegate = self; //specify delegate
```
- Implement REQUIRED delegate method
```objective-c
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
```
##Optional Delegate Methods:
```objective-c
-(void)menuPressed{
    //optional - do something when user presses on the menu button
}
```
```objective-c
-(void)popMenuCancelled{
    //optional - do something when user cancels menu
}
```
```objective-c
-(void)fingerDragged:(CGPoint)currentPoint{
    //optional - track user finger
}
```
###Developed By
Khaled Zayed
contactme@khaledzayed.com
