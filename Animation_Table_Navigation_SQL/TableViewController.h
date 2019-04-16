//
//  TableViewController.h
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/21/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "SQLite.h"
#import "DetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController
@property NSMutableArray *students;
@property SQLite *mySql;
@property Student *student;
@end

NS_ASSUME_NONNULL_END
