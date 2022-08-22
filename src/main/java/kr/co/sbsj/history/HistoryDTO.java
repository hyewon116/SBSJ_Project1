package kr.co.sbsj.history;

public class HistoryDTO {

	private String order_id;
	private String member_id;
	private String member_nick;
	private String delivery_id;
	private String order_md_cnt;
	private String order_amt;
	private String discount_amt;
	private String pay_amt;
	private String order_date;
	private String order_status;
	private String order_status_name;

	private String order_detail_id;
	private String md_id;

	private String order_detail_qty;
	private String order_detail_price;
	private String order_detail_amt;
	private String order_detail_discount;
	private String order_detail_discount_amt;
	private String order_detail_pay_amt;

	private String md_name;
	private String md_thumbnail_name;
	private String md_thumbnail_path;


	private String receiver;
	private String member_phone;
	private String post_code;
	private String delivery_addr1;
	private String delivery_addr2;
	
	private String member_name;
	private String member_email;
	private String code_name;
	@Override
	public String toString() {
		return order_id
				+ " : " + member_id
				+ " : " + member_nick
				+ " : " + delivery_id
				+ " : " + order_md_cnt
				+ " : " + order_amt
				+ " : " + discount_amt
				+ " : " + pay_amt
				+ " : " + order_date
				+ " : " + order_status
				+ " : " + order_status_name

				+ " : " + order_detail_id
				+ " : " + md_id

				+ " : " + order_detail_qty
				+ " : " + order_detail_price
				+ " : " + order_detail_amt
				+ " : " + order_detail_discount
				+ " : " + order_detail_discount_amt
				+ " : " + order_detail_pay_amt

				+ " : " + md_name
				+ " : " + md_thumbnail_name
				+ " : " + md_thumbnail_path

				+ " : " + receiver
				+ " : " + post_code
				+ " : " + delivery_addr1
				+ " : " + delivery_addr2
				+ " : " + member_name
				+ " : " + member_email
				+ " : " + code_name;
	}
	
	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(String delivery_id) {
		this.delivery_id = delivery_id;
	}

	public String getOrder_md_cnt() {
		return order_md_cnt;
	}

	public void setOrder_md_cnt(String order_md_cnt) {
		this.order_md_cnt = order_md_cnt;
	}

	public String getOrder_amt() {
		return order_amt;
	}

	public void setOrder_amt(String order_amt) {
		this.order_amt = order_amt;
	}

	public String getDiscount_amt() {
		return discount_amt;
	}

	public void setDiscount_amt(String discount_amt) {
		this.discount_amt = discount_amt;
	}

	public String getPay_amt() {
		return pay_amt;
	}

	public void setPay_amt(String pay_amt) {
		this.pay_amt = pay_amt;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_status_name() {
		return order_status_name;
	}

	public void setOrder_status_name(String order_status_name) {
		this.order_status_name = order_status_name;
	}

	public String getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(String order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public String getMd_id() {
		return md_id;
	}

	public void setMd_id(String md_id) {
		this.md_id = md_id;
	}

	public String getOrder_detail_qty() {
		return order_detail_qty;
	}

	public void setOrder_detail_qty(String order_detail_qty) {
		this.order_detail_qty = order_detail_qty;
	}

	public String getOrder_detail_price() {
		return order_detail_price;
	}

	public void setOrder_detail_price(String order_detail_price) {
		this.order_detail_price = order_detail_price;
	}

	public String getOrder_detail_amt() {
		return order_detail_amt;
	}

	public void setOrder_detail_amt(String order_detail_amt) {
		this.order_detail_amt = order_detail_amt;
	}

	public String getOrder_detail_discount() {
		return order_detail_discount;
	}

	public void setOrder_detail_discount(String order_detail_discount) {
		this.order_detail_discount = order_detail_discount;
	}

	public String getOrder_detail_discount_amt() {
		return order_detail_discount_amt;
	}

	public void setOrder_detail_discount_amt(String order_detail_discount_amt) {
		this.order_detail_discount_amt = order_detail_discount_amt;
	}

	public String getOrder_detail_pay_amt() {
		return order_detail_pay_amt;
	}

	public void setOrder_detail_pay_amt(String order_detail_pay_amt) {
		this.order_detail_pay_amt = order_detail_pay_amt;
	}

	public String getMd_name() {
		return md_name;
	}

	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}

	public String getMd_thumbnail_name() {
		return md_thumbnail_name;
	}

	public void setMd_thumbnail_name(String md_thumbnail_name) {
		this.md_thumbnail_name = md_thumbnail_name;
	}

	public String getMd_thumbnail_path() {
		return md_thumbnail_path;
	}

	public void setMd_thumbnail_path(String md_thumbnail_path) {
		this.md_thumbnail_path = md_thumbnail_path;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getDelivery_addr1() {
		return delivery_addr1;
	}

	public void setDelivery_addr1(String delivery_addr1) {
		this.delivery_addr1 = delivery_addr1;
	}

	public String getDelivery_addr2() {
		return delivery_addr2;
	}

	public void setDelivery_addr2(String delivery_addr2) {
		this.delivery_addr2 = delivery_addr2;
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

	public String getCode_name() {
		return code_name;
	}

	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
	
}//class
