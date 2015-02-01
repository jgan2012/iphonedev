//
//  TipCalViewController.m
//  TipCalculator
//
//  Created by Jim Gan on 1/21/15.
//  Copyright (c) 2015 Jim Gan. All rights reserved.
//

#import "TipCalViewController.h"

@interface TipCalViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *TipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipPercent;
- (IBAction)OnTap:(id)sender;

@end

@implementation TipCalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self) {
        self.title=@"Tip Calculator";
        [self updateValues];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)OnTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
    NSLog(@"a tap");
}

-(void)updateValues {
    float billAmt = [self.BillTextField.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipAmt = billAmt * [tipValues[self.TipPercent.selectedSegmentIndex] floatValue];
    float totalAmt = billAmt + tipAmt;
    self.TipAmountLabel.text=[NSString stringWithFormat:@"$%.2f",tipAmt ];
    self.TotalAmountLabel.text=[NSString stringWithFormat:@"$%.2f",totalAmt];
}
@end
