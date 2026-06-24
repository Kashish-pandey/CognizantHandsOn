public class Main {
    public static void main(String[] args) {

        Order[] orders = {
                new Order(1, "Aman", 3000),
                new Order(2, "Rahul", 1000),
                new Order(3, "Priya", 2000)
        };

        System.out.println("Bubble Sort:");

        Sort.bubbleSort(orders);

        for (Order o : orders) {
            o.display();
        }

        Order[] orders2 = {
                new Order(1, "Aman", 3000),
                new Order(2, "Rahul", 1000),
                new Order(3, "Priya", 2000)
        };

        System.out.println();

        System.out.println("Quick Sort:");

        Sort.quickSort(orders2, 0, orders2.length - 1);

        for (Order o : orders2) {
            o.display();
        }
    }
}