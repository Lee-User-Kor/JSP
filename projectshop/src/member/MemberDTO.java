package member;

public class MemberDTO {

//	IDX	NUMBER
//	ID	VARCHAR2(100 BYTE)
//	PW	VARCHAR2(100 BYTE)
//	NAME	VARCHAR2(200 BYTE)
//	POSTCODE	NUMBER
//	POST	VARCHAR2(500 BYTE)
//	TEL1	VARCHAR2(5 BYTE)
//	TEL2	VARCHAR2(5 BYTE)
//	TEL3	VARCHAR2(5 BYTE)
//	
//	
	private int idx, postcode;
	private String id, pw, name, post, tel1, tel2, tel3;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	} 
	
	
}
