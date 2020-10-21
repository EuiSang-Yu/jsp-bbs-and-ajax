package dto;

public class UserDTO {
	
	int userUid;	//회원 고유 번호
	String userId;	//회원 아이디
	String userPw;	//회원 비밀번호
	String userName;	//회원 이름
	String userEmail;	//회원 이메일
	
	public UserDTO() {
		super();
	}
	
	// 매개변수 받는 생성자
	public UserDTO(int uid, String id, String pw, String name, String email) {
		super();
		this.userUid = uid;
		this.userId = id;
		this.userPw = pw;
		this.userName = name;
		this.userEmail = email;
		System.out.printf("WriteDTO(%d, %s, %s, %s, %s) 객체 생성", 
				uid, id, pw, name, email);
	}

	public int getUserUid() {
		return userUid;
	}

	public void setUserUid(int userUid) {
		this.userUid = userUid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
	
}
