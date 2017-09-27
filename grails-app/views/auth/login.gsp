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

    <script>
    if (window.top !== window.self) {
        window.top.location = window.location;
    }
    </script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">H+</h1>
        </div>

        <h3>欢迎使用 H+</h3>

        <form class="m-t" role="form" action="index.html">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-danger block full-width m-b">登 录</button>
        </form>
    </div>
</div>

<!-- 全局js -->
<g:include view="/webInit.gsp"/>
<script src="${scriptsPath}/jquery.min.js?v=2.1.4"></script>
<script src="${scriptsPath}/bootstrap.min.js?v=3.3.6"></script>

</body>

</html>