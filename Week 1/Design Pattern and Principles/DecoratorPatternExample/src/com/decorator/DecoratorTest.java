package com.decorator;

public class DecoratorTest {

    public static void main(String[] args) {

        Notifier notifier = new EmailNotifier();

        System.out.println("Email Notification:");
        notifier.send("System Update Available");

        System.out.println("\nEmail + SMS Notification:");
        Notifier smsNotifier =
                new SMSNotifierDecorator(new EmailNotifier());
        smsNotifier.send("System Update Available");

        System.out.println("\nEmail + SMS + Slack Notification:");
        Notifier multiChannelNotifier =
                new SlackNotifierDecorator(
                        new SMSNotifierDecorator(
                                new EmailNotifier()));

        multiChannelNotifier.send("System Update Available");
    }
}