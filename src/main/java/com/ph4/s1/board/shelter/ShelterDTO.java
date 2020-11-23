package com.ph4.s1.board.shelter;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ph4.s1.board.file.ShelterFileDTO;

@Component
public class ShelterDTO {
	
	private long num;
	private Date regDate;
	private long hit;
	private String animal;
	private String animal_kind;
	private String sex;
	private String neuter;
	private String color;
	private String birth;
	private String kg;
	private Date period_1;
	private Date period_2;
	private String place_of_find;
	private String special;
	private String center;
	private String center_tel;
	private ShelterFileDTO shelterFileDTO;
	
	List<ShelterFileDTO> shelterFileDTOs;
	
	
	
	
	
	public ShelterFileDTO getShelterFileDTO() {
		return shelterFileDTO;
	}
	public void setShelterFileDTO(ShelterFileDTO shelterFileDTO) {
		this.shelterFileDTO = shelterFileDTO;
	}
	public List<ShelterFileDTO> getShelterFileDTOs() {
		return shelterFileDTOs;
	}
	public void setShelterFileDTOs(List<ShelterFileDTO> shelterFileDTOs) {
		this.shelterFileDTOs = shelterFileDTOs;
	}
	
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getAnimal_kind() {
		return animal_kind;
	}
	public void setAnimal_kind(String animal_kind) {
		this.animal_kind = animal_kind;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNeuter() {
		return neuter;
	}
	public void setNeuter(String neuter) {
		this.neuter = neuter;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getKg() {
		return kg;
	}
	public void setKg(String kg) {
		this.kg = kg;
	}
	public Date getPeriod_1() {
		return period_1;
	}
	public void setPeriod_1(Date period_1) {
		this.period_1 = period_1;
	}
	public Date getPeriod_2() {
		return period_2;
	}
	public void setPeriod_2(Date period_2) {
		this.period_2 = period_2;
	}
	public String getPlace_of_find() {
		return place_of_find;
	}
	public void setPlace_of_find(String place_of_find) {
		this.place_of_find = place_of_find;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	public String getCenter_tel() {
		return center_tel;
	}
	public void setCenter_tel(String center_tel) {
		this.center_tel = center_tel;
	}
	
	
	
	
	

}
