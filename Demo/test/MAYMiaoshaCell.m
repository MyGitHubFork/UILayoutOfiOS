//
//  MAYMiaoshaCell.m
//  test
//
//  Created by yifan on 15/8/18.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

#import "MAYMiaoshaCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MAYMiaoshaCell ()
@property(nonatomic,strong)UIImageView *pictureView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *priceLable;
@property(nonatomic,strong)UILabel *leaveLable;
@property(nonatomic,strong)UIButton *miaoshaButton;
@property(nonatomic,strong)UIView *lineView;

@property(nonatomic,strong)UIImageView *miaoshaimage;
@property(nonatomic,assign)NSInteger totalMargin;

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)long lTime;
@property(nonatomic,strong)UILabel *timeLable;
@end

@implementation MAYMiaoshaCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
        [self settingViewLayout];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

-(void)createView{
    self.pictureView = [[UIImageView alloc]init];
    CALayer *layer = [self.pictureView layer];
    layer.borderColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1].CGColor;
    layer.borderWidth = 1.0f;
    [self.contentView addSubview:self.pictureView];
    
    self.titleLable = [[UILabel alloc]init];
    self.titleLable.numberOfLines = 0;
    self.titleLable.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLable];
    
    self.miaoshaimage = [[UIImageView alloc]init];
    self.miaoshaimage.image = [UIImage imageNamed:@"btn-flashsales-2"];
    [self.contentView addSubview:self.miaoshaimage];
    
    self.priceLable = [[UILabel alloc]init];
    self.priceLable.numberOfLines = 0;
    self.priceLable.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.priceLable];
    
    self.leaveLable = [[UILabel alloc]init];
    self.leaveLable.numberOfLines = 0;
    self.leaveLable.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.leaveLable];
    
    self.miaoshaButton = [[UIButton alloc]init];
    [self.contentView addSubview:self.miaoshaButton];
    
    self.timeLable = [[UILabel alloc]init];
    [self.miaoshaButton addSubview:self.timeLable];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.lineView];

}
-(void)settingViewLayout{
    
    //self.totalMargin = 0;
    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15);
        make.top.mas_equalTo(self.contentView).offset(15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(86);
    }];
    
    [self.miaoshaimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(125);
        make.top.mas_equalTo(self.contentView).offset(15);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(125);
        make.top.mas_equalTo(self.contentView).offset(15);
        make.right.mas_equalTo(self.contentView).offset(-22);
        self.totalMargin += 15;
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(125);
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(14);
        make.right.mas_equalTo(self.contentView).offset(-22);
        self.totalMargin += 14;
    }];
    [self.leaveLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(125);
        make.top.mas_equalTo(self.priceLable.mas_bottom).offset(14);
        make.right.mas_equalTo(self.contentView).offset(-22);
        self.totalMargin += 14;
    }];
    [self.miaoshaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(125);
        make.top.mas_equalTo(self.leaveLable.mas_bottom).offset(12);
        make.width.mas_equalTo(145);
        make.height.mas_equalTo(30);
        self.totalMargin += 12;
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.miaoshaButton.mas_bottom).offset(20);
        make.width.mas_equalTo(320);
        make.height.mas_equalTo(0.5);
        self.totalMargin += 20;
        make.bottom.offset(0);////这句话无比重要,标示每个cell的间隔
    }];

}

-(void)setEntity:(MAYMiaoshaEntity *)entity{
    _entity = entity;
    NSString *urlstring = [entity.ImgUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:urlstring] placeholderImage:[UIImage imageNamed:@"xx.png"]];
    NSString *titleString = [NSString stringWithFormat:@"               %@",entity.ProductName];
    self.titleLable.text = titleString;
    
    NSString *lastString = [NSString stringWithFormat:@"秒杀价:%ld￥/%@",(long)[entity.SecKillPrice integerValue],entity.Size];
    NSString *subString = [NSString stringWithFormat:@"%ld￥",(long)[entity.SecKillPrice integerValue]];
    NSMutableAttributedString *AttlastString = [[NSMutableAttributedString alloc]initWithString:lastString];
    [AttlastString setAttributes:[self getAttribute] range:NSMakeRange(4,subString.length)];
    
    self.priceLable.attributedText =AttlastString;

    self.leaveLable.text = [NSString stringWithFormat:@"剩余:%ld件",(long)[entity.LimitBuyCount integerValue]];
    
    
    [self.miaoshaButton setImage:[UIImage imageNamed:@"btn-flashsales-countdown"] forState:UIControlStateNormal];        //self.miaoshaButton.backgroundColor = [UIColor redColor];
    if ([entity.RemainStartTotalSeconds longLongValue] > 0) {//未开始btn-flashsales-countdown
        [self.miaoshaButton setImage:[UIImage imageNamed:@"btn-flashsales-countdown"] forState:UIControlStateNormal];
        self.timeLable.hidden = NO;
    }else if ([entity.RemainEndTotalSeconds longLongValue] > 0){//活动中
        if (entity.LimitBuyCount > 0) {//可以抢购
            self.miaoshaButton.userInteractionEnabled = YES;
            [self.miaoshaButton setImage:[UIImage imageNamed:@"btn-flashsales"] forState:UIControlStateNormal];
        }else{//已抢完
            [self.miaoshaButton setImage:[UIImage imageNamed:@"btn-sold-out"] forState:UIControlStateNormal];
        }
    }else{//已结束
        [self.miaoshaButton setImage:[UIImage imageNamed:@"btn-ended"] forState:UIControlStateNormal];
    }
    
    
}

#pragma mark 点击立即抢购
-(void)clickMiaoShaButton:(UIButton *)sender{
    NSLog(@"点击立即抢购");
   // self.imageTapCallBack(@(self.tag));
}


//-(CGSize)sizeThatFits:(CGSize)size{
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLable sizeThatFits:size].height;
//    totalHeight += [self.priceLable sizeThatFits:size].height;
//    totalHeight += [self.leaveLable sizeThatFits:size].height;
//    totalHeight += [self.miaoshaButton sizeThatFits:size].height;
//    totalHeight += [self.lineView sizeThatFits:size].height;
//    //totalHeight += self.totalMargin + 20; // margins
//    totalHeight += 75;
//    return CGSizeMake(size.width, totalHeight);
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSDictionary *)getAttribute
{
    NSDictionary *thedic =@{
                            NSFontAttributeName:[UIFont boldSystemFontOfSize:13],
                            NSForegroundColorAttributeName:UIColorFromRGB(0xb90a0a),
                            NSBackgroundColorAttributeName:[UIColor clearColor]
                            };
    return thedic;
}

@end
