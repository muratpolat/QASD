//
//  ViewController.m
//  Faylas
//
//  Created by Murat Polat on 13.05.2014.
//  Copyright (c) 2014 Murat Polat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	

	_registerView.hidden = YES;
    
    [self resignFirstResponder];
    [self imageScreen];
   

   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
    

    // Dispose of any resources that can be recreated.
}


-(void)checkFieldLogin {
    
    if ([_registerUsername.text isEqualToString:@""] || [_registerPassword.text isEqualToString:@""] || [_registerRePassword.text isEqualToString:@""] || [_registerMail.text isEqualToString:@""]) {
       
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Tüm Alanları Doldurunuz" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        [self checkPass];
        
        
    }
    
}



-(void)checkPass {
    
    
    if (![_registerPassword.text isEqualToString:_registerRePassword.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Şifre Hatası" message:@"Şifreler Aynı Değil" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        
        
       
        [self registerNewUser];
        
        
    }}




-(void)registerNewUser {
    
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _registerUsername.text;
    newUser.email = _registerMail.text;
    newUser.password = _registerPassword.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration success!");
            _loginUsername.text = nil;
            _loginPassword.text = nil;
            _registerUsername.text = nil;
            _registerPassword.text = nil;
            _registerRePassword.text = nil;
            _registerMail.text = nil;
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];

    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.loginUsername resignFirstResponder];
    [self.loginPassword resignFirstResponder];
    [self.registerUsername resignFirstResponder];
    [self.registerPassword resignFirstResponder];
    [self.registerRePassword resignFirstResponder];
    [self.registerMail resignFirstResponder];
    
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-70,320,568)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,568)];
}


-(void)imageScreen{
    
    _LoginPic.image = [UIImage imageNamed:@"bakbi.jpg"];
    _registerPic.image = [UIImage imageNamed:@"bakbi.jpg"];
    
    
}


-(void)resingforResponder {
    
   
    [_loginPassword resignFirstResponder];
    [_loginUsername resignFirstResponder];
}



- (IBAction)btnLoginLogin:(UIButton *)sender {
    
    [self resignFirstResponder];
    
    [PFUser logInWithUsernameInBackground:_loginUsername.text password:_loginPassword.text block:^(PFUser *user, NSError *error) {
        if (!error) {
            NSLog(@"Login user!");
            _loginUsername.text = nil;
            _loginPassword.text = nil;
            _registerUsername.text = nil;
            _registerPassword.text = nil;
            _registerRePassword.text = nil;
            _registerMail = nil;
          [self performSegueWithIdentifier:@"login" sender:self];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"HATA" message:@"Kullanıcı Adı şifre Yanlış" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];

    
    
    
}

- (IBAction)btnLoginRegister:(UIButton *)sender {
    
    _registerView.hidden = NO;

    
    
}
- (IBAction)registerRegister:(UIButton *)sender {
    
    [self checkFieldLogin];
    
    
}

- (IBAction)registerCancel:(UIButton *)sender {
    
      _registerView.hidden = YES;
   
    
    
}
@end
