//
//  Untitled4ViewController.m
//  Untitled4
//
//  Created by liu on 11-4-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Untitled4ViewController.h"
#define ccos(x)  cos(x*M_PI/180)
#define ssin(x)  sin(x*M_PI/180)

@implementation Untitled4ViewController

int XR = 160;
int YR = 180;

int cx = 20;
int cy = 240;
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
	 return YES;
 }
 


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"34.jpg"]];
	[imgView setFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:imgView];
	
	scroll = [[ UIScrollView alloc] init];
	scroll.frame = CGRectMake(0, 0, 320, 480);
	[scroll setBackgroundColor:[UIColor clearColor]];
	[scroll setContentInset:UIEdgeInsetsMake(1200, 0, 1200, 0)];
	[scroll setDelegate:self];
	[scroll setScrollEnabled:YES];
	scroll.showsVerticalScrollIndicator = NO;
	scroll.showsHorizontalScrollIndicator = NO;
	//[scroll release];
	[self.view addSubview:scroll];
	
	degreesX = [[NSMutableArray alloc] init];
	degreesY = [[NSMutableArray alloc] init];
	buttons = [[NSMutableArray alloc] init];
	degrees = [[NSMutableArray alloc] init];//0，3，6，9
	imgs = [[NSMutableArray alloc] init];
	
	for (int i=0; i<4; i++) {
		UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
		[imgs addObject:img];
	}
	
	
	for (int i= 0; i<360; i+=10) {
		int x = cx + XR*ccos(i);
		int y = cy - YR*ssin(i);
		[degreesX addObject:[NSNumber numberWithInt:x]];
		[degreesY addObject:[NSNumber numberWithInt:y]];		
		}
	
	
	for (int i = 0 ; i<12; i++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setBackgroundImage:[imgs objectAtIndex:(int)(rand()%4)] forState:UIControlStateNormal];
		[button setTitle:[NSString stringWithFormat:@"button %d",i] forState:UIControlStateNormal];
		[button addTarget:self action:@selector(ok:) forControlEvents:UIControlEventTouchUpInside];
		button.frame = CGRectMake(0, 0, 120, 20);
		button.tag = 100+i;
		[buttons addObject:button];
		
	}
}

