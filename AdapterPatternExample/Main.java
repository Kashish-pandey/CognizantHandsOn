public class Main {
    public static void main(String[] args) {

        PaymentProcessor paypalPayment =
                new PayPalAdapter(new PayPalGateway());

        PaymentProcessor stripePayment =
                new StripeAdapter(new StripeGateway());

        paypalPayment.processPayment(500);
        stripePayment.processPayment(1000);
    }
}