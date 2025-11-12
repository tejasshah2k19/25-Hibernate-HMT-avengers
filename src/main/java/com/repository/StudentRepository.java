package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.StudentEntity;

@Repository
public interface StudentRepository extends JpaRepository<StudentEntity, Integer> {

	List<StudentEntity> findByFirstName(String firstName);
	List<StudentEntity> findByLastName(String lastName);
	List<StudentEntity> findByEmailAndPassword(String email,String password);

	@Query(value = "select * from students where first_name like :firstName",nativeQuery = true)
	List<StudentEntity>  searchByFirstName(String firstName);
	

}

//select * from students  -> findAll(); -> List<StudentEntity>

//delete from students where studentId = 1  -> deleteById(1)
