package com.itheima.service;

import com.itheima.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll(int page,int size) throws Exception;

    void save(Product product) throws Exception;

    Product findById(int id) throws Exception;

    void updateProduct(Product product);

    void delete(int id);

}
