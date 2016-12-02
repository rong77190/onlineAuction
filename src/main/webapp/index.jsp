<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SnowSlideTeam</title>




    <link rel="stylesheet" href="<c:url value='resources/css/app/bootstrap.min.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/js/bootstrap-select/dist/css/bootstrap.min.css?version=201100108'/>">

    <script type="text/javascript" src="<c:url value='resources/css/app/jquery-1.9.1.min.js' /> "></script>

    <script type="text/javascript" src="<c:url value='resources/css/app/bootstrap.min.js' /> "></script>
    <!-- endbower -->
    <!-- endbuild -->

    <!-- build:css styles\main.css -->

    <link rel="stylesheet" href="<c:url value='resources/css/app/main.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/css/app/mycss.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/css/app/CommonStyle.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/css/app/HomeStyle.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/css/app/item.css?version=201100108' />">
    <link rel="stylesheet" href="<c:url value='resources/css/app/Nav.css?version=201100108' />">


    <script type="text/javascript">
        $(function(){

            $("#brows").mouseenter(function(){

                $this=$(this);
                b = setTimeout(function(){
                    $("#brows-menu").slideDown("fast")
                },150);

            }).mouseleave(function(){

                clearTimeout(b)

            });

            $("#browsbody").mouseleave(function(){
                $("#brows-menu").slideUp("fast")
            });

            $("#start").mouseenter(function(){

                $this=$(this);
                c = setTimeout(function(){
                    $("#start-menu").slideDown("fast")
                },150);

            }).mouseleave(function(){

                clearTimeout(c)

            });

            $("#startbody").mouseleave(function(){
                $("#start-menu").slideUp("fast")
            });

            $("#newbtn").tooltip();

            $("#hotbtn").tooltip();

            $("#closingbtn").tooltip();

            $("#expiringbtn").tooltip();

            $(".tip-rec").click(function(){
                $("#login-tip").show();
                $(".modal-backdrop-defined").show();
            });

            $("#close-tip").click(function(){
                $("#login-tip").hide();
                $(".modal-backdrop-defined").hide();
            });

        })
    </script>

</head>
<body>
<div class="modal-backdrop-defined"></div>
<div class="modal-defined" id="login-tip">
    <div class="modal-dialog-defined">
        <div class="modal-content-defined">
            <div class="modal-header-defined">
                <button type="button" class="close" id="close-tip">&times;</button>
                <h4 class="modal-title-defined">登录提示</h4>
            </div>
            <div class="modal-body-defined">
                <!-- <P>请先登录才可查看已参与项目或发起众筹</P> -->
            </div>
            <div class="modal-footer-defined">
                <a href="Login.jsp"><button class="btn-sm-glass-black" data-dismiss="modal">登录</button></a>
                <a href="register.jsp"><button class="btn-sm-glass-black" data-dismiss="modal">注册</button></a>
            </div>
        </div>
    </div>
</div>
<div class="body-type">
    <div class="navbar-defined">
        <div class="navbar-left-defined">
            <a href="login.jsp"><button class="btn btn-sm-glass">登录</button></a>
            <a href="register.jsp"><button class="btn btn-sm-glass">注册</button></a>
        </div>
        <div class="navbar-user">
            <a class="data-inline" href="#">用户名</a>
            <h4 class="data-inline">|</h4>
            <a class="data-inline" href="#">登出</a>
        </div>
        <div class="navbar-right-defined">
            <a href="Home.html"><button class="btn btn-glass">首页</button></a>
            <div style="display: inline-block;position: relative" id="browsbody">
                <button class="btn btn-glass" id="brows">分类浏览</button>
                <ul class="down-menu" id="brows-menu">
                    <li class="one"><a href="#">食品</a></li>
                    <li class="two"><a href="#">玩具</a></li>
                    <li class="three"><a href="#">户外</a></li>
                    <li class="four"><a href="#">科技</a></li>
                </ul>
            </div>
            <a class="tip-rec" href="#">
                <a href="page.jsp">  <button class="btn btn-glass">我的拍卖</button>
                </a>
                <div style="display: inline-block;position: relative" id="startbody">
                    <a href="user/user"> <button class="btn btn-glass tip-rec" id="start" >个人中心</button></a>

                    <!--  <!--  -->  <ul class="down-menu" id="start-menu">
                    <li class="one"><a class="tip-rec" href="#">食品</a></li>
                    <li class="two"><a class="tip-rec" href="#">玩具</a></li>
                    <li class="three"><a class="tip-rec" href="#">化妆品</a></li>
                    <li class="four"><a class="tip-rec" href="#">书籍</a></li>
                </ul>
                </div>
                <form style="display: inline-block">
                    <div style="position: relative">
                        <input type="text" class="search-bar" placeholder="Search">
                        <div class="magnifier"></div>
                    </div>
                </form>
        </div>
    </div>
</div>
<div class="header-top-defined"></div>
<div class="header-defined">
    <div class="body-type">
        <div class="head-caption">
            <h1>SnowSlide拍卖平台</h1>
        </div>
        <div class="head-logo"></div>
        <div class="carousel-defined">
            <div id="myCarousel" style=";height: 340px" data-ride="carousel" data-interval="4000" data-pause="hover" data-wrap="true" class="carousel slide">
                <div style="margin: 0 auto;width: 880px" class="carousel-inner">
                    <div class="item active"><img class="maxh" alt="第一张图" src="resources/images/flower.jpg"></div>
                    <div class="item"><img class="maxh" alt="第二张图" src="resources/images/green.jpg"></div>
                    <div class="item"><img class="maxh" alt="第三张图" src="resources/images/juice.jpg"></div>
                </div>
                <ol style="bottom: 0" class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <a href="#myCarousel" data-slide="prev">
                    <div class="left-defined"></div>
                </a>
                <a href="#myCarousel" data-slide="next">
                    <div class="right-defined"></div>
                </a>
            </div>
        </div>
    </div>
