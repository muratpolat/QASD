//
//  Home.m
//  Faylas
//
//  Created by Murat Polat on 14.05.2014.
//  Copyright (c) 2014 Murat Polat. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self camereKontrol];
    [self getdata];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)getdata{
    
    // Create the post
    PFObject *myPost = [PFObject objectWithClassName:@"Post"];
    myPost[@"title"] = @"I'm Hungry";
    myPost[@"content"] = @"Where should we go for lunch?";
    
    // Create the comment
    PFObject *myComment = [PFObject objectWithClassName:@"Comment"];
    myComment[@"content"] = @"Let's do Sushirrito.";
    
    // Add a relation between the Post and Comment
    myComment[@"parent"] = myPost;
    
    // This will save both myPost and myComment
    [myComment saveInBackground];
    
    
    

}

-(void)camereKontrol{
    
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Kamera Bulunamadı"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    
    }}
    
    

- (IBAction)logout:(UIButton *)sender {
    
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)homeTakePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)homeSelectPic:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.homeImaveView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
