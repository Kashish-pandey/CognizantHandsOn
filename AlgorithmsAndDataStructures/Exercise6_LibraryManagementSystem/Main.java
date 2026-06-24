import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {

        Book[] books = {
                new Book(1, "Java", "James"),
                new Book(2, "Python", "Guido"),
                new Book(3, "C++", "Bjarne")
        };

        Book b1 = SearchBook.linearSearch(books, "Python");
        System.out.println("Linear Search Found: " + b1.title);

        Arrays.sort(books, Comparator.comparing(b -> b.title));

        Book b2 = SearchBook.binarySearch(books, "Java");
        System.out.println("Binary Search Found: " + b2.title);
    }
}
