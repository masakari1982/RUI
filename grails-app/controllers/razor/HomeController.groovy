package razor

import org.grails.web.util.WebUtils

class HomeController {
    WebUtilsService webUtilsService;

    def index() {
        def request = WebUtils.retrieveGrailsWebRequest().request;
        try {
            def loggedUser = webUtilsService.getCookieByName(request, "loggedUser").getValue().split("#");
            println("++++++++++++++++++++++++++++++" + loggedUser)
        } catch (e) {

        }
        render view:("/home/Default")
    }

    def dashboard() {
        render view: ("/home/dashboard")
    }

    def linkssss() {
        render view: ("/home/testv1")
    }
}
