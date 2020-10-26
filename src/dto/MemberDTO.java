package dto;

public class MemberDTO {
	
	int member_no;	//회원 고유 번호
	String member_id;	//회원 아이디
	String member_pw;	//회원 비밀번호
	String member_name;	//회원 이름
	String member_email;	//회원 이메일
	String member_phone; 	//회원 전화번호
	String member_photo;	//회원 프로필이미지
	
	public MemberDTO() {
		super();
	}
	
	// 매개변수 받는 생성자
	public MemberDTO(int uid, String id, String pw, String name, String email, String phone, String photo) {
		super();
		this.member_no = uid;
		this.member_id = id;
		this.member_pw = pw;
		this.member_name = name;
		this.member_email = email;
		this.member_phone = phone;
		this.member_photo = photo;
		
		System.out.printf("WriteDTO(%d, %s, %s, %s, %s, %s, %s) 객체 생성", 
				uid, id, pw, name, email, phone, photo);
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}

	
	
}
