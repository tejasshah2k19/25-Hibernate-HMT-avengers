package com.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity//create 
@Table(name="users")//table name 
public class UserEntity {

	@Id//primary key 
	@GeneratedValue(strategy = GenerationType.IDENTITY)//auto_increment
	Integer userId;
	String firstName;
	String lastName;
	String email;
	String password; 
}
