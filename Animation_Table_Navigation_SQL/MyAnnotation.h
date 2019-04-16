//
//  MyAnnotation.h
//  Map_Annotation
//
//  Created by Esraa Mohamed on 3/29/19.
//  Copyright © 2019 Esraa Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAnnotation : NSObject
<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;


// Title and subtitle for use by selection UI.
@property (nonatomic,  copy) NSString *title;
@property (nonatomic,  copy) NSString *subtitle;

// Called as a result of dragging an annotation view.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(10_9, 4_0);

@end

NS_ASSUME_NONNULL_END
