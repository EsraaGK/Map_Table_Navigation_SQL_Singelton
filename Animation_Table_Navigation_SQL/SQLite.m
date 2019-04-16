//
//  SQLite.m
//  Animation_Table_Navigation_SQL
//
//  Created by Esraa Mohamed on 3/21/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import "SQLite.h"
#import "Student.h"


@implementation SQLite

-(void)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"USERS.db"]];
    
    
    
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_usersdb) == SQLITE_OK)
    {
        char *errMsg;
        
//        const char *sql_stmt =
//        "CREATE TABLE IF NOT EXISTS USERS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE TEXT, PHONE TEXT, PICNAME TEXT, LONGETUDE TEXT, LATTETUDE TEXT);";
//
        
        const char *sql_stmt =
        "CREATE TABLE IF NOT EXISTS USERS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, AGE TEXT, PHONE TEXT, PICNAME TEXT, longitude TEXT, lattitude TEXT);";
        
        
        if (sqlite3_exec(_usersdb, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            //    _status.text = @"Failed to create table";
            printf("okay" );
            
        }else{
            printf("created");
        }
        sqlite3_close(_usersdb);
        
    } else {
        // _status.text = @"Failed to open/create database";
            printf("noooo" );
    }
    
}
-(void) insertDB:(Student*) x{
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_usersdb) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO USERS (name,age,phone, picname,longitude, lattitude) VALUES (\"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\")",
                               x.Name, x.Age,x.Phone, x.picName, x.longetude, x.lattitude];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_usersdb, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            printf("Contact added");
        } else {
            printf("Failed to add contact");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_usersdb);
    }
        
//        NSString *insertSQL = [NSString stringWithFormat:
//                               @"INSERT INTO USERS (NAME, AGE, PHONE, PICNAME, LONGETUDE, LATTETUDE) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
//                               x.Name, x.Age,x.Phone, x.picName , x.longetude , x.lattitude];
//
}

-(NSMutableArray  *) getStudentsDB{
    
    Student *x;
    
    NSMutableArray *y= [NSMutableArray new];
    
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_usersdb) == SQLITE_OK)
    {
        printf("dbpath SQLITE_OK");
        
        NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM USERS " ];
        
//        NSString *querySQL = [NSString stringWithFormat:
//                              @"SELECT NAME, AGE , PHONE , PICNAME FROM contacts WHERE ID=\"%d\" ",
//                              rowId];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_usersdb,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            printf("SQLITE_OK");
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                 printf("SQLITE_ROW)");
                
                x=[Student new];
                x.Name = [[NSString alloc]
                                  initWithUTF8String:
                                  (const char *) sqlite3_column_text(
                                                                     statement, 1)];
                
                x.Age = [[NSString alloc]
                                 initWithUTF8String:
                                 (const char *) sqlite3_column_text(
                                                                    statement, 2)];
                
                x.Phone = [[NSString alloc]
                                  initWithUTF8String:
                                  (const char *) sqlite3_column_text(
                                                                     statement, 3)];
                
                x.picName = [[NSString alloc]
                                 initWithUTF8String:
                                 (const char *) sqlite3_column_text(
                                                                    statement, 4)];
                x.longetude = [[NSString alloc]
                             initWithUTF8String:
                             (const char *) sqlite3_column_text(
                                                                statement, 5)];
                printf("%f",[x.longetude doubleValue]);
                x.lattitude = [[NSString alloc]
                             initWithUTF8String:
                             (const char *) sqlite3_column_text(
                                                                statement, 6)];
//                //_status.text = @"Match found";
                
                [y addObject:x];
            }
            sqlite3_finalize(statement);
        }else{
            printf("%s" , sqlite3_errmsg(_usersdb));
        }
        sqlite3_close(_usersdb);
    }
    return y;
}

-(void) deleteDB:(Student *) x{
    
    sqlite3_stmt  *statement;
    
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_usersdb) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"DELETE FROM USERS  WHERE NAME =\"%@\" and AGE =\"%@\" and PHONE = \"%@\"",
                               x.Name, x.Age,x.Phone];
        
        
        
        const char *insert_stmt = [insertSQL UTF8String];
        
       if( (sqlite3_prepare_v2(_usersdb, insert_stmt,
                               -1, &statement, NULL))== SQLITE_OK){
        
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            //            _status.text = @"Contact added";
            //            _name.text = @"";
            //            _address.text = @"";
            //            _phone.text = @"";
            printf("%s\n" , sqlite3_errmsg(_usersdb));
            printf("SQLITE_DONE");
        }
       }
       else {
            
            printf("%s\n" , sqlite3_errmsg(_usersdb));
            printf("SQLITE_no_DONE from DELETE\n");
            //  _status.text = @"Failed to add contact";
        }
       
        sqlite3_finalize(statement);
    }
        sqlite3_close(_usersdb);
    
}

+ (SQLite *)sharedInstance{
    static SQLite* sharedInstance = nil;
    static dispatch_once_t onePredicate;
    
    
    dispatch_once(&onePredicate, ^{
        sharedInstance = [SQLite new];
    });
    
   
    return sharedInstance;
}
@end
