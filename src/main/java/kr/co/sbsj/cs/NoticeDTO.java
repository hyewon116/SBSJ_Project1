package kr.co.sbsj.cs;

public class NoticeDTO {
	private String notice_id;
	private String member_id;
	private String notice_title;
	private String notice_content;
	private String notice_write_date;
	private String notice_view_cnt;
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_write_date() {
		return notice_write_date;
	}
	public void setNotice_write_date(String notice_write_date) {
		this.notice_write_date = notice_write_date;
	}
	public String getNotice_view_cnt() {
		return notice_view_cnt;
	}
	public void setNotice_view_cnt(String notice_view_cnt) {
		this.notice_view_cnt = notice_view_cnt;
	}
	
}
