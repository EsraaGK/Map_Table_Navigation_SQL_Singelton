//
//  DetailsViewController.m
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/22/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _name.text=_recievedObj.Name;
    _age.text=_recievedObj.Age;
    _phone.text=_recievedObj.Phone;
    UIImage *img = [UIImage imageNamed:_recievedObj.picName];
    [_imageview setImage:img] ;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [_recievedObj.lattitude doubleValue];
    printf("%f",[_recievedObj.lattitude doubleValue]);
    coordinate.longitude = [_recievedObj.longetude doubleValue];
    coordinate=CLLocationCoordinate2DMake(coordinate.latitude , coordinate.longitude);
    //_userMap.region = MKCoordinateRegionMakeWithDistance(coordinate, 2000, 2000);
    MyAnnotation *myAnnotation = [MyAnnotation new];
    
    [myAnnotation setCoordinate:coordinate];
    [myAnnotation setTitle:@"Title^_^"];
    [myAnnotation setSubtitle:@"SUBTitle^_^"];
    [_userMap addAnnotation:myAnnotation];
    
    //[self.view addSubview:_userMap];
    [_userMap setDelegate:self];
    
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
