package razor

class LoginFilters {

    def filters = {
        all(controller: '*',action:"*") {
            before = {
                if(session.userName||controllerName=="auth") {
                    println("++++++++++++")
                    return true
                }else{
                    redirect(uri:"/auth/login")
                    return false;
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}