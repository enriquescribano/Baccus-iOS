//
//  AGTWineViewController.h
//  Baccus
//
//  Created by Enrique Escribano on 03/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"

@interface AGTWineViewController : UIViewController <UISplitViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong, nonatomic) AGTWineModel *model;

-(id) initWithModel: (AGTWineModel *) aModel;

-(IBAction) displayWeb:(id)sender;


@end
