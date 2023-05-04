package pcd.lab04.monitors.barrier;

import java.util.Random;


/**
 * A worker waits a random time before hitting the barrier
 * and then waits for all the other workers to hit the barrier
 * before continuing its execution
 * The correct is that i see all thread before continue the execution
 */
public class Worker extends Thread {

	private Barrier barrier;
	
	public Worker(String name, Barrier barrier) {
		super(name);
		this.barrier = barrier;
	}
	
	public void run() {
		Random gen = new Random(System.nanoTime());
		try {
			waitFor(gen.nextInt(3000));
			log("before");
			barrier.hitAndWaitAll();
			log("after");
		} catch (InterruptedException ex) {
			log("Interrupted!");
		}
	}
	
	private void log(String msg) {
		synchronized(System.out) {
			System.out.println("[ "+getName()+" ] "+msg);
		}
	}
	
	private void waitFor(long ms) throws InterruptedException{
		Thread.sleep(ms);
	}
}
