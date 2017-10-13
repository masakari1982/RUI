<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <g:include view="/layouts/basicStyle.gsp"></g:include>
    <link rel="stylesheet" href="${cssPath}/auth/login/login.css">

    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>

<body class="gray-bg">

<div id="rloading">
    <div class="sk-spinner sk-spinner-three-bounce">
        <div class="sk-bounce1"></div>
        <div class="sk-bounce2"></div>
        <div class="sk-bounce3"></div>
    </div>

    <div class="slowNetwork">
        <i class="fa fa-github"></i> <span>师父，等等我呀…</span>
    </div>
</div>

<div id="changeBg">
    <div class="mask"></div>
</div>
<!--移动端不可见-->
<div class="col-md-9 widget-contanier hidden-md hidden-sm hidden-xs">
    <div id="hintText" class="" style="margin:0 0 20px 0;">
        <div style="height:50px; line-height: 50px; font-size: 36px; color:#fff; font-weight: 500"><i class="fa fa-bar-chart"></i> 欢迎使用</div>
        <div style="height:30px; line-height: 30px; font-size: 14px; color:#fff; font-weight: 500; color:#d5d5d5">使用中有任何问题请在登录后的界面中选择问题反馈进行提交，同时建议您使用截屏进行反馈。</div>
    </div>
    <div id="calendar" class="pull-left"></div>
    <div id="rclock" class="clearfix rclock pull-left"></div>
</div>
<!--移动端不可见-->

<!--登录主体-->
<div class="col-md-3 login-container clearfix">

    <div id="loginscreen" class="middle-box loginscreen">
        <h2 class="ft38">系统登录</h2>
        <form id="login_login" action="#">
            <div class="form-group">
                <input name="userName" type="text" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input name="password" type="password" class="form-control" placeholder="密码" required="">
            </div>
            <a id="doLogin" class="btn btn-info block full-width m-b ft18">立即登录</a>
        </form>
        <h6 class="text-center hidden-lg" style="height:20px; line-height: 20px; width: 100%; margin-bottom: -30px">&copy; 2017 V1.0.0 R+ 版权所有</h6>
    </div>

</div>
<!--登录主体-->

<div class="text-center hidden-md hidden-sm hidden-xs" style="height:50px; line-height: 50px; width: 100%; position: absolute; bottom: 0; color: #fff; background-color: rgba(255,255,255,0.2)">&copy; 2017 V1.0.0 R+ 版权所有</div>

<!-- 全局js -->
<g:include view="/layouts/basicScript.gsp" />

<!-- 核心js -->
<script type="text/javascript" src="${scriptsPath}/rCore.js?v=4.1.0"></script>
<script type="text/javascript" src="${scriptsPath}/customize.js?v=4.1.0"></script>


<!-- 第三方插件 -->
<script src="${scriptsPath}/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="${scriptsPath}/plugins/jqcolor/jquery.color.min.js"></script>
<script src="${scriptsPath}/rClock.js"></script>

<script type="text/javascript">
    var $form = $('#login_login');

    //随机摇号换bg
    var bg = 'bg' + (Math.floor(Math.random() * 5) + 1);

    //慢速网络提示
    function slowNetwork() {
        $('.slowNetwork').fadeIn()
    }

    //设置日历
    $('#calendar').fullCalendar({
        header: {
            left: 'prev',
            center: 'title',
            right: 'next'
        },
        editable: false,
        droppable: false,
        firstDay: 1
    });

    //显示部件页面
    $('.widget-contanier').animate({
        'opacity': '1',
    }, 500);
    $('#changeBg').css({
        'background-image': 'url(/static/assets/img/' + bg + '.jpg)',
    }).animate({
        'opacity': '1',
    }, 500);
    $('#changeBg').css({
        'z-index': 0,
    });

    //检测慢速网络
    var timer = window.setTimeout("slowNetwork()", 2000);

    //多语言欢迎界面


    //调整登录插件
    function adjustWidget() {
        var clientHeight = $(window).height();
        var loginScreenHeight = $('.loginscreen').outerHeight(true);
        $('.loginscreen, #hintText').css({
            'margin-top': (clientHeight - loginScreenHeight)/2,
        });
    }

    //显示全部页面
    window.onload = function () {
        $('#rloading').fadeOut(function () {
            this.remove();
        });
        adjustWidget();
        $('#hintText').addClass('animated fadeInLeft');
        $('#calendar').addClass('animated fadeInUp');
        $('#rclock').addClass('animated fadeInDown');
        $('#loginscreen').addClass('animated fadeInDown');
    }

    //ajax登录
    $('#doLogin').click(function (event) {
        layMsg(cusMsg.checking());
        $.ajax({
            type: "POST",
            cache: false,
            url: rootPath + "/auth/checkLogin", //ajax地址
            contentType: "application/json; charset=utf-8",//POST一定要加这一句，不要忘了
            dataType: "json",
            data: JSON.stringify($form.serializeJson()),
            success: function (data) {
                if (data.result == 'success') {
                    layMsg(cusMsg.checksuccess(),1000,"/Home/index");
                } else {
                    layMsg(cusMsg.checkfail(),3000);
                };
            },
            error: function (xhr, ajaxOptions, thrownError) {
                layMsg(cusMsg.ApiError(),3000);
            }
        });
    })

//    window.onresize = function () {
//        adjustWidget();
//    }
</script>
</body>

</html>