package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.StudentEntity;
import com.repository.StudentRepository;

@Controller
public class StudentController {

	@Autowired
	StudentRepository studentRepository;

	@GetMapping("newstudent")
	public String newStudent() {
		return "NewStudent";
	}

	@PostMapping("saveStudent")
	public String saveStudent(StudentEntity studentEntity) {
		System.out.println(studentEntity.getFirstName());
		System.out.println(studentEntity.getBatchName());

		// db insert
		studentRepository.save(studentEntity);

		return "redirect:/liststudents";
	}

	@GetMapping("liststudents")
	public String listStudents(Model model) {

		List<StudentEntity> students = studentRepository.findAll();
		model.addAttribute("students", students);
		return "ListStudents";
	}

	@GetMapping("deletestudent")
	public String deleteStudent(Integer studentId) {
		studentRepository.deleteById(studentId);
		return "redirect:/liststudents";
	}

	@PostMapping("search")
	public String search(String firstName,Model model) {
//		List<StudentEntity> students = studentRepository.findByFirstName(firstName);
		List<StudentEntity> students = studentRepository.searchByFirstName("%"+firstName+"%");
		model.addAttribute("students",students);
		return "ListStudents";
	}

	@GetMapping("editstudent")
	public String editStudent(Integer studentId,Model model) {
		Optional<StudentEntity> op =  studentRepository.findById(studentId);
		if(op.isEmpty()) {
			return "";
		}else {
			StudentEntity student  = op.get();	
			model.addAttribute("student",student);
		}
		return "EditStudent";
	}
	
	@PostMapping("updateStudent")
	public String updateStudent(StudentEntity student) {
		//student -> firstName lastName email studentId 
		
		StudentEntity dbStudent =  studentRepository.findById(student.getStudentId()).get();
		
		dbStudent.setFirstName(student.getFirstName());
		dbStudent.setLastName(student.getLastName());
		dbStudent.setEmail(student.getEmail());
		
		studentRepository.save(dbStudent);
		//save 
		//update students set firstName =? , lastName = ? , email = ? where studentId = ? 
		
		return "redirect:/liststudents";
	}
}


















