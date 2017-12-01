// 跳转
function skip(url,param) {
	window.location.href = url+param;
}
function skipfor(url) {
    window.location.href = url;
}
// 刷新
function reload() {
	window.location.reload()
}

// 返回
function back(){
	history.go(-1);
}

// 根据id删除
function deleteById(url, id, obj) {
	layer.confirm('是否删除？', {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		layer.load(2);
		$.ajax({
			type : 'POST',
			cache : false,
			async : false,
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : {
				"id" : id
			},
			url : url,
			error : function() {
				alert("失败啦!");
			},
			success : function(data) {
				layer.closeAll();
				layer.msg(data.msg);
				if(data.status == 1)
					$(obj).parent().parent().remove();
			}
		});
	}, function() {
		layer.closeAll();
	});
}
