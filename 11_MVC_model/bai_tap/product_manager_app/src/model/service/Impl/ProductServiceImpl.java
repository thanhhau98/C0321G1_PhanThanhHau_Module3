package model.service.Impl;

import model.bean.Product;
import model.service.ProductService;

import java.util.*;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Bed", "11/11/2011", "22/12/2100"));
        products.put(2, new Product(2, "Table", "11/11/2011", "22/12/2100"));
        products.put(3, new Product(3, "Chair", "11/11/2011", "22/12/2100"));
        products.put(4, new Product(4, "Door", "11/11/2011", "22/12/2100"));
        products.put(5, new Product(5, "Window", "11/11/2011", "22/12/2100"));
        products.put(6, new Product(6, "Glass", "11/11/2011", "22/12/2100"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        Set<Map.Entry<Integer, Product>> setHashMap = products.entrySet();
        List<Product> productsSearch = new ArrayList<>();
        for (Map.Entry<Integer,Product> i:setHashMap){
            if (i.getValue().getName().contains(name)){
                productsSearch.add(i.getValue());
            }
        }
        return productsSearch;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

}
