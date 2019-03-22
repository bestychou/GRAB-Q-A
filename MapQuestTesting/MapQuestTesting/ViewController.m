//
//  ViewController.m
//  MapQuestTesting
//
//  Created by OurEDA on 19/3/22.
//  Copyright © 2019年 OurEDA. All rights reserved.
//

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController () <UITextFieldDelegate>

@property (retain,nonatomic) UITextField *userName;
@property (retain,nonatomic) UITextField *passWord;
@property (nonatomic, strong) UILabel *userLable;
@property (nonatomic, strong) UIImageView *userLine;
@property (nonatomic, strong) UIImageView *passwordLine;
@property (nonatomic, strong) UILabel *latLabel;
@property (nonatomic, strong) UILabel *lngLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:60.0/255.0 green:161.0/255.0 blue:253.0/255.0 alpha:1];
    self.navigationController.navigationBarHidden = YES;//隐藏导航栏
    
    WS(ws);
    //"用户端"
    _userLable = [[UILabel alloc] init];
    _userLable.backgroundColor = [UIColor clearColor];
    _userLable.textColor = [UIColor whiteColor];
    _userLable.text = @"MapQuestTesting";
    _userLable.font = [UIFont boldSystemFontOfSize:20.0f];
    [self.view addSubview:_userLable];
    
    [_userLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(50.0f);
        make.width.mas_equalTo(250.0f);
        make.height.mas_equalTo(50.0f);
        make.left.mas_equalTo(ws.view).with.offset(100.0f);
    }];
    
    //输入key
    _userName = [[UITextField alloc] init];
    //_userName.placeholder = [NSString stringWithFormat:@"请输入用户名"];
    [_userName setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"key=1cIeDWDU17Me8rwaGBtv3N3VglmwX3u8" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}]];
    //_userName.layer.cornerRadius=5.0;
    _userName.text = @"1cIeDWDU17Me8rwaGBtv3N3VglmwX3u8";
    _userName.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userName];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(200);
        make.left.mas_equalTo(ws.view).with.offset(20);
        make.right.mas_equalTo(ws.view).with.offset(-20);
        make.height.mas_equalTo(@50);
    }];
    
    _userLine = [[UIImageView alloc] init];
    _userLine.layer.borderWidth = 1.0f;
    _userLine.layer.borderColor = [[UIColor grayColor] CGColor];
    _userLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_userLine];
    
    [_userLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userName.mas_bottom).with.offset(1.0f);
        make.left.mas_equalTo(_userName);
        make.right.mas_equalTo(_userName);
        make.height.mas_equalTo(1.0f);
    }];
    
    
    //输入locations
    _passWord = [[UITextField alloc] init];
    //_passWord.placeholder = [NSString stringWithFormat:@"请输入密码"];
    //_passWord.layer.cornerRadius=5.0;
    [_passWord setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:@"请输入location" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}]];
    _passWord.backgroundColor = [UIColor clearColor];
    _passWord.secureTextEntry=YES;
    [self.view addSubview:_passWord];
    
    [_passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userName.mas_bottom).with.offset(30);
        make.left.mas_equalTo(_userName);
        make.right.mas_equalTo(_userName);
        make.height.mas_equalTo(_userName);
    }];
    
    _passwordLine = [[UIImageView alloc] init];
    _passwordLine.layer.borderWidth = 1.0f;
    _passwordLine.layer.borderColor = [[UIColor grayColor] CGColor];
    _passwordLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_passwordLine];
    
    [_passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWord.mas_bottom).with.offset(1.0f);
        make.left.mas_equalTo(_passWord);
        make.right.mas_equalTo(_passWord);
        make.height.mas_equalTo(1.0f);
    }];
    
    //测试button
    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logInButton.backgroundColor = [UIColor colorWithRed:16.0/255.0 green:198.0/255.0 blue:110.0/255.0 alpha:1];
    [logInButton setTitle:@"开始测试" forState:UIControlStateNormal];//真界面
    [logInButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [logInButton addTarget:self action:@selector(clickToTest) forControlEvents:UIControlEventTouchUpInside];
    logInButton.layer.cornerRadius=5.0;
    logInButton.titleLabel.font=[UIFont boldSystemFontOfSize:20.0f];
    [self.view addSubview:logInButton];
    
    [logInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWord.mas_bottom).with.offset(50);
        make.left.mas_equalTo(_passWord);
        make.right.mas_equalTo(_passWord);
        make.height.mas_equalTo(_passWord);
    }];
    
    //显示lat
    _latLabel = [[UILabel alloc] init];
    _latLabel.backgroundColor = [UIColor clearColor];
    _latLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    _latLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_latLabel];
    
    [_latLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logInButton.mas_bottom).with.offset(20.0f);
        make.right.mas_equalTo(logInButton);
        make.left.mas_equalTo(logInButton);
        make.width.mas_equalTo(logInButton);
    }];
    
    //显示lng
    _lngLabel = [[UILabel alloc] init];
    _lngLabel.backgroundColor = [UIColor clearColor];
    _lngLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    _lngLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_lngLabel];
    
    [_lngLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_latLabel.mas_bottom).with.offset(20.0f);
        make.right.mas_equalTo(_latLabel);
        make.left.mas_equalTo(_latLabel);
        make.width.mas_equalTo(_latLabel);
    }];

    
    //tap手势退回键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapScreen)];
    [self.view addGestureRecognizer:tap];
}

- (void)TapScreen {
    [_userName resignFirstResponder];
    [_passWord resignFirstResponder];
}

- (void)clickToTest {
    //GET请求
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.mapquestapi.com/geocoding/v1/address?key=1cIeDWDU17Me8rwaGBtv3N3VglmwX3u8&location=%@", _passWord.text]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod=@"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data,NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray *resultsDic = [responseDic objectForKey:@"results"];
        NSArray *locationsDic = [[resultsDic objectAtIndex:0] objectForKey:@"locations"];
        NSDictionary *latLngDic = [[locationsDic objectAtIndex:0] objectForKey:@"latLng"];
        NSLog(@"%@", latLngDic);
        //获取主线程以显示lat和lng
        dispatch_async(dispatch_get_main_queue(), ^{
            _latLabel.text = [NSString stringWithFormat:@"lat:%@", [latLngDic objectForKey:@"lat"]];
            _lngLabel.text = [NSString stringWithFormat:@"lng:%@", [latLngDic objectForKey:@"lng"]];
        });
    }];
    [sessionDataTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
