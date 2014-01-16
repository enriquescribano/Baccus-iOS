//
//  AGTWineryTableViewController.h
//  Baccus
//
//  Created by Enrique Escribano on 04/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineryModel.h"



#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"


@class AGTWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController: (AGTWineryTableViewController *) wineryVC didSelectWine: (AGTWineModel *)
aWine;


@end


@interface AGTWineryTableViewController : UITableViewController

@property (nonatomic, strong) AGTWineryModel *model;
@property (nonatomic, weak) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel:(AGTWineryModel *) aModel style: (UITableViewStyle) aStyle;

@end


