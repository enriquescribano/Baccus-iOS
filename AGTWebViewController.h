//
//  AGTWebViewController.h
//  Baccus
//
//  Created by Enrique Escribano on 03/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"


@interface AGTWebViewController : UIViewController <UIWebViewDelegate>


@property (strong, nonatomic) AGTWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (AGTWineModel *) aModel;


@end
