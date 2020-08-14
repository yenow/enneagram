package com.example.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria { // pageNum 과 amount 값을 같이 전달하는 용도,,, 

  private int pageNum;
  private int maxLine;
  private String category;
  private String type;
  private String keyword;
  private int start;
  private int end;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int maxLine) {
    this.pageNum = pageNum;
    this.maxLine = maxLine;
  }
  
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }
}
