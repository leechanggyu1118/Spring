package com.ezen.test.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * CREATE TABLE comment(
cno INT AUTO_INCREMENT,
bno INT NOT NULL,
writer VARCHAR(100) NOT NULL,
content VARCHAR(500),
reg_date DATETIME DEFAULT NOW(),
PRIMARY KEY(cno));
 */

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class CommentVO {
	private int cno;
	private int bno;
	private String writer;
	private String content;
	private String reg_date;
}
