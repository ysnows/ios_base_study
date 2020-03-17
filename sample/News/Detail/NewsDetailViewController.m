//
//  DetailViewController.m
//  sample
//
//  Created by ysnows on 2020/2/10.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "YUIScreen.h"
#import "YMediator.h"

@interface NewsDetailViewController ()<WKNavigationDelegate,NewsDetailProtocal>

@property(nonatomic, strong) WKWebView *webview;
@property(nonatomic, strong) UIProgressView *progressView;

@property(nonatomic, copy) NSString *url;

@end

@implementation NewsDetailViewController


+(void)load{
    
    [YMediator registerProtocal:@protocol(NewsDetailProtocal) forClass:[self class]];

//    [YMediator registerForScheme:@"detail" withBlock:^(NSDictionary * _Nonnull params) {
//        NSString *url=[params objectForKey:@"url"];
//        NewsDetailViewController *detailViewController = [[self alloc]initWithUrl:url];
//
//        detailViewController.navigationItem.title=@"Hello World";
//        detailViewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"share" style:UIBarButtonItemStylePlain target:nil action:nil];
//
//        UINavigationController *navigationController= [params objectForKey:@"controller"];
//        [navigationController pushViewController:detailViewController animated:YES];
//    }];
}


- (instancetype)initWithUrl:(NSString *) url
{
    self = [super init];
    if (self) {
        self.url=url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webview=[[WKWebView alloc]initWithFrame:CGRectMake(0, STATUSBARHEIGHT+44, self.view.frame.size.width, self.view.frame.size.height-STATUSBARHEIGHT+44)];
        self.webview;
    })];
    
    [self.view addSubview:({
        self.progressView=[[UIProgressView alloc]initWithFrame:CGRectMake(0, STATUSBARHEIGHT+44, self.view.frame.size.width, 10)];
        self.progressView;
    })];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    self.webview.navigationDelegate=self;
    
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil) {
        self.progressView.progress=self.webview.estimatedProgress;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
    [self.progressView setHidden:NO];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [self.progressView setHidden:YES];
    NSLog(@"finished");
    
}
    
- (UIViewController *)detailViewControllerWithUrl:(NSString *)url{
    return [self initWithUrl:url];
}

@end
