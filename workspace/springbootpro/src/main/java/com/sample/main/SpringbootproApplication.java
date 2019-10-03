package com.sample.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@ComponentScan({"com.sample"})
@SpringBootApplication
//@Configuration

public class SpringbootproApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootproApplication.class, args);
	}

}
