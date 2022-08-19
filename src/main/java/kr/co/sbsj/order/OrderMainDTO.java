package kr.co.sbsj.order;

public class OrderMainDTO {

	private String order_id;
	private String member_id;
	private String delivery_id;
	private String order_md_cnt;
	private String order_amt;
	private String discount_amt;
	private String pay_amt;
	private String order_date;
	private String order_status;

	private String str_cart_id;
	private String [] arr_cart_id;

	private String buy_now_md_id;
	private String buy_now_qty;

	private String member_name;
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
	
	@Override
	public String toString() {
		return order_id
				+ " : " +member_id
				+ " : " +delivery_id
				+ " : " +order_md_cnt
				+ " : " +order_amt
				+ " : " +discount_amt
				+ " : " +pay_amt
				+ " : " +order_date
				+ " : " +order_status
				+ " : " + member_name 
				+ " : " + member_addr1
				+ " : " + member_addr2 
				+ " : " + member_addr3;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public String getMember_addr3() {
		return member_addr3;
	}

	public void setMember_addr3(String member_addr3) {
		this.member_addr3 = member_addr3;
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
	public String getStr_cart_id() {
		return str_cart_id;
	}
	public void setStr_cart_id(String str_cart_id) {
		this.str_cart_id = str_cart_id;
	}
	public String[] getArr_cart_id() {
		return arr_cart_id;
	}
	public void setArr_cart_id(String[] arr_cart_id) {
		this.arr_cart_id = arr_cart_id;
	}
	public String getBuy_now_md_id() {
		return buy_now_md_id;
	}
	public void setBuy_now_md_id(String buy_now_md_id) {
		this.buy_now_md_id = buy_now_md_id;
	}
	public String getBuy_now_qty() {
		return buy_now_qty;
	}
	public void setBuy_now_qty(String buy_now_qty) {
		this.buy_now_qty = buy_now_qty;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

}//class
