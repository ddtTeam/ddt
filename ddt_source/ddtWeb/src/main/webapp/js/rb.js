$(function() {
	$("#save_check").on("click", function(){
		var _name = $("#name").val();
		if (_name == null || $.trim(_name) == '') {
			return;
		}
		
		var _start = $("#start_datepicker").val();
		if (_start == null || $.trim(_start) == '') {
			return;
		}
		
		var _end = $("#end_datepicker").val();
		if (_end == null || $.trim(_end) == '') {
			return;
		}
		
		document.roll_book_form.submit();
	});
	
	$("#save_info_check").on("click", function(){
		var _start = $("#start_roll_datepicker").val();
		if (_start == null || $.trim(_start) == '') {
			return;
		}
		
		var _end = $("#end_roll_datepicker").val();
		if (_end == null || $.trim(_end) == '') {
			return;
		}
		
		var _code = $("#rollCode").val();
		if (_code == null || $.trim(_code) == '') {
			return;
		}
		
		document.roll_book_info_form.submit();
	});
	
	$("#userAdd").on("click", function() {
		var rid = $("#rid").val();
		var nameList = $("#nameList").val();
		
		if (rid <= 0) {
			alert("请指定点名册");
			return;
		}
		
		if (nameList == null || $.trim(nameList) == "") {
			alert("请填写需要添加的用户名单");
			return;
		}
		
		$.post("/rollbook/useraddDetail", {rid:rid, nameList:nameList},
				function(data){
					alert(data.result);
		}, "json");
	});
});