//
//  ViewController.m
//  BiLing
//
//  Created by BiLing on 2018/12/3.
//  Copyright © 2018 BiLing. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <sys/utsname.h>

//AutoLayout
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface ViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView * webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化UI
    [self initUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)initUI {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.bl-coin.cn/tpl/index.html"]];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    webView.navigationDelegate = self;
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    self.webView = webView;
    
    //layout
    [webView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    NSString * uuid = [[NSUUID UUID] UUIDString];
    NSString * deviceInfo = [NSString stringWithFormat:@"deviceInfo('%@')",uuid];
    
    [self.webView evaluateJavaScript:deviceInfo completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"ok");
    }];
}
@end
