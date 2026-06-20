package com.dependency;

public class CustomerRepositoryImpl implements CustomerRepository {

    @Override
    public String findCustomerById(int id) {

        return "Customer ID: " + id +
               ", Name: Shubhakar Reddy";
    }
}