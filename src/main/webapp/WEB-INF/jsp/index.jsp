<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="common/header.jsp" %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="common/navbar.jsp" %>
    <div class="layui-body">

        <section class="content-header">
            <h1>后台总览</h1>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">用户总数</span>
                            <span class="info-box-number">
                        <span text="">${userCounts}</span>
                        <small>个</small>
                    </span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">文章总数</span>
                            <span class="info-box-number">
                        <span text="">${articleCounts}</span>
                        <small>个</small>
                    </span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-number">
                                <div class="layui-inline">
                         <input type="text" class="layui-input" id="test1" value="2018-01-01 00:00:00"/>
                            &nbsp;倒计时：&nbsp;
                                    &nbsp<div id="test2"></div>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
</div>

<div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
</div>
<%@include file="common/footer.jsp" %>

<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
    layui.use(['util', 'laydate', 'layer'], function () {
        var util = layui.util
            , laydate = layui.laydate
            , layer = layui.layer;
//        //固定块
//        util.fixbar({
//            bar1: true
//            , bar2: true
//            , css: {right: 50, bottom: 100}
//            , bgcolor: '#393D49'
//            , click: function (type) {
//                if (type === 'bar1') {
//                    layer.msg('icon是可以随便换的')
//                } else if (type === 'bar2') {
//                    layer.msg('两个bar都可以设定是否开启')
//                }
//            }
//        });

        //倒计时
        var thisTimer, setCountdown = function (y, M, d, H, m, s) {
            var endTime = new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0) //结束日期
                , serverTime = new Date(); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

            clearTimeout(thisTimer);
            util.countdown(endTime, serverTime, function (date, serverTime, timer) {
                var str = date[0] + '天' + date[1] + '时' + date[2] + '分' + date[3] + '秒';
                lay('#test2').html(str);
                thisTimer = timer;
            });
        };
        setCountdown(2018, 0, 1);

        laydate.render({
            elem: '#test1'
            , type: 'datetime'
            , done: function (value, date) {
                setCountdown(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });


        //某个时间在当前时间的多久前
        var setTimeAgo = function (y, M, d, H, m, s) {
            var str = util.timeAgo(new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0));
            lay('#test4').html(str);
        };

        laydate.render({
            elem: '#test3'
            , type: 'datetime'
            , done: function (value, date) {
                setTimeAgo(date.year, date.month - 1, date.date, date.hours, date.minutes, date.seconds);
            }
        });

    });
</script>
</body>
</html>
