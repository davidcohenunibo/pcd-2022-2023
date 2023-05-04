package pcd.lab04.gui3_mvc_deadlock;

/**
 * If executed now are more reactive. Is not responsive.
 */
public class TestGUI {
  static public void main(String[] args){
	  
	MyModel model = new MyModel();
	MyController controller = new MyController(model);
    MyView view = new MyView(controller);
    model.addObserver(view);    
    view.show();
    
//    new MyAgent(model).start();

  }
  
}
