package com.forecasting;

public class ForecastTest {

    public static void main(String[] args) {

        double currentValue = 10000;

        double growthRate = 0.10;

        int years = 5;

        double futureValue =
                FinancialForecast.predictFutureValue(
                        currentValue,
                        growthRate,
                        years);

        System.out.println("Current Value : ₹"
        + currentValue);

System.out.printf("Current Value : Rs.%.2f%n", currentValue);

System.out.println("Growth Rate   : "
        + (growthRate * 100) + "%");

System.out.println("Years         : "
        + years);

System.out.printf("Future Value  : Rs.%.2f%n", futureValue);
    }
}