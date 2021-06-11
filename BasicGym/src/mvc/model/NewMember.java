package mvc.model;

public class NewMember {
public NewMember() {
	// TODO Auto-generated constructor stub
}

private String m_id;
private String m_name;
private String m_pw;
private String p_number;
private String e_address1;
private String e_address2;

public NewMember(String m_id, String m_name, String m_pw, String p_number, String e_address1, String e_address2) {
	this.m_id = m_id;
	this.m_name = m_name;
	this.m_pw = m_pw;
	this.p_number = p_number;
	this.e_address1 = e_address1;
	this.e_address2 = e_address2;
}


public NewMember(String m_id, String m_pw) {
	this.m_id = m_id;
	this.m_pw = m_pw;
}




public String getM_id() {
	return m_id;
}

public void setM_id(String m_id) {
	this.m_id = m_id;
}


public String getM_name() {
	return m_name;
}

public void setM_name(String m_name) {
	this.m_name = m_name;
}

public String getM_pw() {
	return m_pw;
}

public void setM_pw(String m_pw) {
	this.m_pw = m_pw;
}

public String getP_number() {
	return p_number;
}

public void setP_number(String p_number) {
	this.p_number = p_number;
}

public String getE_address1() {
	return e_address1;
}

public void setE_address1(String e_address1) {
	this.e_address1 = e_address1;
}

public String getE_address2() {
	return e_address2;
}

public void setE_address2(String e_address2) {
	this.e_address2 = e_address2;
}




}
