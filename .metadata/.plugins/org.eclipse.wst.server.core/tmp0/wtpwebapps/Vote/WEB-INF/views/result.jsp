<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="./includes/header.jsp"%>
	<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">선거 목록</a></li>
								<li class="breadcrumb-item"><a href="/district?code=${vote.code}&id=${vote.id}">지역구 찾기</a></li>
				<li class="breadcrumb-item active" aria-current="page">개표 결과</li>
			</ol>
	</nav>
	<h1>개표 결과</h1>
<form class="row g-3">
	<input type="hidden" id="city" name="city" value="${vote.city}">
	<input type="hidden" id="district" name="district" value="${vote.district}">
	<input type="hidden" id="id" name="id" value="${vote.id}">
	<input type="hidden" id="code" name="code" value="${vote.code}">
	<div class="col-auto">
			<label>개표 결과</label>
			<p class="list"></p>
	</div>
	</form>
<form id="actionForm">

</form>  	
<script>
//뒤로가기 문제해결
$(document).ready(function(){
	history.replaceState({}, null, null)
	//변수 정의
	var actionForm = $("#actionForm");
	var city = $("#city").val();
	var district = $("#district").val();
	var id = $("#id").val();
	var code = $("#code").val();
	var key = "ho5ZzWHhC23tx5jSARHsEQdNvJY0fvloxEjtNOA39cLoKzXVaIuEyFPIwCpGm2uN52UF8PuwJF%2BSaStXbsHTBw%3D%3D";
	//선거구 출력(대통령,도지사,기초의원,광역의원, 국회 비례 선거 아닌 경우)
	if(code != 1 && code != 3 && code != 2 && code != 4 && code != 5 && code != 6 && code != 7){
	//개표 결과 출력
	 $.ajax({
		type: 'get',
		url: 'https://apis.data.go.kr/9760000/VoteXmntckInfoInqireService2/getXmntckSttusInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&sggName='+district,
		data: {
			numOfRows: 40,
			pageNo: 1,
			resultType: "json"
		},
		success: function (data) {
			let list = ' ';
			for(i=0; i<data.response.body.items.item.length; i++){
			list += '투표율: '+ Math.round(data.response.body.items.item[i].tusu/data.response.body.items.item[i].sunsu*10000)/100+'%<br>선거구 : ' + data.response.body.items.item[i].wiwName +'<br>' + '선거인단 :'+ data.response.body.items.item[i].sunsu + '<br> 투표수: ' + data.response.body.items.item[i].tusu + '<br>무효표: ' + data.response.body.items.item[0].mutusu +'<br>';
			list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
			list += '<thead>';
			list += '<tr>';
			list += '<th>이름</th>';
			list += '<th>정당</th>';
			list += '<th>득표수</th>';
			list += '<th>득표율</th>';
			list += '</tr>';
			list += '</thead>';
			list += '<tbody>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj01+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd01 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu01+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu01/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj02+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd02 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu02+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu02/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj03+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd03 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu03+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu03/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj04+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd04 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu04+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu04/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj05+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd05 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu05+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu05/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj06+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd06+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu06+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu06/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj07+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd07 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu07+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu07/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj08+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd08+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu08+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu08/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj09+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd09+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu09+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu09/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj10+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd10+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu10+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu10/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj11+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd11 + '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu11+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu11/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj12+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd12+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu12+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu12/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj13+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd13+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu13+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu13/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj14+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd14+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu14+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu14/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '<tr class="even">';
			list += '<td>'+data.response.body.items.item[i].hbj15+'</td>';
			list += '<td>'+data.response.body.items.item[i].jd15+ '</td>';
			list += '<td>'+data.response.body.items.item[i].dugsu15+'</td>';
			list += '<td>'+Math.round(data.response.body.items.item[i].dugsu15/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
			list += '</tr>';
			list += '</tbody>';
			list += '</table>';
			}
			
			$(".list").append(list);
		}
	});
	} else if (code == 1 || code == 3) {
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/VoteXmntckInfoInqireService2/getXmntckSttusInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&wiwName='+district,
			data: {
				numOfRows: 40,
				pageNo: 1,
				resultType: "json"
			},
			success: function (data) {
				let list = ' ';
				for(i=0; i<data.response.body.items.item.length; i++){
				list += '투표율: '+ Math.round(data.response.body.items.item[i].tusu/data.response.body.items.item[i].sunsu*10000)/100+'%<br>선거구 : ' + data.response.body.items.item[i].wiwName +'<br>' + '선거인단 :'+ data.response.body.items.item[i].sunsu + '<br> 투표수: ' + data.response.body.items.item[i].tusu + '<br>무효표: ' + data.response.body.items.item[0].mutusu +'<br>';
				list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
				list += '<thead>';
				list += '<tr>';
				list += '<th>이름</th>';
				list += '<th>정당</th>';
				list += '<th>득표수</th>';
				list += '<th>득표율</th>';
				list += '</tr>';
				list += '</thead>';
				list += '<tbody>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj01+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd01 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu01+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu01/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj02+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd02 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu02+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu02/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj03+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd03 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu03+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu03/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj04+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd04 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu04+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu04/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj05+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd05 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu05+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu05/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj06+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd06+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu06+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu06/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj07+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd07 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu07+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu07/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj08+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd08+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu08+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu08/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj09+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd09+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu09+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu09/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj10+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd10+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu10+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu10/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj11+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd11 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu11+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu11/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj12+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd12+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu12+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu12/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj13+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd13+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu13+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu13/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj14+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd14+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu14+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu14/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj15+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd15+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu15+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu15/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '</tbody>';
				list += '</table>';
				}
				
				$(".list").append(list);
			}
		});
	} else if(code == 4 || code == 2){
		 $.ajax({
				type: 'get',
				url: 'https://apis.data.go.kr/9760000/VoteXmntckInfoInqireService2/getXmntckSttusInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&sggName='+district,
				data: {
					numOfRows: 40,
					pageNo: 1,
					resultType: "json"
				},
				success: function (data) {
					let list = ' ';
					for(i=0; i<data.response.body.items.item.length; i++){
					list += '투표율: '+ Math.round(data.response.body.items.item[i].tusu/data.response.body.items.item[i].sunsu*10000)/100+'%<br>선거구 : ' + data.response.body.items.item[i].sggName +'('+data.response.body.items.item[i].wiwName+ ')<br>' + '선거인단 :'+ data.response.body.items.item[i].sunsu + '<br> 투표수: ' + data.response.body.items.item[i].tusu + '<br>무효표: ' + data.response.body.items.item[0].mutusu +'<br>';
					list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
					list += '<thead>';
					list += '<tr>';
					list += '<th>이름</th>';
					list += '<th>정당</th>';
					list += '<th>득표수</th>';
					list += '<th>득표율</th>';
					list += '</tr>';
					list += '</thead>';
					list += '<tbody>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj01+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd01 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu01+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu01/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj02+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd02 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu02+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu02/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj03+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd03 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu03+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu03/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj04+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd04 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu04+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu04/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj05+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd05 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu05+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu05/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj06+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd06+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu06+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu06/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj07+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd07 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu07+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu07/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj08+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd08+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu08+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu08/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj09+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd09+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu09+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu09/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj10+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd10+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu10+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu10/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj11+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd11 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu11+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu11/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj12+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd12+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu12+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu12/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj13+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd13+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu13+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu13/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj14+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd14+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu14+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu14/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj15+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd15+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu15+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu15/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '</tbody>';
					list += '</table>';
					}
					
					$(".list").append(list);
				}
			});
		}else if(code == 7){
			$.ajax({
				type: 'get',
				url: 'https://apis.data.go.kr/9760000/VoteXmntckInfoInqireService2/getXmntckSttusInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName=&wiwName=',
				data: {
					numOfRows: 400,
					pageNo: 1,
					resultType: "json"
				},
				success: function (data) {
					let list = ' ';
					for(i=0; i<data.response.body.items.item.length; i++){
					list += '투표율: '+ Math.round(data.response.body.items.item[i].tusu/data.response.body.items.item[i].sunsu*10000)/100+'%<br>선거구 : ' + data.response.body.items.item[i].wiwName +'(' + data.response.body.items.item[i].sdName +')<br>' + '선거인단 :'+ data.response.body.items.item[i].sunsu + '<br> 투표수: ' + data.response.body.items.item[i].tusu + '<br>무효표: ' + data.response.body.items.item[0].mutusu +'<br>';
					list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
					list += '<thead>';
					list += '<tr>';
					list += '<th>이름</th>';
					list += '<th>정당</th>';
					list += '<th>득표수</th>';
					list += '<th>득표율</th>';
					list += '</tr>';
					list += '</thead>';
					list += '<tbody>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj01+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd01 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu01+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu01/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj02+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd02 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu02+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu02/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj03+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd03 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu03+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu03/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj04+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd04 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu04+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu04/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj05+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd05 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu05+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu05/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj06+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd06+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu06+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu06/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj07+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd07 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu07+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu07/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj08+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd08+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu08+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu08/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj09+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd09+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu09+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu09/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj10+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd10+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu10+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu10/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj11+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd11 + '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu11+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu11/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj12+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd12+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu12+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu12/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj13+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd13+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu13+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu13/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj14+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd14+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu14+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu14/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '<tr class="even">';
					list += '<td>'+data.response.body.items.item[i].hbj15+'</td>';
					list += '<td>'+data.response.body.items.item[i].jd15+ '</td>';
					list += '<td>'+data.response.body.items.item[i].dugsu15+'</td>';
					list += '<td>'+Math.round(data.response.body.items.item[i].dugsu15/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
					list += '</tr>';
					list += '</tbody>';
					list += '</table>';
					}
					
					$(".list").append(list);
				}
			});
			
		}else {
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/VoteXmntckInfoInqireService2/getXmntckSttusInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&wiwName='+district,
			data: {
				numOfRows: 40,
				pageNo: 1,
				resultType: "json"
			},
			success: function (data) {
				let list = ' ';
				for(i=0; i<data.response.body.items.item.length; i++){
				list += '투표율: '+ Math.round(data.response.body.items.item[i].tusu/data.response.body.items.item[i].sunsu*10000)/100+'%<br>선거구 : ' + data.response.body.items.item[i].sggName +'<br>' + '선거인단 :'+ data.response.body.items.item[i].sunsu + '<br> 투표수: ' + data.response.body.items.item[i].tusu + '<br>무효표: ' + data.response.body.items.item[0].mutusu +'<br>';
				list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
				list += '<thead>';
				list += '<tr>';
				list += '<th>이름</th>';
				list += '<th>정당</th>';
				list += '<th>득표수</th>';
				list += '<th>득표율</th>';
				list += '</tr>';
				list += '</thead>';
				list += '<tbody>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj01+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd01 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu01+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu01/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj02+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd02 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu02+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu02/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj03+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd03 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu03+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu03/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj04+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd04 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu04+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu04/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj05+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd05 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu05+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu05/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj06+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd06+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu06+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu06/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj07+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd07 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu07+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu07/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj08+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd08+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu08+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu08/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj09+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd09+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu09+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu09/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj10+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd10+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu10+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu10/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj11+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd11 + '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu11+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu11/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj12+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd12+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu12+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu12/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj13+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd13+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu13+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu13/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj14+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd14+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu14+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu14/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '<tr class="even">';
				list += '<td>'+data.response.body.items.item[i].hbj15+'</td>';
				list += '<td>'+data.response.body.items.item[i].jd15+ '</td>';
				list += '<td>'+data.response.body.items.item[i].dugsu15+'</td>';
				list += '<td>'+Math.round(data.response.body.items.item[i].dugsu15/data.response.body.items.item[i].yutusu*10000)/100+'%</td>'
				list += '</tr>';
				list += '</tbody>';
				list += '</table>';
				}
				
				$(".list").append(list);
			}
		});
		
	}
	
});

 
</script>
<%@ include file="./includes/footer.jsp"%>