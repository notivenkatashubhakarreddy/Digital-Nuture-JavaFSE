package com.library;

public class LibraryTest {

    public static void main(String[] args) {

        Book[] books = {

                new Book(
                        101,
                        "Algorithms",
                        "Thomas Cormen"),

                new Book(
                        102,
                        "Database Systems",
                        "Navathe"),

                new Book(
                        103,
                        "Java Programming",
                        "Herbert Schildt"),

                new Book(
                        104,
                        "Operating Systems",
                        "Galvin"),

                new Book(
                        105,
                        "Python Basics",
                        "Mark Lutz")
        };

        System.out.println("Linear Search:");

        Book result1 =
                LibrarySearch.linearSearch(
                        books,
                        "Java Programming");

        System.out.println(result1);

        System.out.println("\nBinary Search:");

        Book result2 =
                LibrarySearch.binarySearch(
                        books,
                        "Operating Systems");

        System.out.println(result2);
    }
}