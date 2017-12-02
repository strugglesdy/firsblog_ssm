<title>FirsBlog</title>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link type="image/vnd.microsoft.icon" href="${APP_PATH }/static/img/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="${APP_PATH }/static/css/styleHome.css"/>
<script type="text/javascript" src="${APP_PATH }/static/js/top.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/top.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery.1.4.2.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $.fn.smartFloat = function() {
            var position = function(element) {
                var top = element.position().top,
                    pos = element.css("position");
                $(window).scroll(function() {
                    var scrolls = $(this).scrollTop();
                    if (scrolls > top) {
                        if (window.XMLHttpRequest) {
                            element.css({
                                position: "fixed",
                                top:0

                            });
                        } else {
                            element.css({
                                top: scrolls
                            });
                        }
                    } else {
                        element.css({
                            position: "absolute",
                            top: top
                        });
                    }
                });
            };
            return $(this).each(function() {
                position($(this));
            });
        };
        //绑定,将引号中的内容替换成你想要下拉的模块的ID或者CLASS名字,如"#ABC",".ABC"
        $("#author").smartFloat();
    });
</script>