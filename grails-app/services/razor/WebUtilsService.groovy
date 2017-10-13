package razor

import grails.gorm.transactions.Transactional

import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletRequest

@Transactional
class WebUtilsService {

/**
 * 根据名字获取cookie
 * @param request
 * @param name cookie名字
 * @return
 */
    static Cookie getCookieByName(HttpServletRequest request, String name) {
        Map<String, Cookie> cookieMap = ReadCookieMap(request);
        if (cookieMap.containsKey(name)) {
            Cookie cookie = (Cookie) cookieMap.get(name);
            return cookie;
        } else {
            return null;
        }
    }

/**
 * 将cookie封装到Map里面
 * @param request
 * @return
 */
    private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
        Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (Cookie cookie : cookies) {
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;

    }
}
