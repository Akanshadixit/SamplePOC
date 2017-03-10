//
//  LocationModel.h
//  JsonParser
//
//  Created by magic on 27/12/16.
//  Copyright © 2016 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationModel : NSObject
@property (readwrite,nonatomic) NSString *title;
@property (readonly) NSString *place;
@property (readonly) NSNumber *latitude;
@property (readonly) NSNumber *longitude;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;
@end
