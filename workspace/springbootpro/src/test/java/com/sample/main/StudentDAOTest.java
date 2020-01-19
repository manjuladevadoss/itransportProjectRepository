package com.sample.main;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.sample.dao.StudentDAO;
import com.sample.model.Student;

public class StudentDAOTest {

	@Test
	public void test() {
		StudentDAO sd = new StudentDAO();
		Student s = new Student();
		s.setName("thrun");
		s.setAge(30);
		sd.addStudent(s);
		Student s1 = new Student();
		s1.setName("uma");
		s1.setAge(21);
		sd.addStudent(s1);
		
		int l = sd.getStudentList().size();
		assertEquals(2,l);	
	}
	

   
	

}
