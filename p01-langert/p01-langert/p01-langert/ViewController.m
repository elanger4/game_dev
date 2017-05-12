//
//  ViewController.m
//  p01-langert
//
//  Created by Erik Langert on 1/18/17.
//  Copyright © 2017 Erik Langert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.helloLabel.text = @"Hello World!";
    self.helloLabel.font = [self.helloLabel.font fontWithSize:25];
    
    [self.clickyButton setTitle:@"Press Me!" forState:(UIControlStateNormal)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonPress:(id)sender {
    self.helloLabel.text = self.customTextField.text;
    CGFloat hue = arc4random() % 256 / 256.0;
    CGFloat saturation = ( arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5;
    UIColor * color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.view.backgroundColor = color;
    //self.view.backgroundColor = [UIColor redColor];
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
    
    [self.customTextField resignFirstResponder];
}

@end
