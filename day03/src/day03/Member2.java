package day03;

// quiz1에 사용할 자바 빈즈 클래스

public class Member2 {
	// member field
	private String id, pw, name;
	
	// constructor overloading
	public Member2() {}
	public Member2(String id, String pw, String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	
	// method overriding (직접 작성하세요)
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member2) {				// 1) 자료형이 일치해야 한다
			Member2 target = (Member2)obj;
			boolean flag1 = id.equals(target.id);	// 2) id가 일치하는지
			boolean flag2 = pw.equals(target.pw);	// 3) pw가 일치하는지
			return flag1 &&  flag2;
		}
		return false;
	}
	
	// getters/setters
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
	
}
