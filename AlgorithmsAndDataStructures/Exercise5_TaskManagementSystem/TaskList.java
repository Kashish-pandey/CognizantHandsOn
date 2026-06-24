public class TaskList {

    Task head = null;

    public void add(Task t) {
        if (head == null) {
            head = t;
        } else {
            Task temp = head;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = t;
        }
    }

    public void display() {
        Task temp = head;
        while (temp != null) {
            System.out.println(temp.taskId + " " + temp.taskName + " " + temp.status);
            temp = temp.next;
        }
    }

    public void delete(int id) {
        if (head.taskId == id) {
            head = head.next;
            return;
        }

        Task temp = head;
        while (temp.next != null) {
            if (temp.next.taskId == id) {
                temp.next = temp.next.next;
                return;
            }
            temp = temp.next;
        }
    }
}