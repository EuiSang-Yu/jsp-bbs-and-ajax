package dto;

public class BoardDTO {
	private int board_no; 
	private String board_title; 
	private String board_content; 
	private int board_viewCnt; 
	private String board_regDate;

	// 기본생성자
	public BoardDTO() {
		super();
		System.out.println("WriteDTO() 객체 생성");
	}

	// 매개변수 받는 생성자
	public BoardDTO(int no, String title, String content, int viewCnt) {
		super();
		this.board_no = no;
		this.board_title = title;
		this.board_content = content;
		this.board_viewCnt = viewCnt;

		System.out.printf("WriteDTO(%d, %s, %s, %d) 객체 생성", no, title, content, viewCnt);
	}

	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_viewCnt() {
		return board_viewCnt;
	}

	public void setBoard_viewCnt(int board_viewCnt) {
		this.board_viewCnt = board_viewCnt;
	}

	public String getboard_regDate() {
		return board_regDate;
	}

	public void setboard_regDate(String board_regDate) {
		this.board_regDate = board_regDate;
	}
	
	

	// 개발할때 Class 의 toString() 오버라이딩 해주면
	// 디버깅이나 테스트 하기 좋다.
//	@Override
//	public String toString() {
//		return String.format("WriteDTO] %d : %s : %s : %s : %d : %s", 
//				board_no, board_title, board_content, board_viewCnt, board_regDate);
//	}

}
