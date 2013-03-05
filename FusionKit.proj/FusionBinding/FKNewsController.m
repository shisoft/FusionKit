//
//  FKNewsController.m
//  FusionKit
//
//  Created by Maxthon Chan on 13-3-6.
//
//

#import "FKNewsController.h"

@implementation FKNewsController

- (NSString *)title
{
    return self.news.title;
}

- (NSAttributedString *)content
{
    NSString *content = ([self.news.content length]) ? self.news.content : self.news.title;
    NSString *html = [NSString stringWithFormat:@"<html><head><meta charset=\"utf-8\" /><style>body{font-family:\"Lucida Grande\";size:20pt;}</style></head><body><div>%@</div></body></html>", content];
    return [[NSAttributedString alloc] initWithHTML:[html dataUsingEncoding:NSUTF8StringEncoding] documentAttributes:NULL];
}

- (NSString *)author
{
    return
    ([self.news.author.handle isEqualToString:self.news.author.displayName]) ? self.news.author.handle :
    ([self.news.author.handle length] == 0) ? self.news.author.displayName :
    ([self.news.author.displayName length] == 0) ? self.news.author.handle :
    [NSString stringWithFormat:@"%@ (%@)", self.news.author.displayName, self.news.author.handle];
}

- (NSString *)publishTime
{
    NSTimeInterval timeDifference = fabs([self.news.publishDate timeIntervalSinceNow]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:(timeDifference > 43200) ? NSDateFormatterLongStyle : NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    return
    (timeDifference < 60) ? [NSString stringWithFormat:NSLocalizedString(@"%.0lf seconds ago", @""), timeDifference] :
    (timeDifference < 3600) ? [NSString stringWithFormat:NSLocalizedString(@"%.1lf minutes ago", @""), timeDifference / 60] :
    (timeDifference < 10800) ? [NSString stringWithFormat:NSLocalizedString(@"%.1lf hours ago", @""), timeDifference / 3600] :
    [dateFormatter stringFromDate:self.news.publishDate];
}

- (NSString *)service
{
    return NSLocalizedStringFromTable(self.news.service, @"services", @"");
}

@end