//
//  SQLite.h
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/21/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface SQLite : NSObject
//@property Student *student;

@property (strong , nonatomic) NSString *databasePath;

@property (nonatomic) sqlite3 *usersdb;
-(void) createDB;

-(void) insertDB:(Student*) x;

-(NSMutableArray*) getStudentsDB;

-(void) deleteDB:(Student *) x;
+(SQLite*)sharedInstance;
@end

NS_ASSUME_NONNULL_END
