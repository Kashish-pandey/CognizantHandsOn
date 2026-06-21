public class Main {
    public static void main(String[] args) {

        Image image = new ProxyImage("photo.jpg");

        System.out.println("First time:");
        image.display();

        System.out.println();

        System.out.println("Second time:");
        image.display();
    }
}