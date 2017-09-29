<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<!--移动端不可见-->
<div id="changeBg">
    <div class="mask"></div>
</div>
<!--移动端不可见-->
<div class="col-md-9 widget-contanier hidden-md hidden-sm hidden-xs">
    <div style="margin:20px 0; margin-top:calc((100vh - 200px)/2)">
        <div style="height:50px; line-height: 50px; font-size: 36px; color:#fff; font-weight: 500"><i
                class="fa fa-bar-chart"></i> 欢迎使用</div>

        <div style="height:30px; line-height: 30px; font-size: 13px; color:#fff; font-weight: 500; color:#d5d5d5">使用中有任何问题请在登录后的界面中选择问题反馈进行提交，同时建议您使用截屏进行反馈。</div>
    </div>

    <div id="calendar" class="pull-left"></div>

    <div class="clearfix rclock pull-left"></div>
</div>
<div class="col-md-3 login-container clearfix">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <h2>登录系统</h2>

        <form class="m-t" role="form" action="index.html">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="用户名" required="">
            </div>

            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-info block full-width m-b">立即登录</button>
        </form>
    </div>
</div>

<!-- 全局js -->
<g:include view="/webInit.gsp"/>
<script src="${scriptsPath}/jquery.min.js?v=2.1.4"></script>
<script src="${scriptsPath}/bootstrap.min.js?v=3.3.6"></script>
<script src="${scriptsPath}/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="${scriptsPath}/plugins/jqcolor/jquery.color.min.js"></script>
<script src="${scriptsPath}/rClock.js"></script>

<script type="text/javascript">
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

    //显示全部页面
    window.onload = function () {
        $('#rloading').fadeOut(function () {
            this.remove();
        });
    }
</script>
</body>

</html>