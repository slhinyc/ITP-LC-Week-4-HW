//
//  MyCustomView.m
//  RedSquare
//
//  Created by SLH on 02/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyCustomView.h"
#define kAccelerometerFrequency		10 //Hz


@implementation MyCustomView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib {
	
	squareSize = 50.0f;
	twoFingers = NO;
	rotation = 0.5f;
	
	self.multipleTouchEnabled = YES;
	
	[self configureAccelerometer];
}

- (void) configureAccelerometer {
	
	UIAccelerometer* theAccelerometer = [UIAccelerometer sharedAccelerometer];
	
	if(theAccelerometer) {
		theAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
		theAccelerometer.delegate = self;
	} else {
		NSLog(@"Oops! We're not running on the device!");
	}

}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	
	UIAccelerationValue x, y, z;
	x = acceleration.x;
	y = acceleration.y;
	z = acceleration.z;
	
	xField.text = [NSString stringWithFormat:@"%.5f",x];
	yField.text	= [NSString stringWithFormat:@"%.5f",y];
	zField.text = [NSString	stringWithFormat:@"%.5f",z];
	
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touches began count %d, %@", [touches count], touches);
	
	if ([touches count] > 1) {
		twoFingers = YES;
	}
	
    UITouch *touch = [[event touchesForView:self] anyObject];
	location = [touch locationInView:self];
	location.y = bounds.size.height - location.y;

	[self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touches moved count %d, %@", [touches count], touches);
		
	[self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touches moved count %d, %@", [touches count], touches);
	
	twoFingers = NO;

	
	[self setNeedsDisplay];
}


- (void) drawRect:(CGRect)rect {
    
	// Drawing code
	NSLog(@"drawRect");
	
	CGFloat centerx = rect.size.width/2;
	CGFloat centery = rect.size.height/2;
	CGFloat half = squareSize/2;
	CGRect theRect = CGRectMake(-half, -half, squareSize, squareSize);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, centerx, centery);
	
	CGContextRotateCTM(context, rotation);
	
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	
	if(!twoFingers)	{
	
	CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
	
	} else {
	
	CGContextSetRGBFillColor(context, 0.0, 0.8, 0.8, 0.8);
	
	}
	
	// Draw a rect with a red stroke
	CGContextFillRect(context, theRect);
	CGContextStrokeRect(context, theRect);
	
	// like Processing popMatrix
	CGContextRestoreGState(context);
}

- (void) dealloc {
    [super dealloc];
}


@end
