package letter;

public class Letter {
	private int letterId;
	private String senderId;
	private String recvId;
	private String content;
	private String dateSent;
	private String dateRead;
	private int checkRead;
	private int recvDel;
	private int senderDel;
	
	public int getLetterId() {
		return letterId;
	}
	public void setLetterId(int letterId) {
		this.letterId = letterId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getRecvId() {
		return recvId;
	}

	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDateSent() {
		return dateSent;
	}

	public void setDateSent(String dateSent) {
		this.dateSent = dateSent;
	}

	public String getDateRead() {
		return dateRead;
	}

	public void setDateRead(String dateRead) {
		this.dateRead = dateRead;
	}

	public int isCheckRead() {
		return checkRead;
	}

	public void setCheckRead(int checkRead) {
		this.checkRead = checkRead;
	}

	public int isRecvDel() {
		return recvDel;
	}

	public void setRecvDel(int recvDel) {
		this.recvDel = recvDel;
	}

	public int isSenderDel() {
		return senderDel;
	}

	public void setSenderDel(int senderDel) {
		this.senderDel = senderDel;
	}
	
}
