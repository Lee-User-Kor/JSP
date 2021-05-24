package board;

public class ReplyDTO {
//	TABLE : REPLY
//	IDX       NOT NULL NUMBER        
//	BNUM      NOT NULL NUMBER        
//	WRITER    NOT NULL VARCHAR2(20)  
//	CONTENT   NOT NULL VARCHAR2(500) 
//	WRITEDATE NOT NULL VARCHAR2(50)
	
	private int idx, bnum;
	private String writer, content, writeDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	

}
