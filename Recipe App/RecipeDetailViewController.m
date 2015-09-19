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
    
    CGFloat top = topMargin + heightForDescription + margin *2;
    
    UILabel *ingredientsTitle = [[UILabel alloc] initWithFrame: CGRectMake(margin, top, self.view.frame.size.width - 2 *margin, 20)];
    ingredientsTitle.text = @"ingredients";
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:17];
    // add title
    [scrollView addSubview:ingredientsTitle];
    
    top += 20+margin;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) /4, 20)];
        volume.font = [UIFont boldSystemFontOfSize:17];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        
        [scrollView addSubview:volume];
        // only adding the volumeLabel to the subView, not to self
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin) /4, top,(self.view.frame.size.width - 2 * margin) * 3 /4, 20)];
        type.numberOfLines = 0;
        type.font = [UIFont systemFontOfSize:15];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        
        [scrollView addSubview:type];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) heightForDescription: (NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;

}

-(CGFloat) heightForDirections: (NSString *)description {
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
}

@end
