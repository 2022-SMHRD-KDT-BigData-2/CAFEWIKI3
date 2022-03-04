<%@page import="java.util.List"%>
<%@page import="Model.CafeVO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Lobster&family=Noto+Sans:ital,wght@1,700&family=Source+Sans+Pro:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./css/searchMain2.css">
    <script src="https://kit.fontawesome.com/8c9374f376.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
.rankbox{
	height : 100%;
	margin-top : 5px;
	margin-bottom : 5px;
}
.rank{
	height : 100%;
}
</style>
</head>
<body>

	<% List<CafeVO> clist = (List<CafeVO>)request.getAttribute("clist");
	List<CafeVO> crank = (List<CafeVO>)request.getAttribute("crank");
	%> 
	<!-- header part -->
	<div class="container">
		<div class="header">
			<div class="logo">
				<img id="img" src="./image/login/coffee.png">
				<p id="title">Cafe Wiki</p>
				<button id="btn" type="button" onclick="location.href='login.jsp'">로그아웃</button>
			</div>
		</div>


		<!-- main part -->
		<div class="Main">

			<!-- 추천 카페 검색창 부분 -->
			<div class = all>
			<div class="wrap" height="100">
				<form action="searchname.do" method="post">
					<div class="search_box">
						<input type="text" name="store" maxlength="225"
							placeholder="카페이름을 입력해주세요">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>

			<!-- 추천 카페 카테고리 부분 -->
			<div class="category">
				<form action="searchtype.do" method="post">
					<div class="group1">
						<button type="button"
							onclick="location.href='searchtype.do?type=<%=1%>'">공부하기
							좋은</button>
						<button type="button"
							onclick="location.href='searchtype.do?type=<%=2%>'">커피가
							특별한</button>
						<button type="button"
							onclick="location.href='searchtype.do?type=<%=3%>'">풍경이
							좋은</button>
					</div>
					<div class="group2">
						<button type="button"
							onclick="location.href='searchtype.do?type=<%=4%>'">수다떨기
							좋은</button>
						<button type="button"
							onclick="location.href='searchtype.do?type=<%=5%>'">디저트가
							다양한</button>
					</div>
				</form>
			</div>			
			</div>
			
			<!-- 카페 순위 -->
			<div class="rankbox">
				<form action="rank.do" method="post">
				<p>인기 순위!</p>
					<%  int i=1;
						if(crank != null){for(CafeVO cvo : crank){%>
						<div class="rank">
							<p><%=i %>.<%=cvo.getStore()%></p>
						</div>
					<%  i++;
						if(i==4){
						break;
						}
					}} %>
				</form>
			</div>
			
			<!-- 추천 카페 검색결과 표시 -->
			<div class="result">
			<% if(clist != null){for(CafeVO vo : clist){ %>
			<div class="Cafe">
				<div id="cafetitle"><%=vo.getStore()%></div>
				<div id="picture">
					<img src="<%=vo.getPicture()%>">
				</div>
				<div id="location">
					<img src="./image/location.png">
					<p><%=vo.getLocation()%></p>
					<img src="./image/tel.png">
					<p><%=vo.getC_tel()%></p>
					<img src="./image/time.png">
					<p><%=vo.getTime()%></p>

				</div>
			</div>
			<%}} %>
			</div>
			</div>
			
			<!-- footer & menu part -->
			<div class="footer">
				<div id="btn_group">
					<button id="btn1" type="button"
						onclick="location.href='UserMain.jsp'">마이페이지</button>
					<button id="btn2" type="button" onclick="location.href='SearchMain.jsp'">카페 검색</button>
					<button id="btn3" type="button" onclick="location.href='MyCoupon.jsp'">내 쿠폰 관리</button>
					<button id="btn4" type="button" onclick="location.href='Update.jsp'">정보수정</button>
				</div>
			</div>
			<!-- footer & menu part -->

		</div>
</body>
</html>