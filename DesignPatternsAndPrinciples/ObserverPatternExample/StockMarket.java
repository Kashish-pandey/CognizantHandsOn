import java.util.ArrayList;

public class StockMarket implements Stock {

    private ArrayList<Observer> observers = new ArrayList<>();
    private int stockPrice;

    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(stockPrice);
        }
    }

    public void setStockPrice(int price) {
        this.stockPrice = price;
        notifyObservers();
    }
}