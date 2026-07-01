package com.strategy;

public class StrategyTest {

    public static void main(String[] args) {

        PaymentContext paymentContext = new PaymentContext();

        System.out.println("Credit Card Payment:");
        paymentContext.setPaymentStrategy(new CreditCardPayment());
        paymentContext.executePayment(5000);

        System.out.println();

        System.out.println("PayPal Payment:");
        paymentContext.setPaymentStrategy(new PayPalPayment());
        paymentContext.executePayment(3000);
    }
}