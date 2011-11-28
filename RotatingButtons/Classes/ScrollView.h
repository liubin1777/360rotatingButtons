//
//  ScrollView.h
//  Untitled4
//
//  Created by liu on 11-4-8.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScrollView : UIScrollView {
	BOOL isScrollUp;
	CGPoint start, move, end;
}
@property BOOL isScrollUp;
@end
