//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import "UITableView+EYTools.h"

@implementation UITableView (EYTools)

-(UIView*)tableViewSectionViewWithLabel:(NSString*)labelText andFont:(UIFont*)font andHeight:(NSInteger)height{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), height)];
	[view setBackgroundColor:[UIColor lightGrayColor]];
    
	[view setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame) - 20, height)];
	[headerLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[headerLabel setTextColor:[UIColor whiteColor]];
	[headerLabel setFont:font];
	[headerLabel setText:labelText];
	[headerLabel setBackgroundColor:view.backgroundColor];
	[view addSubview:headerLabel];
	return view;
}

@end
