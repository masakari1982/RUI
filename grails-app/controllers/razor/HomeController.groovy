package razor

class HomeController {

    def index() {
        render view:("/home/Default")
    }
}
