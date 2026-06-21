public class Main {
    public static void main(String[] args) {

        PaymentContext payment1 =
                new PaymentContext(new CreditCardPayment());

        payment1.executePayment(1000);

        PaymentContext payment2 =
                new PaymentContext(new PayPalPayment());

        payment2.executePayment(2000);
    }
}