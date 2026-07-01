package com.sorting;

public class SortingTest {

    public static void main(String[] args) {

        Order[] orders = {

                new Order(101, "Ravi", 1500),
                new Order(102, "Kiran", 8000),
                new Order(103, "Sai", 2500),
                new Order(104, "Rahul", 5000)
        };

        System.out.println("Original Orders:");

        for (Order order : orders) {
            System.out.println(order);
        }

        BubbleSort.sort(orders);

        System.out.println("\nAfter Bubble Sort:");

        for (Order order : orders) {
            System.out.println(order);
        }

        QuickSort.sort(
                orders,
                0,
                orders.length - 1
        );

        System.out.println("\nAfter Quick Sort:");

        for (Order order : orders) {
            System.out.println(order);
        }
    }
}