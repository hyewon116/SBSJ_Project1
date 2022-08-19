package kr.co.sbsj.admin;


public class AdminReviewDTO {

	private String review_id;
	private String md_id;
	private String member_id;
	private String order_detail_id;
	private String review_title;
	private String review_content;
	private String review_date;
	private String review_viewcnt;
	private String review_star;
	private String member_nick;
	private String review_enable;
	private String md_name;
	private String md_thumbnail_path;
	
	
	@Override
	public String toString() {
		
		return
				review_id + " : " + 
				md_id + " : " + 
				member_id + " : " + 
				order_detail_id + " : " + 
				review_title + " : " + 
				review_content + " : " + 
				review_date + " : " + 
				review_viewcnt + " : " + 
				review_star + " : " + 
				member_nick + " : " + 
				review_enable + " : "+
				md_name + " : "+
				md_thumbnail_path + " : ";
	}
	
	
	
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getMd_id() {
		return md_id;
	}
	public void setMd_id(String md_id) {
		this.md_id = md_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(String order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_viewcnt() {
		return review_viewcnt;
	}
	public void setReview_viewcnt(String review_viewcnt) {
		this.review_viewcnt = review_viewcnt;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getReview_enable() {
		return review_enable;
	}
	public void setReview_enable(String review_enable) {
		this.review_enable = review_enable;
	}



	public String getMd_name() {
		return md_name;
	}



	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}



	public String getMd_thumbnail_path() {
		return md_thumbnail_path;
	}



	public void setMd_thumbnail_path(String md_thumbnail_path) {
		this.md_thumbnail_path = md_thumbnail_path;
	}

	
	
	
	
}//class
