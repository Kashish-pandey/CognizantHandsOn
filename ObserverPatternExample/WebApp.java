public class WebApp implements Observer {

    public void update(int price) {
        System.out.println("Web App: Stock price updated to " + price);
    }
}