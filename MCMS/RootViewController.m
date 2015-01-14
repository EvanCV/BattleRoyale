//
//  ViewController.m
//  MCMS
//
//  Created by Evan Vandenberg on 1/13/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreatures.h"
#import "CreatureViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *topTextField;
@property (weak, nonatomic) IBOutlet UITextField *bottomTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    MagicalCreatures *creature1 = [[MagicalCreatures alloc]initWithName:@"T-Rex" :@"Huge Dinosaur": [UIImage imageNamed:@"tRexPic"]];
    MagicalCreatures *creature2 = [[MagicalCreatures alloc]initWithName:@"The Hulk" :@"Giant with super strength": [UIImage imageNamed:@"hulkPic"]];
    MagicalCreatures *creature3 = [[MagicalCreatures alloc]initWithName:@"Caipora" :@"Protector of the forest": [UIImage imageNamed:@"samuraiPic"]];
    
    self.creaturesArray = [[NSMutableArray alloc]initWithObjects:creature1, creature2, creature3, nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creaturesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"prototypeCells"];
    MagicalCreatures *currentCell = [self.creaturesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCell.name;
    cell.detailTextLabel.text = currentCell.detail;

    return cell;
}


//NEED this to make sure the tableview updates after edits are made to the creatures details/name
- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

//Add new creature
- (IBAction)addButton:(UIButton *)sender
{
    MagicalCreatures *creature = [[MagicalCreatures alloc]initWithName:self.topTextField.text :self.bottomTextField.text: nil];
    [self.creaturesArray addObject:creature];
    NSLog(@"%@",creature);
    [self.tableView reloadData];
    self.topTextField.text = nil;
    self.bottomTextField.text = nil;
    [self.topTextField resignFirstResponder];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature = [self.creaturesArray objectAtIndex:path.row];
}


@end
