<%@page import="jsp03.FileManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1to50 랭크보드</title>
</head>
<body>
	<div id="board">
		<% FileManager.loadRank(); %>
		<div id="rank"></div>
	</div>
	<script>
		var rank = document.querySelector("#rank");
		rank.innerHTML = null;
		var frag = document.createDocumentFragment();
		var table = document.createElement("table");
		frag.append(table);
		rank.append(frag);
		ranking();
		var rankdata = <%= FileManager.getInstance().rankdata %>;
		console.log(rankdata);
		function ranking(){
			for(var i = 0; i < 10; i++){
				var tr = document.createElement("tr");
				table.append(tr);
				<% String[] array = FileManager.rankdata.split("/"); %>
				<%
					int rank = Integer.parseInt(array[0]); 
					String id = array[1];
					int time = Integer.parseInt(array[2]);
				%>
				
				var td = document.createElement("td");
				tr.append(td);
				td.textContent = <%= rank %>;
				var td = document.createElement("td");
				tr.append(td);
				td.textContent = <%= id %>;
				var td = document.createElement("td");
				tr.append(td);
				td.textContent = <%= time %>;
			}
		}
	</script>
</body>
</html>