//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Enrique Escribano on 03/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import "AGTWineViewController.h"
#import "AGTWebViewController.h"
#import "AGTWineryTableViewController.h"


@implementation AGTWineViewController


-(id) initWithModel: (AGTWineModel *) aModel{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _model= aModel;
        
        self.title = aModel.name;
    }
    return self;
}




- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//Sincronizamos modelo y vista
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    
    self.navigationController.navigationBar.barTintColor= [UIColor colorWithRed:0.5 green:0 blue:0.13 alpha:1];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
-(IBAction) displayWeb:(id)sender{

    //Crear un webvc
AGTWebViewController *webVC = [[AGTWebViewController alloc] initWithModel:self.model];

    //hacer push
[self.navigationController pushViewController:webVC animated:YES];

}


#pragma mark - Utils

-(void) syncModelWithView{
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text=self.model.wineCompanyName;
    self.photoView.image= self.model.photo;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
 
    [self displayRating: self.model.rating];
    
    [self.notesLabel setNumberOfLines:0];
}

-(void) clearRatings{
    for (UIImageView *imgView in self.ratingViews) {
        imgView.image=nil;
    }
}


-(void)displayRating: (int) aRating{
    
    [self clearRatings];
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i=0; i<aRating;i++){
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}

-(NSString *) arrayToString: (NSArray *) anArray {
    
    NSString *repr = nil;
    
    if([anArray count] ==1){
        repr = [@"100% " stringByAppendingString: [anArray lastObject]];
    }else{
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return repr;
}


#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc{
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    
    self.navigationItem.rightBarButtonItem=nil;
}

#pragma mark - WineryTableViewControllerDelegate
-(void) wineryTableViewController:(AGTWineryTableViewController *) wineryVC didSelectWine: (AGTWineModel *) aWine{
    
    self.model= aWine;
    self.title= aWine.name;
    [self syncModelWithView];
    
}



@end
