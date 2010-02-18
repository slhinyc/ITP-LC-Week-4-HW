//
//  MyCustomView.h
//  RedSquare
//
//  Created by SLH on 02/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCustomView : UIView  {
	
	CGFloat					squareSize;
	CGFloat					rotation;
	CGColorRef				aColor;
	CGPoint					location;
	CGPoint					previousLocation;
	Boolean					firstTouch;

	BOOL					twoFingers;
	
	IBOutlet UILabel		*xField;
	IBOutlet UILabel		*yField;
	IBOutlet UILabel		*zField;
}

@end
