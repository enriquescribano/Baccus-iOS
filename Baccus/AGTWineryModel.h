//
//  AGTWineryModel.h
//  Baccus
//
//  Created by Enrique Escribano on 04/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTWineModel.h"

@interface AGTWineryModel : NSObject


@property (readonly,nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;


-(AGTWineModel *) redWineAtIndex: (int) index;
-(AGTWineModel *) whiteWineAtIndex: (int) index;
-(AGTWineModel *) otherWineAtIndex: (int) index;

@end
