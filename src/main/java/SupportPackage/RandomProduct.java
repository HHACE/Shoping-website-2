/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SupportPackage;

import Models.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author namti
 */
public class RandomProduct {
    public static List<Product> selectRandomProducts(List<Product> productList, int numProducts) {
        List<Product> randomProducts = new ArrayList<>();
        Random random = new Random();

        while (randomProducts.size() < numProducts && !productList.isEmpty()) {
            int randomIndex = random.nextInt(productList.size());
            randomProducts.add(productList.get(randomIndex));
            productList.remove(randomIndex);
        }

        return randomProducts;
    }
}
