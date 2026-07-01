package com.proxy;

public class ProxyTest {

    public static void main(String[] args) {

        Image image = new ProxyImage("profile_photo.jpg");

        System.out.println("First Request:");
        image.display();

        System.out.println("\nSecond Request:");
        image.display();
    }
}