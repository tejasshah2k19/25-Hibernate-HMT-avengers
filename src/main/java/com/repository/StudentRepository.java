package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.StudentEntity;

@Repository
public interface StudentRepository extends JpaRepository<StudentEntity, Integer>{

}


//select * from students  -> findAll(); -> List<StudentEntity>


//delete from students where studentId = 1  -> deleteById(1)



