public class Main {
    public static void main(String[] args) {

        TaskList list = new TaskList();

        list.add(new Task(1, "Coding", "Pending"));
        list.add(new Task(2, "Testing", "Done"));

        list.display();

        System.out.println();

        list.delete(1);

        list.display();
    }
}