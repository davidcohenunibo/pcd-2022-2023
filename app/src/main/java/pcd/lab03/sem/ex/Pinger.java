package pcd.lab03.sem.ex;

import java.util.concurrent.Semaphore;

public class Pinger extends Thread {

	private final Semaphore pongDone;
	private final Semaphore pingDone;

	public Pinger(final Semaphore pingDone, final Semaphore pongDone) {
		this.pongDone = pongDone;
		this.pingDone = pingDone;
	}	
	
	public void run() {
		while (true) {
			try {
				pongDone.acquire();
				System.out.println("ping!");
				pingDone.release();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}