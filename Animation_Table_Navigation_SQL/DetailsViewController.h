//
//  DetailsViewController.h
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/22/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property Student *recievedObj ;
@property (weak, nonatomic) IBOutlet MKMapView *userMap;

@end

NS_ASSUME_NONNULL_END
