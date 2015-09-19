//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by jacob cook on 9/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 15;

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView =[[UIScrollView alloc]
                               initWithFrame:self.view.bounds ];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    
                               
                               [self.view addSubview:scrollView];
    
    CGFloat topMargin = 20;
    
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *description = [[UILabel alloc]
                            initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription)];
    description.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    
    description.numberOfLines = 0;
    [scrollView addSubview:description];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
