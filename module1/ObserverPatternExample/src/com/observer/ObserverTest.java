package com.observer;

public class ObserverTest {

    public static void main(String[] args) {

        StockMarket stockMarket = new StockMarket();

        Observer mobileUser =
                new MobileApp("Shubhakar");

        Observer webUser =
                new WebApp("Reddy");

        stockMarket.registerObserver(mobileUser);
        stockMarket.registerObserver(webUser);

        System.out.println("Stock Price Changed:");

        stockMarket.setStock("TCS", 3850.50);

        System.out.println("\nAnother Stock Update:");

        stockMarket.setStock("Infosys", 1725.75);
    }
}