<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../../template/bootStrap.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">

.cal_top {
	text-align: center;
	font-size: 17px;
	font-weight: bold;
}

.cal {
	text-align: center;
	font-weight: bold;
}

table.calendar {
	
	border: 1px solid #DEB887;
	display: inline-table;
	text-align: right;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid #DEB887;
	width: 100px;
}

.resDay{
	cursor: pointer;
}

.cal-schedule{
	font-size: 6px;
	text-align: left;
	
}

#myBtn{
	cursor: pointer;
}

.cal-schedule > .ss{
	width:97px;
	height :15px;
	cursor: pointer;
	margin-bottom: 2px;
	background-color: #FFEBCD;
	color: #2F4F4F;
	font-weight: bold;
}
.topCon{
	font-size: 13px;
	color: #DEB887;
}
.moveBtn{
	width: 30px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 10px;
	border-radius: 5px;
	padding: 5px;
}

#myModal{
	font-size: 13px;
}
.modalBtn{
	width: 60px;
	background-color: #FFE4B5;
	border: 2px solid #FFE4B5;
	font-size: 11px;
	border-radius: 5px;
	padding: 5px;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="cal_top">
		<span id="cal_top_year"></span> 
		<span id="cal_top_month"></span> 
		<button id="prevMonth" class="moveBtn">◀</button>
		<button id="nextMonth" class="moveBtn">▶</button>
	</div>
	<div class="topCon">
			→  날짜를 클릭하면 해당 날짜에 봉사를 신청할 수 있습니다.
	</div>
	
	<!--  <div id="cal_tab" class="cal"></div> -->
	<table class="calendar">
		<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
		<c:forEach begin="0" end="5" step="1">
			<tr height="100">
			<c:forEach begin="0" end="6" step="1">
				<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">
				    <div class="cal-day"><span class="resDay"></span></div>
				    <div class="cal-schedule"></div>
				</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>


  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p id="modalCon"></p>
        </div>
        <div class="modal-footer">
        	<button type="button" class="modalBtn" data-dismiss="modal" id = "resDel">신청취소</button>
       
          <button type="button" class="modalBtn" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

	<script type="text/javascript">
		var today = null;
		var year = null;
		var month = null;
		var firstDay = null;
		var lastDay = null;
		var $tdDay = null;
		var $tdSche = null;
		var resDate = null;
		var a = null;

		var info = null;
		var arYear = [];
		var arMonth = [];
		var arDate = [];
		var arStartTime = [];
		var arNum = [];

		var names = [];
		var num = null;

			getRes();
			initDate();
			drawDays();

			$("#prevMonth").on("click", function() {
				movePrevMonth();
			});
			$("#nextMonth").on("click", function() {
				moveNextMonth();
			});
			
			
			var mid = '${member.id}';
			
			$(document).on("click", ".ss", function(event){
				console.log("들어옴");
				num =$(this).attr('title');
				console.log(num);
								
				$.ajax(
					{
						method:"GET",
						url:"./reserveInfo",
						data:{resNum:num},
						success:function(data){
						var mbtn= data.substring(data.indexOf(":")+1, data.indexOf("<"));
							
							if(mid == mbtn.trim()){
								$("#resDel").show();
							}else{
								$("#resDel").hide();
							}
							$("#modalCon").html(data);
							
							
						}
					}		
				);
			});
			
			$("#resDel").click(function() {
				location.href="./reserveDelete?num=${dto.num}&resNum="+num;
			});
		//날짜에 예약내역 표시하기위해 배열 받아오기
		function getRes() {

			<c:forEach items="${list}" var="dto" varStatus="i">
			var dtoyear = '${dto.year}';
			var dtomonth = '${dto.month}';
			var dtodate = '${dto.date}';

			if (dtomonth < 10) {
				dtomonth = String("0" + dtomonth);
			}
			arYear.push(dtoyear)
			arMonth.push(dtomonth);
			arDate.push(dtodate);
			names.push('${dto.id}');
			arStartTime.push('${dto.startTime}');
			arNum.push('${dto.resNum}');
			</c:forEach>

		}

		//클릭한 날짜 받아오기
		$(".resDay")
				.click(
						function() {
							a = $(this).html();
							resDate = year + "-" + month + "-" + a;
							location.href = "./reserveVoluntary?num=${dto.num}&resDate="
									+ resDate;

						});

		//날짜 초기화
		function initDate() {
			$tdDay = $("td div.cal-day .resDay")
			$tdSche = $("td div.cal-schedule")
			dayCount = 0;
			today = new Date();
			year = today.getFullYear();
			month = today.getMonth() + 1;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);

		}

		//calendar 날짜,예약일정표시
		function drawDays() {
			$("#cal_top_year").text(year + "년");
			$("#cal_top_month").text(month + "월");

			var ss = document.getElementsByClassName("cal-schedule");

			for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
				$tdDay.eq(i).text(++dayCount);

				for (var j = 0; j < arYear.length; j++) {

					if (year == arYear[j] && month == arMonth[j] && dayCount == arDate[j]) {

						ss[i].innerHTML += "<div class='ss' data-toggle='modal' data-target='#myModal' title='"+arNum[j]+"'>"+names[j] + " - "+ arStartTime[j] + "~</div>";

					}

				}
			}

			for (var i = 0; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "red");
			}
			for (var i = 6; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "blue");
			}
		}

		//calendar 월 이동
		function movePrevMonth() {
			month--;
			if (month <= 0) {
				month = 12;
				year--;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			
			getNewInfo();
			
		}

		function moveNextMonth() {
			month++;
			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			
			getNewInfo();
		}

		function getNewInfo() {
			
			for (var i = 0; i < 42; i++) {
				$tdDay.eq(i).text("");
				$tdSche.eq(i).text("");

			}
			dayCount = 0;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);

			
			drawDays();
			
		}
		
		
		
	</script>
</body>
</html>
