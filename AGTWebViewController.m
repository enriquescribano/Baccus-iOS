//
//  AGTWebViewController.m
//  Baccus
//
//  Created by Enrique Escribano on 03/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import "AGTWebViewController.h"
#import "AGTWineryTableViewController.h"

@interface AGTWebViewController ()

@end

@implementation AGTWebViewController

-(id) initWithModel: (AGTWineModel *) aModel{
    
    if(self= [super initWithNibName:nil bundle:nil]){
        _model = aModel;
        self.title= @"Web";
    }
    
    return self;
    
}

-(void) viewWillAppear:(BOOL) animated{
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
    
    //Alta en notificacion. selector- Nombre del mensaje, hay que implementarlo. object=nil - no importa quien la envie
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME
                 object:nil];
}

-(void) wineDidChange: (NSNotification *) notification{
    
    NSDictionary *dict = [notification userInfo];
    AGTWineModel *newWine = [dict objectForKey:WINE_KEY];
    
    //Actualizamos el modelo
    
    self.model = newWine;
    [self displayURL:self.model.wineCompanyWeb];
    
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
    //Baja en notificacion
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *) webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidden:(YES)];
    
}




#pragma mark - Utils

- (void) displayURL: (NSURL *) aURL{
    
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];

}




@end
