package demo.getting_started.input;

import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zul.*;

public class EditController extends SelectorComposer<Window> {

	private static final long serialVersionUID = 1L;
	@Wire
	Textbox input;
	@Wire
	Label output;
	
	@Listen("onClick=#ok")
	public void submit() {
		output.setValue(input.getValue());
	}
	@Listen("onClick=#cancel")
	public void cancel() {
		output.setValue("");
	}
	
}