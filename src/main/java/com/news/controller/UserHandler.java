package com.news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.news.entity.Manager;
import com.news.entity.User;
import com.news.service.ManagerService;
import com.news.service.UserService;


@Controller
public class UserHandler {
	@Autowired
	UserService userService;
	@Autowired
	ManagerService managerService;
	User loginUser;
	Manager loginManager;

	@RequestMapping("register")
	// �û�ע��
	public String register(HttpServletRequest req)
			throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		String url = "";
		System.out.println("=================");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String phone_number = req.getParameter("phone_number").substring(0, 10);
		String email = req.getParameter("email");
		User existUser = userService.findUserByName(username);
		if (null != existUser) {
			req.getSession().setAttribute("mesg1", "用户已存在!");
			return "redirect:register.jsp";
		}
		User u = new User();
		u.setUname(username);
		u.setPwd(password);
		System.out.println("==============" + phone_number);
		u.setTel(Integer.parseInt(phone_number));
		u.setEmail(email);
		int i = userService.addUser(u);
		String code = req.getParameter("code");
		if (code.length() != 4) {
			req.getSession().setAttribute("mesg1", "用户已存在!");
			url = "redirect:register.jsp";
		} else {
			if (i > 0) {
				url = "redirect:login.jsp";
			} else
				url = "redirect:register.jsp";
		}
		return url;

	}

	@RequestMapping("login")
	// �û���¼
	public String login(HttpServletRequest req, HttpServletResponse response)
			throws IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("=========");
		String url = "";
		String u_name = req.getParameter("username");
		String pwd = req.getParameter("password");
		User u = new User();
		u.setUname(u_name);
		u.setPwd(pwd);
		System.out.println(u.toString());
		loginUser = userService.findUser(u);
		if (loginUser == null) {
			req.getSession().setAttribute("mesg", "用户名或密码错误!");
			url = "redirect:login.jsp";
		} else {
			req.getSession().setAttribute("loginUser", loginUser);
			url = "index.jsp";
		}
		return url;
	}

	@RequestMapping("Managerlogin")
	// ����Ա��¼
	public String Managerlogin(HttpServletRequest req,
			HttpServletResponse response) throws IOException {
		req.setCharacterEncoding("utf-8");
		String url = "";
		String name = req.getParameter("username");
		String pwd = req.getParameter("password");
		Manager m = new Manager();
		m.setMname(name);
		m.setPwd(pwd);
		loginManager = managerService.findManager(m);

		if (loginManager == null) {
			 //req.getSession().setAttribute("mesg", "用户名!");
			url = "redirect:houtai/admin_login.jsp?mesg=Name or Password Error!";
		} else {
			req.getSession().setAttribute("loginManager", loginManager);
			url = "redirect:houtai/index.jsp";
		}
		return url;
	}

	@RequestMapping("loginout")
	// ע��
	public String loginout(HttpServletRequest req, HttpServletResponse response)
			throws IOException {
		req.getSession().invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping("toHoutai")
	// ת����̨
	public String toHoutai(HttpServletRequest req) throws IOException {
		req.getSession().invalidate();
		return "redirect:houtai/admin_login.jsp";
	}

	@RequestMapping("modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User luser = (User) session.getAttribute("loginUser");
		Integer uid = luser.getUid();
		if (uid != null) {
			User userById = userService.findUserById(uid);
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			String newPwd = request.getParameter("confirm_password");
			String phone = request.getParameter("phone_number");
			phone = phone.substring(0, 10);
			System.out.println("-------" + phone + "-----------");
			Integer tel = 0;
			tel = (Integer) Integer.parseInt(phone);
			String email = request.getParameter("email");
			userService.update(name, pwd, tel, email, uid);

			session.setAttribute("modifyUser", userById);

		} else {
			User nuser = (User) session.getAttribute("userByName");
			Integer uid2 = nuser.getUid();
			User userById2 = userService.findUserById(uid2);
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			String newPwd = request.getParameter("confirm_password");
			String phone = request.getParameter("phone_number");
			phone = phone.substring(0, 11);
			int tel = 0;
			if (phone != null & phone.equals("")) {
				tel = Integer.parseInt(phone);
			}
			String email = request.getParameter("email");
			userService.update(name, pwd, tel, email, uid2);
			session.setAttribute("modifyUser", userById2);
		}
		return "redirect:login.jsp";
	}

	@RequestMapping("findpwd")
	public String findpwd(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		String tel = request.getParameter("phone_number");
		String email = request.getParameter("email");
		User userByName = userService.findUserByName(name);
		userByName.getUid();
		Integer i = userByName.getTel();
		String s = i + "";
		String sqlTel = s + tel.substring(10, 11);
		String sqlEamil = userByName.getEmail();
		session.setAttribute("userByName", userByName);
		// Integer intSqlName = Integer.parseInt(sqlName);
		if (tel.equals(sqlTel) && email.equals(sqlEamil)) {
			return "redirect:modifyPwd.jsp";
		} else {
			return "redirect:findPwd.jsp?find=notFind!";
		}
	}

	@RequestMapping("modifyPwd")
	public String modifyPwd(HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("userByName");
		Integer uid = user.getUid();
		String password = request.getParameter("password");
		String rePasword = request.getParameter("confirm_password");
		if (password.equals(rePasword)) {
			userService.updatePwd(uid, password);
			return "redirect:login.jsp";
		}
		return "redirect:modifyPwd.jsp?mesg=RepeatPassword Error!";

	}

}
