<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="bs5" value="/static/bs5" />
<c:url var="jQuery" value="/static/js" />
<link rel="stylesheet" type="text/css" href="${bs5}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${jQuery}/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../module/nav.jsp"%>
<meta charset='utf-8' />
<link href='static/fullcalendar/main.css' rel='stylesheet' />
<script src='static/fullcalendar/main.js'></script>
<style>
#calendar {
	width: 50%;
	float: right;
	background-color: white;
	margin-right: 15%;
}

#timeCal {
	margin-left: 15%;
	background-color: white;
	width: 20%;
	border: 1px solid black;
	height: 35%;
	float: left;
}
.reservebutton, .rounded{
	width:100%;
	height: 15%;
	text-align : center;
}
.ta{
	font-size: 32px;
	margin-left: auto;
	margin-right: auto;
}
.reservebutton {
	margin-top : 5%;
}
.reserveTime, td, th{
	valign: middle;
	
	
}
</style>
<title>PT 예약 조회</title>
</head>
<body class="body">
	<section>
		<div id="timeCal">
			<input  id="today" class="rounded form-control-lg" type="date" name="date"><br>
			<table class="ta">
				<thead>
				</thead>
				<tbody class="reserveTime">
					<tr>
						<th><input type="radio" id="am9" name="time" value="09:00"> 9 : 00</th>
						<th><input type="radio" id="am10" name="time" value="10:00"> 10 : 00</th>
						<th><input type="radio" id="am11" name="time" value="11:00"> 11 : 00</th>
					</tr>
					<tr>
						<th><input type="radio" id="pm12" name="time" value="12:00"> 12 : 00</th>
						<th><input type="radio" id="pm1" name="time" value="13:00"> 13 : 00</th>
						<th><input type="radio" id="pm2" name="time" value="14:00"> 14 : 00</th>
					</tr>
					<tr>
						<th><input type="radio" id="pm3" name="time" value="15:00"> 15 : 00</th>
						<th><input type="radio" id="pm4" name="time" value="16:00"> 16 : 00</th>
						<th><input type="radio" id="pm5" name="time" value="17:00"> 17 : 00</th>
					</tr>
					<tr>
						<th><input type="radio" id="pm6" name="time" value="18:00"> 18 : 00</th>
						<th><input type="radio" id="pm7" name="time" value="19:00"> 19 : 00</th>
						<th><input type="radio" id="pm8" name="time" value="20:00"> 20 : 00</th>
					</tr>

					<tr>
						<th><input type="radio" id="pm9" name="time" value="21:00"> 21 : 00</th>
						<th><input type="radio" id="pm10" name="time" value="22:00"> 22 : 00</th>
						<th><input type="radio" id="pm11" name="time" value="23:00"> 23 : 00</th>
					</tr>
				</tbody>
			</table>
			<button class="reservebutton btn btn-warning" type="button" id="addSchedule">예약</button>
		</div>
		<script>
  	  $("#addSchedule").click(function() {
  		  var day = $('input[name="date"]').val();
  		  var times = $('input[name="time"]:checked').val();
  		  console.log(day);
  		  console.log(times);
  		 console.log(day +" "+ times);
  		  $.ajax({
  			  type: "POST",
  			  url:"./schedule/add",
  			  data:{
  				  "addSchedule" : day +" "+ times
  			  },
  			success: function(data) {
  				console.log(data);
				if(data == true){
					location.reload();
				} else {
					alert("이미 예약된 시간입니다.");
				}
			}
    		
  			  
  		  });
  	  });
  	  
  	 </script>

		<div id='calendar'></div>
	</section>
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
    	// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
    	
        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next,today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
         
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          editable: false, // don't allow event dragging
          eventResourceEditable: true, // except for between resources
          // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
          eventClick: function(arg) {
        	  // 있는 일정 클릭시,
        	  console.log("#등록된 일정 클릭#");
        	  console.log(arg.event._def.publicId);
        	  
            if (confirm('일정을 삭제하시겠습니까?')) {
            	var id = arg.event._def.publicId;
            	console.log(id);
            	$.ajax({
            		 type:"POST",
            		 url:"./schedule/delete",
            		dataType:"json",
            		data:{
            			"id":id
            		},
            		success: function(data) {
            			arg.event.remove()
    				}
            	  });
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: function(info, successCallback, failureCallback){
        	  // ajax 처리로 데이터를 로딩 시킨다.
        	  $.ajax({
        		 type:"get",
        		 url:"./schedule/data",
        		dataType:"json",
        		success: function(data) {
					successCallback(data);
				}
        		
        	  });
          }
      });
        calendar.render();
      });
    // 오늘날짜  출력
    document.getElementById('today').value= new Date().toISOString().slice(0, 10);
   console.log( document.getElementById('today'));
    console.log(new Date().toISOString().slice(0, 10));
    </script>
</body>
</html>