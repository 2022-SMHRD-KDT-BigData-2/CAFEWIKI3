<%@page import="java.util.List"%>
<%@page import="Model.CafeVO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Lobster&family=Noto+Sans:ital,wght@1,700&family=Source+Sans+Pro:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/searchMain3.css">
<script src="https://kit.fontawesome.com/8c9374f376.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.btn {
	font-family: 'Jua';
	src: url("./font2/Jua.TTF");
}

a {
	text-decoration-line: none;
	color: #784748;
}

.rankbox {
	width: 400px;
	height: 150px;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-top: 5px;
}

.rank {
	height: 100%;
}

.rpicture {
	width: 140px;
	height: 120px;
}

#rname {
	font-size: 25px;
}

#rank {
	font-size: 25px;
}
.Cafe2{
    width: 468px;
    height:170px;
    float: left;
    border: none;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<%
		HttpSession session2 = request.getSession();
	List<CafeVO> clist = (List<CafeVO>) request.getAttribute("clist");
	List<CafeVO> crank = (List<CafeVO>) session2.getAttribute("crank");
	%>
	<!-- header part -->
	<div class="container">
		<div class="header">
			<div class="logo">
				<img id="img" src="./image/login/coffee.png">
				<p id="title" >Cafe Wiki</p>
				<button class="btn" id="btn" type="button" onclick="location.href='logout.do'">๋ก๊ทธ์์</button>
			</div>
		</div>


		<!-- main part -->
		<div class="Main">

			<!-- ์ถ์ฒ ์นดํ ๊ฒ์์ฐฝ ๋ถ๋ถ -->
			<div class=all>
				<div class="wrap" height="100">
					<form action="searchname.do" method="post">
						<div class="search_box">
							<input class="btn" type="text" name="store" maxlength="225"
								placeholder="์นดํ์ด๋ฆ์ ์๋?ฅํด์ฃผ์ธ์">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>

				<!-- ์ถ์ฒ ์นดํ ์นดํ๊ณ?๋ฆฌ ๋ถ๋ถ -->
				<div class="category">
					<form action="searchtype.do" method="post">
						<div class="group1">
							<button class="btn" type="button"
								onclick="location.href='searchtype.do?type=<%=1%>'">๊ณต๋ถํ๊ธฐ
								์ข์</button>
							<button class="btn" type="button"
								onclick="location.href='searchtype.do?type=<%=2%>'">์ปคํผ๊ฐ
								ํน๋ณํ</button>
							<button class="btn" type="button"
								onclick="location.href='searchtype.do?type=<%=3%>'">ํ๊ฒฝ์ด
								์ข์</button>
						</div>
						<div class="group2">
							<button class="btn" type="button"
								onclick="location.href='searchtype.do?type=<%=4%>'">์๋ค๋จ๊ธฐ
								์ข์</button>
							<button class="btn" type="button"
								onclick="location.href='searchtype.do?type=<%=5%>'">๋์?ํธ๊ฐ
								๋ค์ํ</button>
						</div>
					</form>
				</div>
			</div>

			<!-- ์นดํ ์์ -->
			
			<%
				int i = 1;
			if (crank != null && clist == null) {%>
			<p class="btn" id="rank">์ธ๊ธฐ ์์!</p>
			<%	for (CafeVO cvo : crank) {
			%><div class="Cafe2">
					<div class="btn" id="cafetitle">
						<a href="CafeMain.do?o_num=<%=cvo.getO_num()%>"><%=i + "."%><%=cvo.getStore()%></a>
					</div>

					<div id="picture">
						<img src="<%=cvo.getPicture()%>">
					</div>
					<div id="location">
						<img src="./image/location.png">
						<p class="btn"><%=cvo.getLocation()%></p>
						<img src="./image/tel.png">
						<p class="btn"><%=cvo.getC_tel()%></p>
						<img src="./image/time.png">
						<p class="btn"><%=cvo.getTime()%></p>

					</div>
				</div>
			

			</table>
			<%
				i++;
			if (i == 4) {
				break;
			}
			}
			}
			%>

			<!-- ์ถ์ฒ ์นดํ ๊ฒ์๊ฒฐ๊ณผ ํ์ -->
			<div class="result">
				<%
					if (clist != null) {
					for (CafeVO vo : clist) {
				%>
				<div class="Cafe">
					<div class="btn" id="cafetitle">
						<a href="CafeMain.do?o_num=<%=vo.getO_num()%>"><%=vo.getStore()%></a>
					</div>

					<div id="picture">
						<img src="<%=vo.getPicture()%>">
					</div>
					<div id="location">
						<img src="./image/location.png">
						<p class="btn"><%=vo.getLocation()%></p>
						<img src="./image/tel.png">
						<p class="btn"><%=vo.getC_tel()%></p>
						<img src="./image/time.png">
						<p class="btn"><%=vo.getTime()%></p>

					</div>
				</div>
				<%
					}
				}
				%>
			</div>
		</div>

		<!-- footer & menu part -->
		<div class="footer">
			<div id="btn_group">
				<button class="btn" id="btn1" type="button"
					onclick="location.href='UserMain.jsp'">๋ง์ดํ์ด์ง</button>
				<button class="btn" id="btn2" type="button"
					onclick="location.href='SearchMain.jsp'">์นดํ ๊ฒ์</button>
				<button class="btn" id="btn3" type="button"
					onclick="location.href='MyCoupon.jsp'">๋ด ์ฟ?ํฐ ๊ด๋ฆฌ</button>
				<button class="btn" id="btn4" type="button"
					onclick="location.href='Update.jsp'">์?๋ณด ์์?</button>
			</div>
		</div>
		<!-- footer & menu part -->

	</div>
</body>
</html>