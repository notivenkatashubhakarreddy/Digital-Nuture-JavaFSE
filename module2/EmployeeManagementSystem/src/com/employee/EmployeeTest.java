package com.employee;

public class EmployeeTest {

    public static void main(String[] args) {

        EmployeeManager manager =
                new EmployeeManager(10);

        manager.addEmployee(
                new Employee(
                        101,
                        "Shubhakar",
                        "Developer",
                        50000));

        manager.addEmployee(
                new Employee(
                        102,
                        "Ravi",
                        "Tester",
                        40000));

        manager.addEmployee(
                new Employee(
                        103,
                        "Sai",
                        "Manager",
                        80000));

        manager.traverseEmployees();

        System.out.println("\nSearching Employee 102:");

        Employee employee =
                manager.searchEmployee(102);

        System.out.println(employee);

        manager.deleteEmployee(102);

        manager.traverseEmployees();
    }
}