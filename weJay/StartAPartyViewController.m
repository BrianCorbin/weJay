//
//  StartAPartyViewController.m
//  weJay
//
//  Created by Brian Corbin on 3/9/14.
//  Copyright (c) 2014 Brian Corbin. All rights reserved.
//

#import "StartAPartyViewController.h"

@interface StartAPartyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UITextField *partyNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) DataManager *dataManager;

- (IBAction)continueAction:(id)sender;

@end

@implementation StartAPartyViewController

@synthesize continueBtn, partyNameTF, passwordTF, dataManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataManager = [DataManager sharedInstance];
    
    self.navigationItem.title = @"Party Options";
	// Do any additional setup after loading the view.
    continueBtn.userInteractionEnabled = NO;
    continueBtn.hidden = YES;
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:Nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString *partyName = partyNameTF.text;
    
    if([partyName length] == 0)
    {
        continueBtn.userInteractionEnabled = NO;
        continueBtn.hidden = YES;
    }
    else
    {
        continueBtn.userInteractionEnabled = YES;
        continueBtn.hidden = NO;
    }
    return NO;
}

- (IBAction)continueAction:(id)sender {
    dataManager.partyName = partyNameTF.text;
    dataManager.partyPassword = passwordTF.text;
    
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SelectPartyPlaylistViewController"] animated:YES];
}
@end
