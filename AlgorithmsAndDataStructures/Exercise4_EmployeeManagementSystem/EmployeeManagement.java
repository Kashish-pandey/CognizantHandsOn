public class EmployeeManagement {

    Employee[] employees = new Employee[10];
    int count = 0;

    public void add(Employee e) {
        employees[count++] = e;
    }

    public void search(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                employees[i].display();
            }
        }
    }

    public void displayAll() {
        for (int i = 0; i < count; i++) {
            employees[i].display();
        }
    }

    public void delete(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                for (int j = i; j < count - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                count--;
            }
        }
    }
}