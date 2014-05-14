//
//  ViewController.h
//  Faylas
//
//  Created by Murat Polat on 13.05.2014.
//  Copyright (c) 2014 Murat Polat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface ViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *LoginPic;
@property (strong, nonatomic) IBOutlet UITextField *loginUsername;
@property (strong, nonatomic) IBOutlet UITextField *loginPassword;
- (IBAction)btnLoginLogin:(UIButton *)sender;
- (IBAction)btnLoginRegister:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIView *registerView;
@property (strong, nonatomic) IBOutlet UIImageView *registerPic;
@property (strong, nonatomic) IBOutlet UITextField *registerUsername;
@property (strong, nonatomic) IBOutlet UITextField *registerPassword;
@property (strong, nonatomic) IBOutlet UITextField *registerRePassword;
@property (strong, nonatomic) IBOutlet UITextField *registerMail;

- (IBAction)registerRegister:(UIButton *)sender;
- (IBAction)registerCancel:(UIButton *)sender;





@end
