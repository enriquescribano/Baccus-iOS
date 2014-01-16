//
//  AGTWineryTableViewController.m
//  Baccus
//
//  Created by Enrique Escribano on 04/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import "AGTWineryTableViewController.h"
#import "AGTWineViewController.h"

@interface AGTWineryTableViewController ()

@end

@implementation AGTWineryTableViewController


-(id) initWithModel:(AGTWineryModel *) aModel style: (UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]){
        _model= aModel;
        self.title = @"Baccus";
    }
    return self;
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    self.navigationController.navigationBar.barTintColor= [UIColor colorWithRed:0.5 green:0 blue:0.13 alpha:1];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section== RED_WINE_SECTION){
        return @"Red wines";
    } else if ( section == WHITE_WINE_SECTION){
        return @"White wines";
    } else {
        return @"Other wines";
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == RED_WINE_SECTION){
        return self.model.redWineCount;
    }else if(section == WHITE_WINE_SECTION){
        return self.model.whiteWineCount;
    }else
        return self.model.otherWineCount;
    // Return the number of rows in the section.
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        //Tenemos que crearla a mano
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //Averiguar de que modelo (vino) me estan hablando
    AGTWineModel *wine = nil;
    if(indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if(indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
         wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // Sincronizar celda (vista) y modelo (vino)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //suponemos que estamos en un navigation controller
    
    
    //Averiguamos de que vino se trata
    AGTWineModel *wine = nil;
    
    if(indexPath.section ==RED_WINE_SECTION){
        wine =[self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section ==WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    } else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    [self.delegate wineryTableViewController:self didSelectWine:wine];

    
    //Creamos una notificacion
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                          object:self
                                                    userInfo:@{WINE_KEY: wine}];
    
    //Enviamos la notificacion
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
}


@end
