<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Oh!No....404</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">

    <g:include view="webInit.gsp"></g:include>

    <link href="${cssPath}/bootstrap.css?v=3.3.6" rel="stylesheet">
    <link href="${cssPath}/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${cssPath}/animate.css" rel="stylesheet">
    <link href="${cssPath}/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box middle-box-func text-center animated fadeInDown">
    <h1>404</h1>
    <h3 class="font-bold">页面未找到！</h3>

    <div class="error-desc">
        抱歉，页面好像去火星了~
        <div class="m-t">
            <a class="btn btn-primary" href="javascript:(history).go(-2)">返回</a>
        </div>

    </div>
</div>

<!-- 全局js -->
<script src="${scriptsPath}/jquery.min.js?v=2.1.4"></script>
<script src="${scriptsPath}/bootstrap.min.js?v=3.3.6"></script>

</body>

</html>