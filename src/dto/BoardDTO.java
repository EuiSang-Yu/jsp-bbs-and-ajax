package dto;

public class BoardDTO {

	private int board_no;    // wr_uid
	private String board_title;  // wr_subject
	private String board_content;  // wr_content
	private int board_viewCnt;   // wr_viewcnt
	private String board_regDate;   // wr_regdate
	private String champion_no;   // champion_no
	
	
	public BoardDTO() {
		super();
	}
	
	
	public BoardDTO(int board_no, String board_title, String board_content, int board_viewCnt, String board_regDate,
			String champion_no) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_viewCnt = board_viewCnt;
		this.board_regDate = board_regDate;
		this.champion_no = champion_no;
	}


	
	
	
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


	public String getBoard_regDate() {
		return board_regDate;
	}


	public void setBoard_regDate(String board_regDate) {
		this.board_regDate = board_regDate;
	}


	public String getChampion_no() {
		return champion_no;
	}


	public void setChampion_no(String champion_no) {
		this.champion_no = champion_no;
	}


	@Override
	public String toString() {
		return "BoardDTO [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_viewCnt=" + board_viewCnt + ", board_regDate=" + board_regDate + ", champion_no="
				+ champion_no + "]";
	}
	
	
	
	
	
}
