import java.util.HashMap;

public class Inventory {

    HashMap<Integer, Product> products = new HashMap<>();

    public void addProduct(Product p) {
        products.put(p.productId, p);
        System.out.println("Product Added");
    }

    public void updateProduct(int id, int quantity) {
        if (products.containsKey(id)) {
            products.get(id).quantity = quantity;
            System.out.println("Product Updated");
        }
    }

    public void deleteProduct(int id) {
        products.remove(id);
        System.out.println("Product Deleted");
    }

    public void displayProducts() {
        for (Product p : products.values()) {
            p.display();
        }
    }
}