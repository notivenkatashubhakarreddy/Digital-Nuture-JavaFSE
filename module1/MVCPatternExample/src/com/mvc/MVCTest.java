package com.mvc;

public class MVCTest {

    public static void main(String[] args) {

        Student student =
                new Student(
                        "Shubhakar Reddy",
                        "CSD101",
                        "A"
                );

        StudentView view = new StudentView();

        StudentController controller =
                new StudentController(student, view);

        System.out.println("Initial Student Details:");
        controller.updateView();

        System.out.println("\nUpdating Student Grade...\n");

        controller.setStudentGrade("A+");

        controller.updateView();
    }
}