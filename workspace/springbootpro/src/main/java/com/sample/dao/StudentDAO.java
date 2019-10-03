package com.sample.dao;

import java.util.ArrayList;
import java.util.List;

import com.sample.model.Student;

public class StudentDAO {
	public List<Student> studentList;
	
	public void addStudent(Student stu) {
		studentList.add(stu);
	}
	
	public Student getStudent(int k) {
		Student s = studentList.get(k);
		return s;
	}
		
	public List<Student> getStudentList(){
		return studentList ;
	}
	
	public StudentDAO() {
		studentList = new ArrayList<Student>();
	}
	

}
