public class TicketOffice implements Runnable {
    private int count = 100;
    private int no = 0;
    private boolean flag = false;

    @Override
    public void run() {
        while (true) {
            if (this.sale() == false) {
                break;
            }
        }
    }

    public boolean sale() {
        if (flag) {
            return false;
        }
        this.no++;
        this.count--;
        if(count <= 0) {
            flag = true;
        }
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + "抢到第" + no + "张票，" + "剩余" + count + "张票！");
        if (Thread.currentThread().getName() == "票贩子") {
            return false;
        }
        return true;
    }
}