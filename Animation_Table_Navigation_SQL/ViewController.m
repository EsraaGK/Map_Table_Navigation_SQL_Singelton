//
//  ViewController.m
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/17/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import "ViewController.h"
#import "PictureViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [_myMap setDelegate:self];//for map
     self.title =@"Add Student";
    _mySql = [SQLite sharedInstance];
    _myStudent= [Student new];
    [_mySql createDB];
    
    // Do any additional setup after loading the view.
}


- (IBAction)saveButton:(id)sender {
    
    _myStudent.Name =_textName.text;
    _myStudent.Age =_textAge.text;
    _myStudent.Phone=_textPhone.text;
    _myStudent.picName= _label.text;
   
    
    [_mySql insertDB:_myStudent];
    
    _label.text=_myStudent.Name;
    _textName.text=@"";
    _textAge.text=@"";
    _textPhone.text=@"";
    _label.text=@"";


}

- (IBAction)choosePictureButton:(id)sender {
    
    //OBJ from next view controller connected with its UI
    PictureViewController *picView = [self.storyboard instantiateViewControllerWithIdentifier:@"pictable"];
    //push the controller in the stack to go forward
    [self.navigationController pushViewController:
     picView animated:YES];
    

//
    [picView setMyProtocol:self];
//

}

- (IBAction)tapGesture:(id)sender {
    CGPoint touchedPoint =[sender  locationInView:_myMap];
    printf("x= %f , y= %f \n", touchedPoint.x , touchedPoint.y );
    
    
    CLLocationCoordinate2D touchedLocation =[_myMap convertPoint:touchedPoint toCoordinateFromView:_myMap];
    printf("x= %f , y= %f \n", touchedLocation.longitude , touchedLocation.latitude );
    
    
    MyAnnotation *myAnnotation = [MyAnnotation new];
    
    [myAnnotation setCoordinate:touchedLocation];
    [myAnnotation setTitle:@"Title^_^"];
    [myAnnotation setSubtitle:@"SUBTitle^_^"];
    [_myMap addAnnotation:myAnnotation];
   
    _myStudent.longetude=[NSString stringWithFormat:@"%f", touchedLocation.longitude];
    _myStudent.lattitude=[NSString stringWithFormat:@"%f", touchedLocation.latitude];
}
//- (MKMapRect) getMapRectUsingAnnotations:(NSArray*)theAnnotations {
//    MKMapPoint points[[theAnnotations count]];
//}
-(void) selectPic:(NSString *) picName{
    
    _label.text= picName;
}

@end
