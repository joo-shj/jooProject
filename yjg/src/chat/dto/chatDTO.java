package chat.dto;

public class chatDTO {
	private int chatID;
	private String chatName;
	private String chatContent;
	private String chatTime;
	
	
	public chatDTO() {
	}


	public chatDTO(int chatID, String chatName, String chatContent, String chatTime) {
		super();
		this.chatID = chatID;
		this.chatName = chatName;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}


	@Override
	public String toString() {
		return "chatDTO [chatID=" + chatID + ", chatName=" + chatName + ", chatContent=" + chatContent + ", chatTime="
				+ chatTime + "]";
	}


	public int getChatID() {
		return chatID;
	}


	public void setChatID(int chatID) {
		this.chatID = chatID;
	}


	public String getChatName() {
		return chatName;
	}


	public void setChatName(String chatName) {
		this.chatName = chatName;
	}


	public String getChatContent() {
		return chatContent;
	}


	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}


	public String getChatTime() {
		return chatTime;
	}


	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	
	
}
