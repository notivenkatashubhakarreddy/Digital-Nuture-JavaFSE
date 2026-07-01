package com.singleton;

public class SingletonTest {

    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();

        Logger logger2 = Logger.getInstance();

        logger1.log("Application Started");
        logger2.log("User Logged In");

        System.out.println("\nLogger1 Address: " + logger1);
        System.out.println("Logger2 Address: " + logger2);

        if (logger1 == logger2) {
            System.out.println("\nOnly One Logger Instance Exists");
        } else {
            System.out.println("\nMultiple Instances Created");
        }
    }
}