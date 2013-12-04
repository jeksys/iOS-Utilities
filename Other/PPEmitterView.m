//
// PPEmitterView.h
// Created by Particle Playground on 11/15/2013
//

#import "PPEmitterView.h"

@implementation PPEmitterView

-(id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	
	return self;
}

+ (Class) layerClass {
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}


-(void)awakeFromNib {
    CAEmitterLayer *emitterLayer = (CAEmitterLayer*)self.layer;

	emitterLayer.name = @"emitterLayer";
	emitterLayer.emitterPosition = CGPointMake(240, -9);
	emitterLayer.emitterZPosition = 0;

	emitterLayer.emitterSize = CGSizeMake(1.00, 1.00);
	emitterLayer.emitterDepth = 0.00;

	emitterLayer.emitterShape = kCAEmitterLayerLine;

	emitterLayer.emitterMode = kCAEmitterLayerOutline;

	emitterLayer.renderMode = kCAEmitterLayerBackToFront;

	emitterLayer.seed = 2963740714;



	
	// Create the emitter Cell
	CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
	
	emitterCell.name = @"untitled";
	emitterCell.enabled = YES;

	emitterCell.contents = (id)[[UIImage imageNamed:@"Confetti.png"] CGImage];
	emitterCell.contentsRect = CGRectMake(0.00, 0.00, 1.00, 1.00);

	emitterCell.magnificationFilter = kCAFilterLinear;
	emitterCell.minificationFilter = kCAFilterLinear;
	emitterCell.minificationFilterBias = 0.00;

	emitterCell.scale = 1.00;
	emitterCell.scaleRange = 0.00;
	emitterCell.scaleSpeed = 0.10;

	emitterCell.color = [[UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.00] CGColor];
	emitterCell.redRange = 1.00;
	emitterCell.greenRange = 1.00;
	emitterCell.blueRange = 1.00;
	emitterCell.alphaRange = 0.00;

	emitterCell.redSpeed = 0.00;
	emitterCell.greenSpeed = 0.00;
	emitterCell.blueSpeed = 0.00;
	emitterCell.alphaSpeed = 0.00;

	emitterCell.lifetime = 2.31;
	emitterCell.lifetimeRange = 3.16;
	emitterCell.birthRate = 250;
	emitterCell.velocity = 150.00;
	emitterCell.velocityRange = 25.00;
	emitterCell.xAcceleration = 0.00;
	emitterCell.yAcceleration = 191.00;
	emitterCell.zAcceleration = 0.00;

	// these values are in radians, in the UI they are in degrees
	emitterCell.spin = 0.000;
	emitterCell.spinRange = 12.566;
	emitterCell.emissionLatitude = 0.000;
	emitterCell.emissionLongitude = 0.000;
	emitterCell.emissionRange = 6.283;


	
	emitterLayer.emitterCells = @[emitterCell];
}

@end
