//
//  Untitled4ViewController.h
//  Untitled4
//
//  Created by liu on 11-4-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollView.h"
#import "ImageHelper-Reflections.h"

@interface Untitled4ViewController : UIViewController<UIScrollViewDelegate>{

	
	NSMutableArray *degreesX;
	NSMutableArray *degreesY;
	NSMutableArray *buttons;
	NSMutableArray *degrees;
	NSMutableArray *imgs;
	ScrollView *scroll;
	CGPoint start , move ,end;

}
-(void)ok:(id)sender;
@end

