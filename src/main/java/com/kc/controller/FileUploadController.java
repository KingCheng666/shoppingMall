package com.kc.controller;

import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class FileUploadController {

    //    @PostMapping("/Upload")
    @RequestMapping("/fileUpload")

    public void fileload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {

        //获取文件名
        String fileName = file.getOriginalFilename();

        //文件上传路径
        String path = "D:\\IDEA_Work\\shoppingMall\\src\\main\\webapp";

//        ServletContext sc = request.getSession().getServletContext();
//        String path = sc.getRealPath("/files") + "/"; // �趨�ļ������Ŀ¼

        //构建文件
        File f = new File(path);

        //判断文件是否存在
        if (!f.exists()) {
            f.mkdirs();
        }
        //文件写入
        if (!file.isEmpty()) {
            try {
                FileOutputStream fos = new FileOutputStream(path + fileName);
                InputStream in = file.getInputStream();
                int a = 0;
                if ((a = in.read()) != -1) {
                    fos.write(a);
                }
                in.close();
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print("<script>alert('返回首页');window.location.href='index_Manager.jsp';</script>");
    }
}
