//
//  ViewController.m
//  CALayerAnimationGradient
//
//  Created by Cantoraz Chou on 7/12/16.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView*  backgroundView;
@property (nonatomic, weak) IBOutlet UILabel* textLabel;

@property (nonatomic, strong) CAGradientLayer* gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Prepare gradientLayer
    _gradientLayer = [[CAGradientLayer alloc] init];
    _gradientLayer.bounds = _backgroundView.bounds;
    _gradientLayer.position = CGPointMake(_backgroundView.bounds.size.width/2,
                                         _backgroundView.bounds.size.height/2);
    _gradientLayer.startPoint = CGPointMake(0, .5);
    _gradientLayer.endPoint = CGPointMake(1, .5);
    _gradientLayer.colors = @[(__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor];
    _gradientLayer.locations = @[@.2, @.5, @.8];
    [_backgroundView.layer addSublayer:_gradientLayer];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}

- (void)viewDidAppear:(BOOL)animated
{
    _gradientLayer.mask = _textLabel.layer;
    [self __caz__gradientAnimate];
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)__caz__gradientAnimate
{
    CABasicAnimation* gradient = [CABasicAnimation animationWithKeyPath:@"locations"];
    gradient.fromValue = @[@0, @0, @.25];
    gradient.toValue = @[@.75, @1, @1];
    gradient.duration = 2.5;
    gradient.repeatCount = HUGE;
    [_gradientLayer addAnimation:gradient forKey:nil];
}

@end
