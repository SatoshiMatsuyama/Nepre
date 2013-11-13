//
//  TimelineViewController.m
//  NepreP
//
//  Created by Lsr on 13-11-12.
//  Copyright (c) 2013年 Lsr. All rights reserved.
//

#import "TimelineViewController.h"
#import "FoodViewController.h"

@interface TimelineViewController ()

// Private Properties:
@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;

@end

@implementation TimelineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
    self.title = @"Timeline";
    
	
    UIColor *foodColor = [[UIColor alloc]initWithRed:23.0f/255.0f green:50.0f/255.0f blue:10.0f/255.0f alpha:1.0f];
    
    
    
	if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			
			[self.navigationController.view addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem])
		{
			// If not, allocate one and add it.
            UIImage *menuImage = [UIImage imageNamed:@"menuLine"];
            
			UIBarButtonItem *revealButton = [[UIBarButtonItem alloc]
                                             initWithImage:menuImage style:UIBarButtonItemStyleBordered target:self.navigationController.parentViewController action:@selector(revealToggle:)];
            
			
            self.navigationItem.leftBarButtonItem = revealButton;
		}
        self.navigationController.navigationBar.barTintColor = foodColor;
	}
}
- (IBAction)OpenAccount:(id)sender {
    [self pushExample];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)pushExample
{
	FoodViewController *stubController = [[FoodViewController alloc] init];
	[self.navigationController pushViewController:stubController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
