//
//  RARecipeViewController.m
//  Recipe App
//
//  Created by jacob cook on 9/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeViewController.h"
#import "RARecipes.h"
#import "RecipeDetailViewController.h"

static NSString *recipeID = @"recipeID";

@interface RARecipeViewController () <UITableViewDataSource,UITableViewDelegate>



@end

@implementation RARecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.frame;
    
    [self.view addSubview:tableView];
    //add UITable view as property
    
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:recipeID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
    return [RARecipes count];
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:recipeID];
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //when we pop back to this table view, nothing will be highlighted, the selection will be deselected
}


@end
