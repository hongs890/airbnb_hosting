package com.airbnb.web.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HostingController {
	private static final Logger logger = LoggerFactory.getLogger(HostingController.class);
	@RequestMapping("/hosting/regist_1")
	public String hostingRegist1(){
		logger.info("HostingController :: {}.", "regist_1");
		return "public:hosting/hosting_regist_1.tiles";
	}
	@RequestMapping("/hosting/regist_2")
	public String hostingRegist2(){
		logger.info("HostingController :: {}.", "regist_2");
		return "public:hosting/hosting_regist_2.tiles";
	}
	@RequestMapping("/hosting/regist_3")
	public String hostingRegist3(){
		logger.info("HostingController :: {}.", "regist_3");
		return "public:hosting/hosting_regist_3.tiles";
	}
	@RequestMapping("/hosting/regist_4")
	public String hostingRegist4(){
		logger.info("HostingController :: {}.", "regist_4");
		return "public:hosting/hosting_regist_4.tiles";
	}
	@RequestMapping("/hosting/regist_5")
	public String hostingRegist5(){
		logger.info("HostingController :: {}.", "regist_5");
		return "public:hosting/hosting_regist_5.tiles";
	}
	@RequestMapping("/hosting/regist_6")
	public String hostingRegist6(){
		logger.info("HostingController :: {}.", "regist_6");
		return "public:hosting/hosting_regist_6.tiles";
	}
	@RequestMapping("/hosting/regist_7")
	public String hostingRegist7(){
		logger.info("HostingController :: {}.", "regist_7");
		return "public:hosting/hosting_regist_7.tiles";
	}
	@RequestMapping("/hosting/regist_8")
	public String hostingRegist8(){
		logger.info("HostingController :: {}.", "regist_8");
		return "public:hosting/hosting_regist_8.tiles";
	}
	@RequestMapping("/hosting/regist_9")
	public String hostingRegist9(){
		logger.info("HostingController :: {}.", "regist_9");
		return "public:hosting/hosting_regist_9.tiles";
	}
	@RequestMapping("/hosting/regist_10")
	public String hostingRegist10(){
		logger.info("HostingController :: {}.", "regist_10");
		return "public:hosting/hosting_regist_10.tiles";
	}
	@RequestMapping("/hosting/regist_11")
	public String hostingRegist11(){
		logger.info("HostingController :: {}.", "regist_11");
		return "public:hosting/hosting_regist_11.tiles";
	}
	@RequestMapping("/hosting/regist_12")
	public String hostingRegist12(){
		logger.info("HostingController :: {}.", "regist_12");
		return "public:hosting/hosting_regist_12.tiles";
	}
	@RequestMapping("/hosting/regist_13")
	public String hostingRegist13(){
		logger.info("HostingController :: {}.", "regist_13");
		return "public:hosting/hosting_regist_13.tiles";
	}
}
