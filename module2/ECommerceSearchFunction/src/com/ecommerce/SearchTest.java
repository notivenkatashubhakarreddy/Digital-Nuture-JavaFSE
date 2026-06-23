package com.ecommerce;

public class SearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101,
                        "Laptop",
                        "Electronics"),

                new Product(102,
                        "Mouse",
                        "Electronics"),

                new Product(103,
                        "Keyboard",
                        "Electronics"),

                new Product(104,
                        "Monitor",
                        "Electronics"),

                new Product(105,
                        "Printer",
                        "Electronics")
        };

        System.out.println("Linear Search:");

        Product result1 =
                SearchEngine.linearSearch(
                        products,
                        103);

        System.out.println(result1);

        System.out.println("\nBinary Search:");

        Product result2 =
                SearchEngine.binarySearch(
                        products,
                        104);

        System.out.println(result2);
    }
}