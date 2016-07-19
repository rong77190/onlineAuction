package com.auction.service.imp;

import com.auction.dao.StudentMapper;
import com.auction.model.Student;
import com.auction.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2016/7/19.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    public Student getStudent(int id) {
        return studentMapper.selectByPrimaryKey(id);
    }
}
