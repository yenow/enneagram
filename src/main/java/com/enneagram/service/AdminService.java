package com.enneagram.service;

import java.util.List;

import org.springframework.ui.Model;

import com.enneagram.domain.Criteria;
import com.enneagram.vo.MemberVO;

public interface AdminService {

	public void memberManage(Criteria c, Model m);

	public void boardManage(Criteria c, Model m);

	public void replyManage(Criteria c, Model m);
}
