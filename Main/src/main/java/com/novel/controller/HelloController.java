package com.novel.controller;

import com.novel.entity.ForbiddenWord;
import com.novel.mapper.ForbiddenWordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
public class HelloController {
    @Autowired
    private ForbiddenWordMapper forbiddenWordMapper;

    @RequestMapping("/hello")
    public List<ForbiddenWord> hello() {
        LocalDateTime time1=LocalDateTime.now();
        LocalDateTime time2=LocalDateTime.now();
//        forbiddenWordMapper.delete(null);
        ForbiddenWord a = new ForbiddenWord(null,"aaa",time1,time2);
        forbiddenWordMapper.insert(a);
        a = new ForbiddenWord(null,"aaa",time1,time2);
        forbiddenWordMapper.insert(a);
        a = new ForbiddenWord(null,"aaa",time1,time2);
        forbiddenWordMapper.insert(a);
        return forbiddenWordMapper.selectList(null);
    }
}
