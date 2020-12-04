package com.news.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.entity.Review;
import com.news.entity.User;
import com.news.service.ReviewService;
import com.news.service.UserService;

@Controller

public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	ReviewService reviewService;

	@RequestMapping("showusers")
	public ModelAndView showUsers() {
		ModelAndView mv = new ModelAndView("houtai/show.jsp");
		List<User> users = userService.findAll();
		for (int i = 0; i < users.size(); i++) {
			System.out.println("=========" + users.get(i).getUname());
		}
		mv.addObject("data", users);
		System.out.println(users);
		return mv;
	}

	@RequestMapping("remove")
	public ModelAndView delete(Integer uid) {
		ModelAndView mv = new ModelAndView("error");
		Integer i = userService.removeUser(uid);
		if (i != 0) {
			return showUsers();
		} else {
			return mv;
		}

	}

	@RequestMapping("delUser")
	public String deleteUser(HttpServletRequest req) {
		Integer mid = Integer.parseInt(req.getParameter("id"));
		List<Review> ReviewList = reviewService.selectByuid(mid);
		if (ReviewList.isEmpty()) {
			int i = userService.removeUser(mid);
		}
		return "redirect:UserInfo";
	}

	// ��ҳ��ѯ�û�
	@RequestMapping("UserInfo")
	public String getUsers(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		// �ӵ�һ����ʼ ÿҳ��ѯ��������
		PageHelper.startPage(pn, 5);
		List<User> users = userService.findAll();
		// ���û���Ϣ����PageInfo������
		PageInfo page = new PageInfo(users, 5);
		model.addAttribute("pageInfo", page);
		return "houtai/show.jsp";
	}

	// ���غ�̨��ҳ
	@RequestMapping("index")
	public String index() {
		return "redirect:houtai/index.jsp";
	}
}
