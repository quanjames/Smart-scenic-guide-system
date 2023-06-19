package com.quan;

import com.quan.entity.User;
import com.quan.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@SpringBootApplication
public class Design1Application {


    public static void main(String[] args) {
        SpringApplication.run(Design1Application.class, args);
    }


}
