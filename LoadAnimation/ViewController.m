//
//  ViewController.m
//  LoadAnimation
//
//  Created by shenliping on 16/3/31.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ViewController.h"
#import "ListView.h"
#import "Circle.h"

#define WIDTH self.view.frame.size.width
#define HIGHT self.view.frame.size.height

@interface ViewController ()<UITextFieldDelegate>
{
    BOOL isappear;
}
@property (strong, nonatomic) UITextField *nameTextField;

@property (strong, nonatomic) UITextField *passwordTextField;

@property (strong, nonatomic) UIImageView *titleImageView;

@property (strong, nonatomic) UIButton *loadButton;

@property (strong, nonatomic) UIButton *listButton;

@property (strong, nonatomic) ListView *listView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isappear = NO;
    
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.titleImageView];
    [self.view addSubview:self.loadButton];
    [self.view addSubview:self.nameTextField];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITextField *)nameTextField{
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 260.0f, WIDTH - 40, 30)];
        _nameTextField.delegate = self;
        _nameTextField.tag = 0;
        _nameTextField.placeholder = @"loginname";
        _nameTextField.rightViewMode = UITextFieldViewModeAlways;
        _nameTextField.rightView = self.listButton;
//        _nameTextField.rightView
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _nameTextField;
}

- (UITextField *)passwordTextField{
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 300, WIDTH - 40, 30)];
        _passwordTextField.delegate = self;
        _passwordTextField.placeholder = @"passWord";
        _passwordTextField.tag = 1;
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UIImageView *)titleImageView{
    if (_titleImageView == nil) {
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 20, 200, 40, 40)];
        _titleImageView.image = [UIImage imageNamed:@"goods2.jpg"];
        
        _titleImageView.layer.masksToBounds = YES;
        [_titleImageView.layer setCornerRadius:20];
    }
    return _titleImageView;
}

- (UIButton *)loadButton{
    if (_loadButton == nil) {
        _loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loadButton.frame = CGRectMake(20, 360, WIDTH - 40, 50);
        [_loadButton setTitle:@"LOADING" forState:UIControlStateNormal];
        _loadButton.backgroundColor = [UIColor greenColor];
        [_loadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loadButton addTarget:self action:@selector(loadItems) forControlEvents:UIControlEventTouchUpInside];
        [_loadButton.layer masksToBounds];
        [_loadButton.layer setCornerRadius:25];
    }
    return _loadButton;
}

- (ListView *)listView{
    if (_listView == nil) {
        _listView = [[ListView alloc] initWithFrame:CGRectMake(20, 260, WIDTH - 40, 30)];
//        _listView.backgroundColor = [UIColor orangeColor];
        _listView.layer.borderWidth = 1;
        _listView.layer.borderColor = [UIColor blackColor].CGColor;
        
    }
    return _listView;
}

- (UIButton *)listButton{
    if (_listButton == nil) {
        _listButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _listButton.frame = CGRectMake(0, 0, 20, 20);
        [_listButton setImage:[UIImage imageNamed:@"iconfont-shangla.png"] forState:UIControlStateNormal];
        [_listButton addTarget:self action:@selector(listViewAppear) forControlEvents:UIControlEventTouchUpInside];
    }
    return _listButton;
}

- (void)loadItems{
//    CGFloat x = 40 / self.loadButton.frame.size.width;
    
    [UIView animateWithDuration:0.5 animations:^{
//        self.loadButton.transform = CGAffineTransformScale(self.loadButton.transform, x, 1);
        self.loadButton.frame = CGRectMake(WIDTH / 2 - 25, 360, 50, 50);
        [self.loadButton setTitle:@"" forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        Circle *circle = [[Circle alloc] initWithFrame:CGRectMake(2, 2, 40, 40)];
        [self.loadButton addSubview:circle];
        [circle set_path];
        [circle start];
    }];
}

- (void)listViewAppear{

    
    
    [UIView animateWithDuration:0.2 animations:^{
        if (isappear) {
            [self.listView removeFromSuperview];
            self.listView = nil;
            isappear = NO;
        }
        else{
            [self.view insertSubview:self.listView belowSubview:self.nameTextField];
            isappear = YES;
            self.listView.frame = CGRectMake(20, 290, WIDTH - 40, 100);
        }

        self.listButton.transform = CGAffineTransformRotate(self.listButton.transform, M_PI);
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag == 0) {
        [textField endEditing:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
