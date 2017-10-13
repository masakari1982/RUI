function layMsg(msg, timer, url) {
    layClose();
    if(!timer) {
        timer = 7200000;
    }
    if(url) {
        layer.msg(
            msg,
            {
                anim : 5,
                time : timer,
            }, function () {
                location.href = url;
            }
        )
    } else {
        layer.msg(
            msg,
            {
                anim : 5,
                time : timer,
            }
        )
    }
}

function layClose() {
    layer.closeAll();
}

var cusMsg = function () {
    return {
        ApiError: function () {
            return '<i class="fa fa-bell"></i> 数据接口错误！';
        },
        //加载系列
        loading: function () {
            return '<i class="fa fa-spin fa-spinner"></i> 数据加载中...';
        },
        loadsuccess: function () {
            return '<i class="fa fa-check"></i> 数据加载成功';
        },
        loaderror: function () {
            return '<i class="fa fa-bell"></i> 数据加载错误！';
        },
        //新增/修改系列
        submiting: function () {
            return '<i class="fa fa-spin fa-cog"></i> 提交中...';
        },
        subsuccess: function () {
            return '<i class="fa fa-check"></i> 数据提交成功.';
        },
        suberror: function () {
            return '<i class="fa fa-times"></i> 数据提交失败.';
        },
        //删除系列
        deleting: function () {
            return '<i class="fa fa-spin fa-cog"></i> 数据删除中....';
        },
        delsuccess: function () {
            return '<i class="fa fa-check"></i> 数据删除成功.';
        },
        delerror: function () {
            return '<i class="fa fa-times"></i> 数据删除失败.';
        },
        //密码校验
        checking: function () {
            return '<i class="fa fa-spin fa-cog"></i> 数据校验中....';
        },
        checksuccess: function () {
            return '<i class="fa fa-check"></i> 校验成功!';
        },
        checkfail: function () {
            return '<i class="fa fa-times"></i> 校验失败，请检查输入的数据.';
        },

    }
}();