package com.sample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sample.dao.StudentDAO;
import com.sample.main.entity.StudentEntity;
import com.sample.main.service.StudentServiceImpl;

@RestController
@RequestMapping(value="/rest")
public class StudentViewcontroller {
	
	com.sample.dao.StudentDAO sdao = new StudentDAO();

	//Get all Student using GET
	@GetMapping(value="/partstudent")
	public com.sample.model.Student getPartStudent(int i) {
		com.sample.model.Student stu =  sdao.getStudent(i);
		return stu;
	} 	 
	
	//Call from Angular
	@GetMapping(value="/angularcall")
	public void userInput() {
		System.out.println("hello");
		getStudentList();
	} 
	
/** List of all Student using GET **/
	@GetMapping(value="/studentlist")	
	public List<com.sample.model.Student> getStudentList() {
		return sdao.getStudentList();
	}
	
/** Adding Student using POST and mentioned RequestBody too */
	@PostMapping(value="/addstudent", consumes="application/json", produces="application/json")	
	public String addStudent(@RequestBody com.sample.model.Student stu) {
		sdao.studentList.add(stu);
		return "student added";
	}

/** retrieve data from H2 Database using hibernate */
	@Autowired
	StudentServiceImpl stuService;
	
	@GetMapping(value="/dbstudentlist")
	public ResponseEntity<List<StudentEntity>> getStudentListFromDB(){
		
		List<StudentEntity> list = stuService.getStuList();
		return new ResponseEntity<List<StudentEntity>>(list,new HttpHeaders(), HttpStatus.OK);
	}
	
	
	
}