-(void)ok:(id)sender{
	UIButton *button = (UIButton*)sender;
	NSString *title = button.titleLabel.text;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
													message:title 
												   delegate:self 
										  cancelButtonTitle:@"确定" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

BOOL boo;
int x;//新值
int xx;//旧值
int gg ;//速率
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	for (int i = 0; i<12; i++) {//按钮初始化位置
		UIButton *button =  [buttons objectAtIndex:i];
		CGRect newframe = button.frame;
		newframe.origin.x = [[degreesX objectAtIndex:i*3] intValue]-60-300-i*30;
		newframe.origin.y = [[degreesY objectAtIndex:i*3] intValue]-15;
		button.frame = newframe;
		[self.view addSubview:button];
		[ImageHelper addReflectionToView:[self.view viewWithTag:100+i]];
		//[ImageHelper addSimpleReflectionToView:[self.view viewWithTag:100+i]];
		[button release];
		[button setHidden:YES];
		[degrees addObject:[NSNumber numberWithInt: i*3]];
	}// end 按钮初始化位置
	
	[UIView beginAnimations:nil context:nil ];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationRepeatCount:1];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	
	for (int i = 0; i<12; i++) {//动画后的按钮
		UIButton *button =  [buttons objectAtIndex:i];
		CGRect newframe = button.frame;
		newframe.origin.x = [[degreesX objectAtIndex:i*3] intValue]-60;
		switch (i) {
			case 0:
				button.alpha = 1;
				button.hidden = NO;
				button.enabled = YES;
				newframe.size.width = 120;
				newframe.size.height = 30;
				break;
			case 1:
				button.alpha = 0.9;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 117;
				newframe.size.height = 27;
				break;
			case 2:
				button.alpha = 0.7;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 114;
				newframe.size.height = 24;
				break;
			case 3:
				button.alpha = 0.6;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 111;
				newframe.size.height = 21;
				break;
			case 9:
				button.alpha = 0.6;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 111;
				newframe.size.height = 21;
				break;
			case 10:
				button.alpha = 0.8;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 115;
				newframe.size.height = 25;
				break;
			case 11:
				button.alpha = 0.7;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 114;
				newframe.size.height = 24;
				break;
			default:
				button.alpha = 0.9;
				button.hidden = NO;
				button.enabled = NO;
				newframe.size.width = 117;
				newframe.size.height = 27;
				break;
		}
		button.frame = newframe;

	}// end 动画后的按钮
	
	[UIView commitAnimations];
	
} //end viewWillAppear

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
	gg++;
	NSLog(@"1111111========%i",gg);
	
	x= (int)(scrollView.contentOffset.y/4);

	if (xx>x) {
		boo = NO;//向下拖动
	}else if (xx<x) {
		boo = YES;//向上拖动
	}


	if (boo) {//向上滚动
			
		if (gg>5) {
			//+++++++++++++++++++++
			for (int i=0; i<12; i++) {
				int  m = [[degrees objectAtIndex:i] intValue];
				//NSLog(@"333333333=======%d",m);
				int j = ++m>35?0:m;
			    //NSLog(@"333333333=======%d",j);
				[degrees replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:j]];
				
				UIButton *button = [buttons objectAtIndex:i];
				//NSLog(@"button=========%d",i);
				CGRect newframe = button.frame;
				newframe.origin.x = [[degreesX objectAtIndex:j] intValue]-60;
				//NSLog(@"xxx=============%f",newframe.origin.x);
				newframe.origin.y = [[degreesY objectAtIndex:j] intValue]-15;
				//NSLog(@"yyy=============%f",newframe.origin.y);
								
				//#########################
                switch (j) {
					case 0:
						button.alpha = 1;
						button.hidden = NO;
						button.enabled = YES;
						newframe.size.width = 120;
						newframe.size.height = 30;
						break;
					case 1:
					case 35:
						button.alpha = 1;
						button.hidden = NO;
						button.enabled = YES;
						newframe.size.width = 119;
						newframe.size.height = 29;
						break;
					case 2:
					case 34:
						button.alpha = 0.9;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 118;
						newframe.size.height = 28;
						break;
					case 3:
					case 33:
						button.alpha = 0.9;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 117;
						newframe.size.height = 27;
						break;
					case 4:
					case 32:
						button.alpha = 0.8;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 116;
						newframe.size.height = 26;
						break;
					case 5:
					case 31:
						button.alpha = 0.8;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 115;
						newframe.size.height = 25;
						break;
					case 6:
					case 30:
						button.alpha = 0.7;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 114;
						newframe.size.height = 24;
						break;
					case 7:
					case 29:
						button.alpha = 0.7;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 113;
						newframe.size.height = 23;
						break;
					case 8:
					case 28:
						button.alpha = 0.6;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 112;
						newframe.size.height = 22;
						break;
					case 9:
					case 27:
						button.alpha = 0.6;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 111;
						newframe.size.height = 21;
						break;
					default:
						button.alpha = 0.0;
						button.hidden = YES;
						button.enabled = NO;
						newframe.size.width = 110;
						newframe.size.height = 20;
						break;
				}
				button.frame = newframe;

				//#########################
				
			}
			//+++++++++++++++++++++++
			gg = 0;
		}

				
		
	}else {//向下滚动
		if (gg>5) {
			//+++++++++++++++++++++++
			for (int i=0; i<12; i++) {
				int m = [[degrees objectAtIndex:i] intValue];
				int j = --m<0?35:m;
				[degrees replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:j]];
				
				UIButton *button = [buttons objectAtIndex:i];
				CGRect newframe = button.frame;
				newframe.origin.x = [[degreesX objectAtIndex:j ] intValue]-60;
				newframe.origin.y = [[degreesY objectAtIndex:j ] intValue]-15;

				
				//#########################
                switch (j) {
					case 0:
						button.alpha = 1;
						button.hidden = NO;
						button.enabled = YES;
						newframe.size.width = 120;
						newframe.size.height = 30;
						break;
					case 1:
					case 35:
						button.alpha = 1;
						button.hidden = NO;
						button.enabled = YES;
						newframe.size.width = 119;
						newframe.size.height = 29;
						break;
					case 2:
					case 34:
						button.alpha = 0.9;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 118;
						newframe.size.height = 28;
						break;
					case 3:
					case 33:
						button.alpha = 0.9;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 117;
						newframe.size.height = 27;
						break;
					case 4:
					case 32:
						button.alpha = 0.8;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 116;
						newframe.size.height = 26;
						break;
					case 5:
					case 31:
						button.alpha = 0.8;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 115;
						newframe.size.height = 25;
						break;
					case 6:
					case 30:
						button.alpha = 0.7;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 114;
						newframe.size.height = 24;
						break;
					case 7:
					case 29:
						button.alpha = 0.7;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 113;
						newframe.size.height = 23;
						break;
					case 8:
					case 28:
						button.alpha = 0.6;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 112;
						newframe.size.height = 22;
						break;
					case 9:
					case 27:
						button.alpha = 0.6;
						button.hidden = NO;
						button.enabled = NO;
						newframe.size.width = 111;
						newframe.size.height = 21;
						break;
					default:
						button.alpha = 0.0;
						button.hidden = YES;
						button.enabled = NO;
						newframe.size.width = 110;
						newframe.size.height = 20;
						break;
				}
				button.frame = newframe;
				
				//#########################
				
					}
			//+++++++++++++++++++++++
				gg=0;
		  }
	
	   	}
	xx= x;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[degreesX,degreesY,buttons,degrees,imgs,scroll release];
    [super dealloc];
}

@end
