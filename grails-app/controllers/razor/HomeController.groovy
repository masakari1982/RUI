package razor

class HomeController {

    def index() {
        render view:("/home/Default")
    }

    def dashboard() {
        render view: ("/home/dashboard")
    }

    def linkssss() {
        render view: ("/home/testv1")
    }
}
