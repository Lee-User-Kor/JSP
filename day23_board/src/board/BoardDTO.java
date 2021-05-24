package board;

//table board 
//    idx         number          primary key,
//    title       varchar2(200)   not null,
//    writer      varchar2(200)   not null,
//    content     varchar2(2000)  not null,
//    writeDate   varchar2(20)    default to_char(sysdate, 'YYYY-MM-DD HH24:MI'),
//    ipaddr      varchar2(20)    not null,
//    viewCount   number          default 0,
//    uploadFile  varchar2(255)   default 'default.jpg',
//    deleted     char            default 'n' check (deleted in ('y','n')) 

public class BoardDTO {
	
	private int idx, viewCount;
	private String title, writer, content, writeDate, ipaddr, uploadFile, deleted;
	
	@Override
	public String toString() {
		return String.format("%s, %s, %s, %s, %s, %s, %s, %s, %s\n", 
				idx, title, writer, content, writeDate, ipaddr, viewCount, uploadFile, deleted);
	}
	
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
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
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
	
	

}
