//
//  CreatureViewController.m
//  MCMS
//
//  Created by Evan Vandenberg on 1/13/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;
@property NSArray *accessoriesArray;
@property NSIndexPath *path;


@end

@implementation CreatureViewController

//-------------------------------REQUIRED METHODS------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Set name label to SHOW
    self.nameTextField.hidden = YES;
    self.nameLabel.hidden = NO;

    //Set description label to SHOW
    self.descriptionTextField.hidden = YES;
    self.descriptionLabel.hidden = NO;

    //Set initial name and description
    self.nameLabel.text = self.creature.name;
    self.descriptionLabel.text = self.creature.detail;
    self.creatureImage.image = self.creature.pic;
    self.accessoriesArray = [[NSArray alloc]initWithObjects:@"Sword", @"Gun", @"Bomb", @"Pipe", nil];
    
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.accessoriesArray.count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    NSString *accessory = [self.accessoriesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = accessory;

    if ([self.creature.accessories containsObject:accessory])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}


//-----------------------------------ACTIONS-----------------------------------


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.creature.accessories removeObject:[self.accessoriesArray objectAtIndex:indexPath.row]];
    }
    else
    {
        self.path = indexPath;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.creature.accessories addObject:[self.accessoriesArray objectAtIndex:indexPath.row]];
    }
    NSLog(@"cVC: %@", self.creature.accessories);
}


- (IBAction)onEditButtonPressed:(id)sender
{
    //Edit mode actions
    if ([self.editButton.title isEqualToString:@"Edit"])
    {
        [self reloadInputViews];
        self.nameTextField.hidden = NO;
        self.descriptionTextField.hidden = NO;
        self.nameLabel.hidden = YES;
        self.descriptionLabel.hidden = YES;
        self.nameTextField.text = self.nameLabel.text;
        self.descriptionTextField.text = self.descriptionLabel.text;
        self.editButton.title = @"Done";
    }
    //Disable edit mode
    else
    {
        [self.editButton.title isEqualToString:@"Edit"];
        self.nameTextField.hidden = YES;
        self.descriptionTextField.hidden = YES;
        self.nameLabel.hidden = NO;
        self.descriptionLabel.hidden = NO;
        self.nameLabel.text = self.nameTextField.text;
        self.descriptionLabel.text = self.descriptionTextField.text;
        self.creature.name = self.nameTextField.text;
        self.creature.detail = self.descriptionTextField.text;
    }
}

@end
