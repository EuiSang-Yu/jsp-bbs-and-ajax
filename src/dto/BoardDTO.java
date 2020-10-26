package dto;

public class BoardDTO {

	private int test_uid;    // wr_uid
	private String test_title;  // wr_subject
	private String test_content;  // wr_content

	
	public BoardDTO() {
		super();
	}
	
	
	public BoardDTO(int test_uid, String test_title, String test_content) {
		super();
		this.test_uid = test_uid;
		this.test_title = test_title;
		this.test_content = test_content;
	}


	public int getTest_uid() {
		return test_uid;
	}


	public void setTest_uid(int test_uid) {
		this.test_uid = test_uid;
	}


	public String getTest_title() {
		return test_title;
	}


	public void setTest_title(String test_title) {
		this.test_title = test_title;
	}


	public String getTest_content() {
		return test_content;
	}


	public void setTest_content(String test_content) {
		this.test_content = test_content;
	}


	
	
	

	
	
	
	
	
}
