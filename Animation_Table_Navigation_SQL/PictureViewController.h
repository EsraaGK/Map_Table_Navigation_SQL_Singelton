//
//  PictureViewController.h
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/21/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectPicture.h"
#import "MyAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface PictureViewController : UITableViewController
@property NSMutableArray *pics ;
@property id <SelectPicture> myProtocol;
@end

NS_ASSUME_NONNULL_END
