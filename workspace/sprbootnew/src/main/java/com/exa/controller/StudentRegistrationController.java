package com.exa.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exa.bean.Student;
import com.exa.bean.StudentRegistration;
import com.exa.bean.StudentRegistrationReply;

public class StudentRegistrationController {

	@RequestMapping(method= RequestMethod.POST, value = "/register/student")
	
	@ResponseBody
	public StudentRegistrationReply registerStudent(@RequestBody Student stu) {
		StudentRegistrationReply stuRegReply = new StudentRegistrationReply();
		StudentRegistration.getInstance().add(stu); 
		stuRegReply.setAge(stu.getAge());
		stuRegReply.setName(stu.getName());
		stuRegReply.setRegNumber(stu.getRegNumber());
		stuRegReply.setRegStatus("Successful");
		return stuRegReply;
	}
}
