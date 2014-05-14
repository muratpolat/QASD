//
//  Home.h
//  Faylas
//
//  Created by Murat Polat on 14.05.2014.
//  Copyright (c) 2014 Murat Polat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Home : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *homeImaveView;
@property (strong, nonatomic) IBOutlet UILabel *homeUserName;
- (IBAction)logout:(UIButton *)sender;
- (IBAction)homeTakePhoto:(UIButton *)sender;
- (IBAction)homeSelectPic:(UIButton *)sender;

@end