</div>
<div style="height: 30px"></div>
<div class="body-type">
    <div class="body-content">
        <div class="label-new">
            <h3 style="display: inline">NEW最新上架</h3>
            <div data-original-title="点击查看更多最新项目" id="newbtn" class="btn-defined label-more" data-placement="top"></div>
        </div>
        <div class="proj-body" src="images/perfume.jpg">
            <div class="proj-container" src="images/perfume.jpg">
                <!--div class="proj-status"></div>-->
                <a href="Good1.jsp">
                    <div class="proj-img" > <img src="resources/images/perfume.jpg"></div>
                </a>
                <div class="proj-tag" rc="resources/images/perfume.jpg">
                    <div class="divider-pro" rc="resources/images/perfume.jpg"></div>
                    <h4>Daisy</h4>
                    <h4>Perfume</h4>
                    <br/>
                    一口价￥<h5 class="data-inline">500</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：230
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/light.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>暖光灯</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">80</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：65
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/shoe.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>全新白色板鞋</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">400</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：270
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/Upan.png"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>金士顿U盘128G</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
        </div>
    </div>
    <div class="body-content">
        <div class="label-hot">
            <h3 style="display: inline">Hot热门推荐</h3>
            <div data-original-title="点击查看更多热门内容" id="hotbtn" class="btn-defined label-more" data-placement="top"></div>
        </div>
        <div class="proj-body">
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
             <c:forEach items="" var="good">


               <a href="#">
                    <div class="proj-img"> <img src="resources/images/fengshan.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>${good.goodName}</h4>
                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/basketball.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/light.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/math.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
        </div>
    </div>
    <div class="body-content">
        <div class="label-closing">
            <h3 style="display: inline">         </h3>
            <div data-original-title="点击查看更多接近完成项目" id="closingbtn" class="btn-defined label-more" data-placement="top"></div>
        </div>
        <div class="proj-body">
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/shoe.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/Upan.png"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/basketball.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
            <div class="proj-container">
                <!--div class="proj-status"></div>-->
                <a href="#">
                    <div class="proj-img"> <img src="resources/images/fengshan.jpg"></div>
                </a>
                <div class="proj-tag">
                    <div class="divider-pro"></div>
                    <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>
        </div>
    </div>
    <div class="body-content">
        <div class="label-expiring">
            <h3 style="display: inline">即将结束（敬请期待）</h3>
        </div>

        <div class="proj-body">
            <c:forEach items="goodList2" var="good">
            <div class="proj-container">
                    <!--div class="proj-status"></div>-->
                    <a href="#">
                        <div class="proj-img"> <img src="resources/images/操作系统.jpg"></div>
                    </a>
                    <div class="proj-tag">
                        <div class="divider-pro"></div>
                        <h4>商品名</h4>

                    <br/>
                    一口价￥<h5 class="data-inline">172</h5>
                    <div class="progress bar-defined bar-defined-tag">
                        <div class="progress-bar progress-bar-warning" style="width: 78"></div>
                    </div>
                    当前价格：78
                </div>
            </div>

            <%--<div class="proj-container">--%>
                <%--<!--div class="proj-status"></div>-->--%>
                <%--<a href="#">--%>
                    <%--<div class="proj-img"> <img src="resources/images/bicycle.jpg"></div>--%>
                <%--</a>--%>
                <%--<div class="proj-tag">--%>
                    <%--<div class="divider-pro"></div>--%>
                    <%--<h4>Daisy</h4>--%>
                    <%--<h4>Perfume</h4>--%>
                    <%--<br/>--%>
                    <%--一口价￥<h5 class="data-inline">500</h5>--%>
                    <%--<div class="progress bar-defined bar-defined-tag">--%>
                        <%--<div class="progress-bar progress-bar-warning" style="width: 78"></div>--%>
                    <%--</div>--%>
                    <%--当前价格：240--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="proj-container">--%>
                <%--<!--div class="proj-status"></div>-->--%>
                <%--<a href="#">--%>
                    <%--<div class="proj-img"></div>--%>
                <%--</a>--%>
                <%--<div class="proj-tag">--%>
                    <%--<div class="divider-pro"></div>--%>
                    <%--<h4>商品名</h4>--%>

                    <%--<br/>--%>
                    <%--一口价￥<h5 class="data-inline">56</h5>--%>
                    <%--<div class="progress bar-defined bar-defined-tag">--%>
                        <%--<div class="progress-bar progress-bar-warning" style="width: 78"></div>--%>
                    <%--</div>--%>
                    <%--当前价格：78--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="proj-container">--%>
                <%--<!--div class="proj-status"></div>-->--%>
                <%--<a href="#">--%>
                    <%--<div class="proj-img"></div>--%>
                <%--</a>--%>
                <%--<div class="proj-tag">--%>
                    <%--<div class="divider-pro"></div>--%>
                    <%--<h4>商品名</h4>--%>

                    <%--<br/>--%>
                    <%--一口价￥<h5 class="data-inline">172</h5>--%>
                    <%--<div class="progress bar-defined bar-defined-tag">--%>
                        <%--<div class="progress-bar progress-bar-warning" style="width: 78"></div>--%>
                    <%--</div>--%>
                    <%--当前价格：78--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
<div class="body-footer"></div>
</body>


</html>