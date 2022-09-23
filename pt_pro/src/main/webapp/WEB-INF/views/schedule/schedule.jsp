<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link href='static/fullcalendar/main.css' rel='stylesheet' />
<script src='static/fullcalendar/main.js'></script>
<script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          	aspectRatio: 1.35,
        	header: {
        		left: 'today',
        		center: 'title',
        		right: 'prev,next'
        	},
        	navLinks: true,
        	navLinkDayClick: function(date,jsEvent){
                 console.log('day',date.toISOString());
                 console.log('coords',jsEvent.pageX,jsEvent.pageY);
             },
            editable: true,
            select: function (arg) {
                var title = prompt('Event Title:');
                if (title) {
                      calendar.addEvent({
                          title: title,
                          start: arg.start,
                          end: arg.end,
                          allDay: arg.allDay
                         })
                     }
                    calendar.unselect()
                 }, 
                 events: [
                     {
                         title: 'All Day Event',
                         color: 'purple',
                         start: '2020-04-01',
                     },
                     {
                         title: 'My Event',
                         start: '2020-04-30',
                         description: 'This is a cool event'
                     },
                     {
                         title: 'Long Event',
                         start: '2020-04-04',
                         textColor: 'pink',
                         end: '2020-04-06'
                     },
                     {
                         title: 'Repeating Event',
                         start: '2020-04-09',
                         textcolor: 'black',
                         backgroundColor: 'blue',
                         rendering: 'background'
                     }
                 ]
             });
        	initialView: 'dayGridMonth'
        calendar.render();
      });
    </script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>