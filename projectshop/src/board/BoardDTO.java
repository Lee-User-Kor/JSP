package board;

public class BoardDTO {
	private int idx;
	private int viewCount;
	private String title, writer, content, writeDate, uploadFile, deleted, secretNum, secretCheck;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getSecretNum() {
		return secretNum;
	}
	public void setSecretNum(String secretNum) {
		this.secretNum = secretNum;
	}
	public String getSecretCheck() {
		return secretCheck;
	}
	public void setSecretCheck(String secretCheck) {
		this.secretCheck = secretCheck;
	}
}
