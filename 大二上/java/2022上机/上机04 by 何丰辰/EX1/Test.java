public class Test {
    public static void main(String args[]) {
        TicketOffice ticketOffice = new TicketOffice();
        Thread[] threads = {
                new Thread(ticketOffice, "张三"),
                new Thread(ticketOffice, "票贩子"),
                new Thread(ticketOffice, "李四"),
        };
        for (Thread t: threads) {
            t.start();
        }
    }
}
