package com.task;

public class TaskLinkedList {

    private Task head;

    // Add Task
    public void addTask(Task task) {

        if (head == null) {

            head = task;
            return;
        }

        Task current = head;

        while (current.next != null) {

            current = current.next;
        }

        current.next = task;
    }

    // Search Task
    public Task searchTask(int taskId) {

        Task current = head;

        while (current != null) {

            if (current.getTaskId() == taskId) {

                return current;
            }

            current = current.next;
        }

        return null;
    }

    // Traverse Tasks
    public void traverseTasks() {

        Task current = head;

        System.out.println("\nTask List:");

        while (current != null) {

            System.out.println(current);

            current = current.next;
        }
    }

    // Delete Task
    public void deleteTask(int taskId) {

        if (head == null) {

            return;
        }

        if (head.getTaskId() == taskId) {

            head = head.next;

            System.out.println("Task Deleted Successfully");
            return;
        }

        Task current = head;

        while (current.next != null &&
               current.next.getTaskId() != taskId) {

            current = current.next;
        }

        if (current.next != null) {

            current.next = current.next.next;

            System.out.println("Task Deleted Successfully");
        }
        else {

            System.out.println("Task Not Found");
        }
    }
}