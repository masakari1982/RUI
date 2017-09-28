package razor

class HomeController {

    def index() {
        render view:("/home/Default")
    }

    def dashboard() {
        render view: ("/home/dashboard")
    }
}
