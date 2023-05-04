package pcd.lab04.monitors;

public class TestEx {

    public static void main(String[] args) {
        Object lock = new Object();
        try {
            //Ho cercato di chiamare la wait senza avere il lock
            //ritornando IllegalMonitorStateException
            //cambia se metto il synchronized prendendo il lock dell'oggetto e si blocca ma non mi da l'eccezione
            synchronized (lock) {
                lock.wait();
            }
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
