package com.sample.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.main.entity.StudentEntity;
import com.sample.main.repo.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired(required=true)
	private StudentRepository studentRepository;

	public List<StudentEntity> getStuList() {
		List<StudentEntity> stuList = studentRepository.findAll();
		if (stuList.size() > 0) {
			return stuList;
		} else {
			stuList = new ArrayList<StudentEntity>();
			return stuList;
		}

	}

}
