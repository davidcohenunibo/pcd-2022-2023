package pcd.lab04.monitors.barrier;

/*
 * Used by n threads to synchronize their execution
 * We have only one method: hitAndWaitAll()
 *
 */
public interface Barrier {

	/**
	 * The thread that calls this method is blocked until all the other threads
	 * I want that all thread call this method before continue
	 * and  synchronize the execution of all thread before continue
	 */
	void hitAndWaitAll() throws InterruptedException;
}
