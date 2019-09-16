package com.exa.controller;

import java.util.List;

import javax.xml.ws.RequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exa.bean.Student;
import com.exa.bean.StudentRegistration;

@Controller
public class StudentRetrieveController {
	
	@RequestMapping(method = RequestMethod.GET, value="/student/allstudent")
	
	@ResponseBody
	public List<Student> getAllStudent(){
		return StudentRegistration.getInstance().getStudentRecords();
	}
		
	}
	
	


