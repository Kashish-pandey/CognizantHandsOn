public class Main {
    public static void main(String[] args) {

        EmployeeManagement em = new EmployeeManagement();

        em.add(new Employee(1, "Aman", "Manager", 50000));
        em.add(new Employee(2, "Rahul", "Developer", 40000));

        em.displayAll();

        System.out.println();

        em.search(2);

        em.delete(1);

        System.out.println();

        em.displayAll();
    }
}