//
//  ViewController.h
//  p01-langert
//
//  Created by Erik Langert on 1/18/17.
//  Copyright © 2017 Erik Langert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;

@property (strong, nonatomic) IBOutlet UIButton *clickyButton;

@property (strong, nonatomic) IBOutlet UITextField *customTextField;

- (IBAction)handleButtonPress:(id)sender;

@end

