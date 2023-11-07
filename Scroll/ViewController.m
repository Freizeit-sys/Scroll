#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomAnchor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"--- viewDidLayoutSubviews ---");
    NSLog(@"scrollview height[%f]", self.scrollView.frame.size.height);
    NSLog(@"contentsize height %f", self.scrollView.contentSize.height);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"--- viewDidAppear ---");
    NSLog(@"view height [%f]", self.view.frame.size.height);
    NSLog(@"scrollview height [%f]", self.scrollView.frame.size.height);
    NSLog(@"contentsize height [%f]", self.scrollView.contentSize.height);
    NSLog(@"safearea top [%f]", self.view.safeAreaInsets.top);
    NSLog(@"safearea bottom [%f]", self.view.safeAreaInsets.bottom);
    
    // 画面の高さ - コンテンツサイズ - セーフエリアトップ
    CGFloat constant =
    self.view.frame.size.height -
    self.scrollView.contentSize.height -
    self.view.safeAreaInsets.top;
    
    self.bottomAnchor.constant = constant > 24 ? constant : 24;
    
    NSLog(@"constant %f", constant);
}

@end
