package com.ph4.s1.member;

public class MemberDTO {
   
   private String id;
   private String pw;
   private String name;
   private String email;
   private String phone;
   private long points;
   private String zipCode;
   private String address;
   private String detailAddress;
   private String extraAddress;
   
   
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public long getPoints() {
      return points;
   }
   public void setPoints(long points) {
      this.points = points;
   }
   public String getZipCode() {
      return zipCode;
   }
   public void setZipCode(String zipCode) {
      this.zipCode = zipCode;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getDetailAddress() {
      return detailAddress;
   }
   public void setDetailAddress(String detailAddress) {
      this.detailAddress = detailAddress;
   }
   public String getExtraAddress() {
      return extraAddress;
   }
   public void setExtraAddress(String extraAddress) {
      this.extraAddress = extraAddress;
   }
   
}