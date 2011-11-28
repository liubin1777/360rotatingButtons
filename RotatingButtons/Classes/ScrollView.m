    //
//  ScrollView.m
//  Untitled4
//
//  Created by liu on 11-4-8.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollView.h"


@implementation ScrollView
@synthesize isScrollUp;

-(id)init{
	return [super init];
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//	NSLog(@"touchesBegan");
//	start = [[touches anyObject] locationInView:self];
//}
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//	NSLog(@"touchesMoved");
//	move = [[touches anyObject] locationInView:self];
//	CGFloat f = start.y - move.y;
//	if (f<0.0) {
//		isScrollUp = YES;
//	}else {
//		isScrollUp = NO;
//	}
//
//}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//	NSLog(@"touchesEnded");
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"touchesBegan");
	UITouch *touch = [touches anyObject];
    start = [touch locationInView:self];
	//NSLog(@"x========%d,y============%d",gestureStartPoint.x,gestureStartPoint.y);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"touchesMoved");
	UITouch *touch = [touches anyObject];
    move = [touch locationInView:self];
	CGFloat y =move.y -start.y ;
	//NSLog(@"x========%d,y============%d",gestureEndPoint.x,gestureEndPoint.y);
	if (y>0) {
		isScrollUp = YES;
	}else {
		isScrollUp = NO;
	}
	
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"touchesEnded");
}


- (void)dealloc {
    [super dealloc];
}


@end
