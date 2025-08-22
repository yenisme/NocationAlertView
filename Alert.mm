#import <UIKit/UIKit.h>

__attribute__((constructor))
static void showAlertAfterLaunch() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"Inbox thì cứ thêm vài từ "Mình sẽ trả phí" là được 😆"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        // Tiêu đề
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"Khổng Mạnh Yên👾"];
        [title addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor]
                       range:NSMakeRange(0, title.length)];
        [alert setValue:title forKey:@"attributedTitle"];

        // Nút Đóng
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Đóng"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
        [ok setValue:[UIColor redColor] forKey:@"titleTextColor"];
        [alert addAction:ok];

        // Nút Website
        UIAlertAction *openLink = [UIAlertAction actionWithTitle:@"Website"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:@"https://manhyen.github.io/bio/"];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }];
        [openLink setValue:[UIColor systemPinkColor] forKey:@"titleTextColor"];
        [alert addAction:openLink];

        // Hiển thị Alert
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert
                                                                                     animated:YES
                                                                                   completion:nil];
    });
}