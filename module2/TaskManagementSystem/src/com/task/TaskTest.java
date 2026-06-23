package com.task;

public class TaskTest {

    public static void main(String[] args) {

        TaskLinkedList taskList =
                new TaskLinkedList();

        taskList.addTask(
                new Task(
                        101,
                        "Design UI",
                        "Pending"));

        taskList.addTask(
                new Task(
                        102,
                        "Develop Backend",
                        "In Progress"));

        taskList.addTask(
                new Task(
                        103,
                        "Testing",
                        "Pending"));

        taskList.traverseTasks();

        System.out.println("\nSearching Task 102:");

        Task task =
                taskList.searchTask(102);

        System.out.println(task);

        taskList.deleteTask(102);

        taskList.traverseTasks();
    }
}