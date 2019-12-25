package login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.dto.Customer;
import login.service.face.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired LoginService loginService;
	@RequestMapping(value="/login/login",method=RequestMethod.GET)
	public void login() {}
	
	@RequestMapping(value="/login/login",method=RequestMethod.POST)
	public String loginProc(HttpSession session,Model model,Customer customer) {
		logger.info("로그인 진행");
		logger.info(customer.toString());
		if(!customer.equals(null)&& !customer.getCusid().equals(null)) {
			boolean ckLog = loginService.login(customer);
			model.addAttribute("logCk", ckLog);
			if(ckLog) {
				session.setAttribute("userid", customer.getCusid());
				session.setAttribute("logCk", ckLog);
			}
			logger.info(String.valueOf(ckLog));
			return "redirect:/main";
		}else {
			session.setAttribute("logCk", false);
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value="/login/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value="/login/join",method=RequestMethod.GET)
	public void join() { }

	@RequestMapping(value="/login/join",method=RequestMethod.POST)
	public void joinProc() {
		logger.info("회원가입 진행");
		
	}
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public void main(HttpSession session) { 
		if(session.getAttribute("logCk")==null||session.getAttribute("logCk")=="") {
			session.setAttribute("logCk", false);
		}else {
			session.setAttribute("logCk", true);
		}
		
	}
	
	
	
	
}
