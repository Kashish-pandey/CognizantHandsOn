public class CustomerRepositoryImpl implements CustomerRepository {

    public String findCustomerById(int id) {
        return "Customer Found with ID: " + id;
    }
}