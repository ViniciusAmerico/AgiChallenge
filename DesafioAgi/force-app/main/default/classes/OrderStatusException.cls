public class OrderStatusException extends Exception {

  public String title;
  public String message;
  public String code;

  public OrderStatusException(String title, String message) {
    this.title = title;
    this.message = message;
  }

  public OrderStatusException(String code, String title, String message) {
    this(title, message);
    this.code = code;
  }

  public OrderStatusException(String title, String message, Exception e) {
    this(null, title, message);
  }

  public OrderStatusException(String code, String title, String message, Exception e) {
    this(code, title, message);
  }

}