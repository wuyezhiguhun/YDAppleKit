//
//  YDJokeTableViewCell.m
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDJokeTableViewCell.h"
#import <Masonry/Masonry.h>


@implementation YDJokeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.jokeLabel];
        [self setAllViewsLayout];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -- UI 设置
- (void)setAllViewsLayout {
    [self.jokeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
//        make.bottom.mas_equalTo(self.contentView).mas_offset(-15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(15);
    }];
}

#pragma mark -- get 函数
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 100, 100)];
    }
    return _iconImageView;
}
- (UILabel *)jokeLabel {
    if (!_jokeLabel) {
        _jokeLabel = [[UILabel alloc] init];
        _jokeLabel.backgroundColor = [UIColor clearColor];
        _jokeLabel.textColor = YDColorHex(0x666666);
        _jokeLabel.font = [UIFont systemFontOfSize:15];
        _jokeLabel.numberOfLines = 0;
    }
    return _jokeLabel;
}

@end
