//
//  YDJokeTableViewCell.m
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDJokeTableViewCell.h"


@interface YDJokeTableViewCell()



@end

@implementation YDJokeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.jokeLabel];
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

#pragma mark -- get 函数
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 100, 100)];
    }
    return _iconImageView;
}
- (UILabel *)jokeLabel {
    if (!_jokeLabel) {
        _jokeLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 15, YDScreenWidth - 145, 150)];
        _jokeLabel.backgroundColor = [UIColor clearColor];
        _jokeLabel.textColor = YDColorHex(0x666666);
        _jokeLabel.font = [UIFont systemFontOfSize:15];
        _jokeLabel.numberOfLines = 0;
    }
    return _jokeLabel;
}

@end
