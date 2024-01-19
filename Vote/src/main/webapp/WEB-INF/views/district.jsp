<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
<%@ include file="./includes/header.jsp" %>
<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/">선거 목록</a></li>
			<li class="breadcrumb-item active">지역구 찾기</li>
		</ol>
	</nav>


<form class="row g-3" id="form">
	<input type="hidden" id="id" name="id" value="${vote.id}">
	<input type="hidden" id="code" name="code" value="${vote.code}">
	<div class="col-auto">
		<label>선거구 목록</label>
		<p class="list"></p>
	</div>
</form>

<script>
	$(document).ready(function () {
		//뒤로가기 문제해결
		history.replaceState({}, null, null);
		var id = $("#id").val();
		var code = $("#code").val();
		
		var key = "ho5ZzWHhC23tx5jSARHsEQdNvJY0fvloxEjtNOA39cLoKzXVaIuEyFPIwCpGm2uN52UF8PuwJF%2BSaStXbsHTBw%3D%3D";
		//선거구 출력(대통령,도지사,기초의원,광역의원 선거 아닌 경우)
		if(code != 1 && code != 3 && code != 5 && code != 6){
		$.ajax({
			type: 'get',
			url: 'https://apis.data.go.kr/9760000/CommonCodeService/getCommonSggCodeList?serviceKey=' + key + '&sgId=' + id + "&sgTypecode="+code,
			data: {
				numOfRows: 100,
				pageNo: 1,
				resultType: "json"
			},
			success: function (data) {
				var list = '';
				var dnoarr= new Array();
				var cityarr= new Array();
				var districtarr= new Array();
				list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
				list += '<thead>';
				list += '<tr>';
				list += '<th>지역명</th>';
				list += '<th>선거구명</th>';
				list += '<th>당선자</th>';
				list += '</tr>';
				list += '</thead>';
				list += '<tbody>';	
				for(i=0; i<data.response.body.numOfRows; i++){
					cityarr[i] = data.response.body.items.item[i].sdName;	
					districtarr[i] = data.response.body.items.item[i].sggName;
					list += '<tr class="even">';
					list += '<td>' + cityarr[i] + '</td>';
					list += '<td>' + '<a href="/result?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + districtarr[i] + '</a></td>';
					list += '<td>' + '<a href="/elect?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + '당선인 보기' + '</a></td>';
					list += '</tr>';
				}
				list += '<//tbody>';
				list += '</table>';
				
				$(".list").append(list);

			}
		});
		} else if(code == 1 || code == 5 || code == 6){
			$.ajax({
				type: 'get',
				url: 'https://apis.data.go.kr/9760000/CommonCodeService/getCommonGusigunCodeList?serviceKey=' + key + '&sgId=' + id + "&sgTypecode="+code,
				data: {
					numOfRows: 100,
					pageNo: 1,
					resultType: "json"
				},
				success: function (data) {
					var list = '';
					var dnoarr= new Array();
					var cityarr= new Array();
					var districtarr= new Array();
					list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
					list += '<thead>';
					list += '<tr>';
					list += '<th>지역명</th>';
					list += '<th>선거구명</th>';
					list += '<th>당선자</th>';
					list += '</tr>';
					list += '</thead>';
					list += '<tbody>';	

					for(i=0; i<data.response.body.numOfRows; i++){
						cityarr[i] = data.response.body.items.item[i].sdName;	
						districtarr[i] = data.response.body.items.item[i].wiwName;
						list += '<tr class="even">';
						list += '<td>' + cityarr[i] + '</td>';	
						list += '<td>' + '<a href="/result?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + districtarr[i] + '</a></td>';
						list += '<td>' + '<a href="/elect?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + '당선인 보기' + '</a></td>';
						list += '</tr>';
					}
					
					list += '<//tbody>';
					list += '</table>';
					
					$(".list").append(list);

				}
			});
			
		} else {
			$.ajax({
				type: 'get',
				url: 'https://apis.data.go.kr/9760000/CommonCodeService/getCommonSggCodeList?serviceKey=' + key + '&sgId=' + id + "&sgTypecode="+code,
				data: {
					numOfRows: 100,
					pageNo: 1,
					resultType: "json"
				},
				success: function (data) {
					var list = '';
					var dnoarr= new Array();
					var cityarr= new Array();
					var districtarr= new Array();
					list += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
					list += '<thead>';
					list += '<tr>';
					list += '<th>지역명</th>';
					list += '<th>선거구명</th>';
					list += '<th>당선자</th>';
					list += '</tr>';
					list += '</thead>';
					list += '<tbody>';	

					for(i=0; i<data.response.body.totalCount; i++){
						cityarr[i] = data.response.body.items.item[i].sdName;	
						districtarr[i] = '';
						list += '<tr class="even">';
						list += '<td>' + cityarr[i] + '</td>';	
						list += '<td>' + '<a href="/result?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + cityarr[i] + '</a></td>';
						list += '<td>' + '<a href="/elect?code='+code+'&id='+id+'&city='+cityarr[i]+'&district='+districtarr[i]+'">' + '당선인 보기' + '</a></td>';
						list += '</tr>';
					}
					
					list += '<//tbody>';
					list += '</table>';
					
					$(".list").append(list);

				}
			});
		}

	});

</script>

<%@ include file="./includes/footer.jsp" %>