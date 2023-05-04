package pcd.lab04.monitors.barrier;

import javax.management.monitor.Monitor;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/*
 * Used by n threads to synchronize their execution
 * We have only one method: hitAndWaitAll()
 *
 */
public class FakeBarrier implements Barrier {

	private int counter = 0;

	private final Lock mutex;
	private final Condition cond;

	private int nTotal = 10;
	
	public FakeBarrier(int max) {
		this.nTotal = max;
		mutex = new ReentrantLock();
		cond = mutex.newCondition();
	}
	
	@Override
	public void hitAndWaitAll() throws InterruptedException {
		try {
			mutex.lock();
			counter++;
			if (counter == nTotal) {
				cond.signalAll();
			} else {
				cond.await();
			}
		} finally {
			mutex.unlock();
		}

	}


}
