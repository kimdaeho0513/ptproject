<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:url var="bs5" value="/static/bs5" />
<c:url var="jQuery" value="/static/js" />
<link rel="stylesheet" type="text/css" href="${bs5}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="${bs5}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${jQuery}/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset='utf-8' />
    <%@ include file="../module/head.jsp" %>
    <link href='static/fullcalendar/main.css' rel='stylesheet' />
    <script src='static/fullcalendar/main.js'></script>
    <style>
    #calendar{
    	width: 90%;
    	margin:0 auto; 
    }
   
    </style>
    <title>회원 PT 조회</title>
  </head>
  <body>
  	
    <div id='calendar'></div>
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
        		 url:"./trschedule/data",
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
