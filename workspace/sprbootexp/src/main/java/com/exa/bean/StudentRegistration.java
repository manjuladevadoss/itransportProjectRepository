package com.exa.bean;

import java.util.ArrayList;
import java.util.List;

public class StudentRegistration {
	
	public List<Student> studentList;
	private static StudentRegistration stuReg = null;
	
	private StudentRegistration() {
		studentList = new ArrayList<Student>();
	}
	
	public static StudentRegistration getInstance() {
		if(stuReg==null) {
			stuReg = new StudentRegistration();
			return stuReg;
		}
		else {
			return stuReg;
			}
	}
	
	//add student
	public void add(Student stu) {
		studentList.add(stu);
	}
	
	//view student
	public List<Student> getStudentRecords(){
		return studentList;
	}
	
	public String updateStudent(Student stu) {
		String str = null;
		
		for(int i=0;i<studentList.size();i++) {
			Student s = studentList.get(i);
			
			if(s.regNumber.equals(stu.regNumber)) {
				studentList.set(i,stu);
				return "record updated";
			}
			
		}
		
		return "record not found";
	}
	
	public String deleteStudent(Student stu) {
		
		for(int i=0;i<studentList.size();i++) {
			Student s = studentList.get(i);
			if(s.regNumber.equals(stu.regNumber)) {
				studentList.remove(i);
				return "record deleted";
			}
		}
		return "record not deleted";
	}

}
