<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="./includes/header.jsp"%>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">선거 목록</a></li>
				<li class="breadcrumb-item"><a href="/district?code=${vote.code}&id=${vote.id}">지역구 찾기</a></li>
				<li class="breadcrumb-item active" aria-current="page">당선인</li>
			</ol>
	</nav>
<form class="row g-3">
	<input type="hidden" id="city" name="city" value="${vote.city}">
	<input type="hidden" id="district" name="district" value="${vote.district}">
	<input type="hidden" id="id" name="id" value="${vote.id}">
	<input type="hidden" id="code" name="code" value="${vote.code}">
	<div class="col-auto">
		<label>당선자</label>
		<p class="list"></p>
	</div>
</form>
<script>
$(document).ready(function(){
//뒤로가기 문제해결
	history.replaceState({}, null, null);
	var city = $("#city").val();
	var district = $("#district").val();
	var id = $("#id").val();
	var code = $("#code").val();
	var key = "ho5ZzWHhC23tx5jSARHsEQdNvJY0fvloxEjtNOA39cLoKzXVaIuEyFPIwCpGm2uN52UF8PuwJF%2BSaStXbsHTBw%3D%3D";
	//당선인 출력(국회의원 비례대표 아닐 때)
	if(code != 7 && code != 8 && code != 9){
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/WinnerInfoInqireService2/getWinnerInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&sggName='+district,
			data: {
				numOfRows: 20,
				pageNo: 1,
				resultType: "json"
			}, 
			success: function (data) {
				let list = '';
				for(i=0; i<data.response.body.totalCount; i++){
				list += '선거구명:' + data.response.body.items.item[i].sggName + '<br>';
				list += '이름:' + data.response.body.items.item[i].name + '('+ data.response.body.items.item[i].hanjaName +')' + '<br>';
				list += '최종학력:' + data.response.body.items.item[i].edu + '<br>';
				list += '직업:' + data.response.body.items.item[i].job + '<br>';
				list += '정당명:' + data.response.body.items.item[i].jdName + '<br>';
				list += '득표수(득표율):' + data.response.body.items.item[i].dugsu + ' ('+data.response.body.items.item[i].dugyul+'%)<br>'
				list += '경력:' + data.response.body.items.item[i].career1 +'<br>'+ data.response.body.items.item[i].career2 + '<br>';
				list += '<br>';
				}
				$(".list").append(list);
			}
		});
		//국회의원 비례대표일 때
	} else if(code == 7) {
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/WinnerInfoInqireService2/getWinnerInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&sggName='+district,
			data: {
				numOfRows: 100,
				pageNo: 1,
				resultType: "json"
			}, 
			success: function (data) {
				let list = '';
				for(i=0; i<data.response.body.totalCount; i++){
				list += '이름:' + data.response.body.items.item[i].name + '('+ data.response.body.items.item[i].hanjaName +')' + '<br>';
				list += '최종학력:' + data.response.body.items.item[i].edu + '<br>';
				list += '직업:' + data.response.body.items.item[i].job + '<br>';
				list += '정당명:' + data.response.body.items.item[i].jdName + '<br>';
				list += '경력:' + data.response.body.items.item[i].career1 +'<br>'+ data.response.body.items.item[i].career2 + '<br>';
				list += '<br>';
				}
				$(".list").append(list);
			}
		});
		
	} else {
		
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/WinnerInfoInqireService2/getWinnerInfoInqire?serviceKey='+key+'&sgId='+id+'&sgTypecode='+code+'&sdName='+city+'&sggName='+district,
			data: {
				numOfRows: 20,
				pageNo: 1,
				resultType: "json"
			}, 
			success: function (data) {
				let list = '';
				for(i=0; i<data.response.body.totalCount; i++){
				list += '선거구명:' + data.response.body.items.item[i].sggName + '<br>';
				list += '이름:' + data.response.body.items.item[i].name + '('+ data.response.body.items.item[i].hanjaName +')' + '<br>';
				list += '최종학력:' + data.response.body.items.item[i].edu + '<br>';
				list += '직업:' + data.response.body.items.item[i].job + '<br>';
				list += '정당명:' + data.response.body.items.item[i].jdName + '<br>';
				list += '경력:' + data.response.body.items.item[i].career1 +'<br>'+ data.response.body.items.item[i].career2 + '<br>';
				list += '<br>';
				}
				$(".list").append(list);
			}
		});
	}
});
</script>
<%@ include file="./includes/footer.jsp"%>