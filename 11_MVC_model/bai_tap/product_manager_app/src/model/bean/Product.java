package model.bean;

public class Product {
    private int id;
    private String name;
    private String productionDate;
    private String expiryDate;

    public Product() {
    }

    public Product(int id, String name, String productionDate, String expiryDate) {
        this.id = id;
        this.name = name;
        this.productionDate = productionDate;
        this.expiryDate = expiryDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(String productionDate) {
        this.productionDate = productionDate;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
}
