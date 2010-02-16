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
	BOOL					twoFingers;
	
	IBOutlet UILabel		*xField;
	IBOutlet UILabel		*yField;
	IBOutlet UILabel		*zField;

}

@end