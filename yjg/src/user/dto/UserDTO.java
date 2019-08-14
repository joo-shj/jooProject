package user.dto;

import java.sql.Date;

public class UserDTO {

	private String userid;
	private String passwd;
	private String name;
	private String gender;
	private String email;
	private String hp;
	private String zipcode;
	private String address1;
	private String address2;
	private String jgm_group;
	private Date join_date;

	
	public UserDTO() {
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getJgm_group() {
		return jgm_group;
	}


	public void setJgm_group(String jgm_group) {
		this.jgm_group = jgm_group;
	}


	public Date getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}


	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", gender=" + gender + ", email="
				+ email + ", hp=" + hp + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", jgm_group=" + jgm_group + ", join_date=" + join_date + "]";
	}


	public UserDTO(String userid, String passwd, String name, String gender, String email, String hp, String zipcode,
			String address1, String address2, String jgm_group, Date join_date) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.hp = hp;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.jgm_group = jgm_group;
		this.join_date = join_date;
	}


	
	
	
}
