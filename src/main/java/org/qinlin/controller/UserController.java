package org.qinlin.controller;

import org.qinlin.entity.User;
import org.qinlin.service.UserService;
import org.qinlin.util.AESUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("userController")
public class UserController {
    @Resource
    UserService service;

    @RequestMapping("insert")
    @ResponseBody
    public int insertIntoUser(User user)
    {
        return service.insert(user);
    }

    @RequestMapping("login")
    @ResponseBody
    public boolean login(String email, String password, HttpSession session)
    {
        return service.login(email, password, session);
    }

    @RequestMapping("removeSession")
    @ResponseBody
    public int removeSession(HttpSession session)
    {
        session.invalidate();
        return 1;
    }

    @RequestMapping("updateStuInfoImg")
    @ResponseBody
    public int updateStuInfoImg(HttpSession session, MultipartFile userImg, HttpServletRequest request) throws IOException {
        Integer userId = (Integer)session.getAttribute("userid");
        //Windows Upload
        String path = request.getSession().getServletContext().getRealPath("/static/img/userImg/");
        /*String path= ClassUtils.getDefaultClassLoader().getResource("/static/img/userImg/").getPath();*/

        //Linux Upload
        //String realPath =(systemPath.endsWith(File.separator)?systemPath:(systemPath + File.separator))+request.getParameter("target");


        /*String path = "/www/wwwroot/yeyixuan.top/wp-content/uploads/stuInfo/";*/


        /*String path;
        String tomcat_path = System.getProperty("user.dir");
        //获取tomcat中项目同级路径
        String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("/") + 1, tomcat_path.length());
        if (("bin").equals(bin_path)) {
            path = tomcat_path.substring(0, System.getProperty("user.dir").lastIndexOf("/")) + "/webapps" + "/static" + "/img"+"/stuInfo/";
        } else {
            path = tomcat_path + "/webapps" + "/static" + "/img"+"/stuInfo/";
        }*/

        File file=new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        //String filename = college_img.getOriginalFilename();
        userImg.transferTo(new File(path,userId+".jpg"));
        return 0;
    }

    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    public User selectByPrimaryKey(Integer userid)
    {
        return service.selectByPrimaryKey(userid);
    }

    @RequestMapping("updateUsername")
    @ResponseBody
    public int updateUsername(Integer userid, String username)
    {
        return service.updateUsername(userid, username);
    }

    @RequestMapping("updateRealname")
    @ResponseBody
    public int updateRealname(Integer userid, String realname)
    {
        return service.updateRealname(userid, realname);
    }

    @RequestMapping("updatePhone")
    @ResponseBody
    public int updatePhone(Integer userid, String phone)
    {
        return service.updatePhone(userid, phone);
    }

    @RequestMapping("updatePassword")
    @ResponseBody
    public int updatePassword(Integer userid, String originalPassword, String newPassword)
    {
        return service.updatePassword(userid, originalPassword, newPassword);
    }
}
