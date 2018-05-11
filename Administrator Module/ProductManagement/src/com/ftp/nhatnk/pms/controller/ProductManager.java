package com.ftp.nhatnk.pms.controller;

import com.ftp.nhatnk.pms.entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Miah
 */
public class ProductManager {
    private List <Product> listOfProduct;
    private int listOfProducts;
    
    public ProductManager(){
        this.listOfProduct = new ArrayList<>();
    }
    
    public int addProduct(Product p){
        this.listOfProduct.add(p);
        return count();
    }
    
    public int count(){
        return this.listOfProduct.size();
    }
    
    public Product getProduct(int index){
        if(index < 0 || index >= count()){
            return null;
        }
        return this.listOfProduct.get(index);
    }
    
    public boolean removeProduct(int id){
        int index = 1;
        for(int i = 0, n = count(); i < n; i++){
            if(this.listOfProduct.get(i).getId() == id){
                index = i;
                break;
            }
        }
        if(index != -1){
            this.listOfProduct.remove(index);
            return true;
        }
        return false;
    }
}
