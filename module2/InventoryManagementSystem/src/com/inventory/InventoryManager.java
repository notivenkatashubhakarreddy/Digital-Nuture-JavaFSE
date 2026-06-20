package com.inventory;

import java.util.HashMap;

public class InventoryManager {

    private HashMap<Integer, Product> inventory =
            new HashMap<>();

    public void addProduct(Product product) {

        inventory.put(
                product.getProductId(),
                product
        );

        System.out.println("Product Added.");
    }

    public void updateProduct(int productId,
                              int quantity,
                              double price) {

        Product product =
                inventory.get(productId);

        if (product != null) {

            product.setQuantity(quantity);
            product.setPrice(price);

            System.out.println("Product Updated.");
        } else {

            System.out.println("Product Not Found.");
        }
    }

    public void deleteProduct(int productId) {

        if (inventory.remove(productId) != null) {

            System.out.println("Product Deleted.");
        } else {

            System.out.println("Product Not Found.");
        }
    }

    public void displayProducts() {

        System.out.println("\nInventory:");

        for (Product product :
                inventory.values()) {

            System.out.println(product);
        }
    }
}
/*
Time Complexity Analysis

1. Add Product
   inventory.put()
   Time Complexity: O(1)

2. Update Product
   inventory.get()
   Time Complexity: O(1)

3. Delete Product
   inventory.remove()
   Time Complexity: O(1)

4. Display Products
   for(product : inventory.values())
   Time Complexity: O(n)

where n = number of products.

Optimization:
HashMap provides constant-time access using Product ID as key,
making add, update, and delete operations efficient.
*/