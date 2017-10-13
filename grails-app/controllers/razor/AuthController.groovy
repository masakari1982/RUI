package razor

import org.grails.web.json.JSONObject
import org.grails.web.util.WebUtils
import javax.servlet.http.Cookie


class AuthController {

    def login() {
        render view: "/auth/login"
    }

    def checkLogin() {
        def request = WebUtils.retrieveGrailsWebRequest().request;
        JSONObject jsonData = request.JSON;

        session.setAttribute("userId",jsonData.password);
        session.setAttribute("userRole","Administrator");
        session.setAttribute("userAccount","Admin");
        session.setAttribute("userName",jsonData.userName);

        JSONObject jsonResult = new JSONObject();
        session.setMaxInactiveInterval(120*60); //二小时超时

        String loggedUser = jsonData.userName + "#" + jsonData.password
        Cookie cookie = new Cookie("loggedUser",loggedUser);
        cookie.setPath("/");
        response.addCookie(cookie);

        jsonResult.put("result", "success");
        render jsonResult;
    }

    def logout() {
        def request = WebUtils.retrieveGrailsWebRequest().request;
        def SessionCurrent = request.getSession();
        SessionCurrent.invalidate();
        redirect (controller:"auth",action:"Login");
    }
}
