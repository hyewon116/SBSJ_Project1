package kr.co.sbsj.md;

import org.springframework.web.multipart.MultipartFile;

public class MdDTO {

   private String md_id;
   private String md_name;
   private String md_standard_stock;
   private String md_price;
   private String md_discount;
   private String sale_price;
   private String md_content;
   private MultipartFile md_thumbnail;
   private MultipartFile md_detail_image;
   private String md_thumbnail_name;
   private String md_thumbnail_path;
   private String md_detail_name;
   private String md_detail_path;
   private String md_oneline;
   private String md_category;
   private String md_abv;
   private String md_sales_rate;
   private String md_stock;
   private String md_sweet;
   private String md_sour;
   private String md_sparkling;
   private String md_use;
   private String md_ratingAvg;
   
   private String cart_id;
   private String buy_qty;
   private String total_price;

   
   private String md_onsale;
   
   
   private String member_id;
   private String member_nick;
   
   


   @Override
   public String toString() {
      return  md_id
      + " : " + md_name
      + " : " + sale_price
      + " : " + md_oneline
      + " : " + md_price
      + " : " + md_category
      + " : " + md_abv
      + " : " + md_content
      + " : " + md_standard_stock
      + " : " + md_sales_rate
      + " : " + md_stock
      + " : " + md_sweet
      + " : " + md_sour
      + " : " + md_sparkling
      + " : " + md_use
      + " : " + md_ratingAvg
      + " : " + md_discount
      + " : " + md_thumbnail
      + " : " + md_detail_image
      + " : " + md_thumbnail_name
      + " : " + md_thumbnail_path
      + " : " + md_detail_name
      + " : " + md_detail_path
      + " : " + buy_qty
      + " : " + total_price
      + " : " + md_onsale
      + " : " + member_id
      + " : " + member_nick
      + " : " + cart_id ;
   }
   


   public String getMember_id() {
      return member_id;
   }



   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }



   public String getmember_nick() {
      return member_nick;
   }



   public void setMember_nick(String member_nick) {
      this.member_nick = member_nick;
   }



   public String getMd_id() {
      return md_id;
   }


   public void setMd_id(String md_id) {
      this.md_id = md_id;
   }


   public String getMd_name() {
      return md_name;
   }


   public void setMd_name(String md_name) {
      this.md_name = md_name;
   }

   public String getMd_standard_stock() {
      return md_standard_stock;
   }


   public void setMd_standard_stock(String md_standard_stock) {
      this.md_standard_stock = md_standard_stock;
   }


   public String getMd_price() {
      return md_price;
   }


   public void setMd_price(String md_price) {
      this.md_price = md_price;
   }


   public String getMd_discount() {
      if(md_discount.contains(".")) {
         md_discount = md_discount.substring(0, md_discount.indexOf("."));
      }
      return md_discount;
   }


   public void setMd_discount(String md_discount) {
      this.md_discount = md_discount;
   }


   public String getSale_price() {
      if(sale_price.contains(".")) {
         sale_price = sale_price.substring(0, sale_price.indexOf("."));
      }
      return sale_price;
   }


   public void setSale_price(String sale_price) {
      this.sale_price = sale_price;
   }


   public String getMd_content() {
      return md_content;
   }


   public void setMd_content(String md_content) {
      this.md_content = md_content;
   }

   public MultipartFile getMd_thumbnail() {
      return md_thumbnail;
   }


   public void setMd_thumbnail(MultipartFile md_thumbnail) {
      this.md_thumbnail = md_thumbnail;
   }


   public MultipartFile getMd_detail_image() {
      return md_detail_image;
   }


   public void setMd_detail_image(MultipartFile md_detail_image) {
      this.md_detail_image = md_detail_image;
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


   public String getMd_detail_name() {
      return md_detail_name;
   }


   public void setMd_detail_name(String md_detail_name) {
      this.md_detail_name = md_detail_name;
   }


   public String getMd_detail_path() {
      return md_detail_path;
   }


   public void setMd_detail_path(String md_detail_path) {
      this.md_detail_path = md_detail_path;
   }


   public String getMd_oneline() {
      return md_oneline;
   }


   public void setMd_oneline(String md_oneline) {
      this.md_oneline = md_oneline;
   }


   public String getMd_category() {
      return md_category;
   }


   public void setMd_category(String md_category) {
      this.md_category = md_category;
   }


   public String getMd_abv() {
      return md_abv;
   }


   public void setMd_abv(String md_abv) {
      this.md_abv = md_abv;
   }


   public String getMd_sales_rate() {
      return md_sales_rate;
   }


   public void setMd_sales_rate(String md_sales_rate) {
      this.md_sales_rate = md_sales_rate;
   }


   public String getMd_stock() {
      return md_stock;
   }


   public void setMd_stock(String md_stock) {
      this.md_stock = md_stock;
   }


   public String getMd_sweet() {
      return md_sweet;
   }


   public void setMd_sweet(String md_sweet) {
      this.md_sweet = md_sweet;
   }


   public String getMd_sour() {
      return md_sour;
   }


   public void setMd_sour(String md_sour) {
      this.md_sour = md_sour;
   }


   public String getMd_sparkling() {
      return md_sparkling;
   }


   public void setMd_sparkling(String md_sparkling) {
      this.md_sparkling = md_sparkling;
   }


   public String getMd_use() {
      return md_use;
   }


   public void setMd_use(String md_use) {
      this.md_use = md_use;
   }


   public String getMd_ratingAvg() {
      return md_ratingAvg;
   }


   public void setMd_ratingAvg(String md_ratingAvg) {
      this.md_ratingAvg = md_ratingAvg;
   }




   public String getBuy_qty() {
      return buy_qty;
   }


   public void setBuy_qty(String buy_qty) {
      this.buy_qty = buy_qty;
   }


   public String getTotal_price() {
      return total_price;
   }


   public void setTotal_price(String total_price) {
      this.total_price = total_price;
   }



   public String getCart_id() {
      return cart_id;
   }



   public void setCart_id(String cart_id) {
      this.cart_id = cart_id;
   }



   public String getMd_onsale() {
      return md_onsale;
   }



   public void setMd_onsale(String md_onsale) {
      this.md_onsale = md_onsale;
   }



   public String getMember_nick() {
      return member_nick;
   }
   
   
   
   
}