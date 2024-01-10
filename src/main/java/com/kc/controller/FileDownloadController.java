package com.kc.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownloadController {

    @RequestMapping("/fileDownload")
    public void FileDownload(HttpServletRequest request,
                             HttpServletResponse response)
            throws IOException {
        File file = new File("D:\\ShoppingMallvideo.mp4");
        if (file.exists()) {
            response.setContentType("video/mp4");// 设置文件类型
            response.addHeader("Content-Disposition",
                    "attachment; filename=ShoppingMallvideo.mp4");
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
            } catch (IOException ex) {
                System.out.println(ex.toString());
            } finally {
                if (bis != null) {
                    bis.close();
                }
                if (fis != null) {
                    fis.close();
                }
            }
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<center><h2>文件不存在，下载失败</h2>");
            out.println("<br><a href='index_Users.jsp'>返回用户首页</a></br></center>");
        }
    }
}

