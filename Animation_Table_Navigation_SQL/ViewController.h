//
//  ViewController.h
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/17/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLite.h"
#import "Student.h"
#import "SelectPicture.h"
#import "MyAnnotation.h"

@interface ViewController : UIViewController
<SelectPicture>
@property (weak, nonatomic) IBOutlet MKMapView *myMap;

@property Student *myStudent;
@property SQLite *mySql;


@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textAge;

@property (weak, nonatomic) IBOutlet UITextField *textPhone;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *longLabel;
@property (weak, nonatomic) IBOutlet UILabel *lattLabel;

- (IBAction)saveButton:(id)sender;
- (IBAction)choosePictureButton:(id)sender;

- (IBAction)tapGesture:(id)sender;


@end

