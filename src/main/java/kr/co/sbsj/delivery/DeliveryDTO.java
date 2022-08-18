package kr.co.sbsj.delivery;

public class DeliveryDTO {

	private String delivery_id;
	private String addr_name;
	private String member_id;
	private String receiver;
	private String member_phone;
	private String post_code;
	private String delivery_addr1;
	private String delivery_addr2;

	@Override
	public String toString() {
		return delivery_id +" : "
				+ addr_name +" : "
				+ member_id +" : "
				+ receiver +" : "
				+ member_phone +" : "
				+ post_code +" : "
				+ delivery_addr1 +" : "
				+ delivery_addr2;
	}

	public String getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(String delivery_id) {
		this.delivery_id = delivery_id;
	}

	public String getAddr_name() {
		return addr_name;
	}

	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

}//class
