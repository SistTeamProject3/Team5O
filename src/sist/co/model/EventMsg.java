package sist.co.model;

public class EventMsg {

	private String message;
	
	public EventMsg() {}

	public EventMsg(String message) {
		super();
		this.message = message;
	}

	@Override
	public String toString() {
		return "EventMsg [message=" + message + "]";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}