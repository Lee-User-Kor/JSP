package day06;

public class Account {

	private String id, pw, name;
	private int age;
	
	public Account() {}
	public Account(String id, String pw, String name, int age) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Account) {
			Account target = (Account)obj;
			boolean flag1 = id.equals(target.id);
			boolean flag2 = pw.equals(target.pw);
			return flag1 && flag2;
		}
		return false;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
