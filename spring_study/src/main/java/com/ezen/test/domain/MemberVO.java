package com.ezen.test.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter
public class MemberVO {
/*
 * CREATE TABLE member(
id VARCHAR(100),
pw VARCHAR(256) NOT NULL,
name VARCHAR(100),
email VARCHAR(100),
home VARCHAR(100),
age INT,
reg_date DATETIME DEFAULT NOW(),
last_login DATETIME DEFAULT NOW(),
PRIMARY KEY(id));

 */
	private String id;
	private String pw;
	private String name;
	private String email;
	private String home;
	private int age;
	private String reg_date;
	private String last_login;
	
	
}
