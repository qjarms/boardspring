<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,lee.*" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 
              어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
              <title>자유게시판</title>
    <!-- 부트스트랩 -->
    
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <style>
    header {height:100px;
                  background-color:rgba(125,211,242,0.5);/*투명도*/
                  border-radius:15px;padding:15px;margin:10px 0;
                  font-family:'Nanum Gothic',sans-serif;
                  text-align:center;       
       }
     footer{
         height:150px;
         font-family:'Nanum Gothic',sans-serif;
         border-radius:15px;padding:15px;margin:10px 0;
         background-color:#B2E4E0;
         text-align:center;  
     }  
     li {
        list-style:none;
     }
        
    </style>
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js 
         IE의 버전이 낮은 경우에는 html5에 대한 태그가 인식X ->인식을 시켜주는 옵션
    -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   <div class="container">
       <header>
           <h2 class="text-success">자유게시판(FreeBoard)</h2>
       </header>
       
       <!-- 상단 네비게이션   -->
       <nav class="navbar navbar-default" role="navigation">
           <div class="navbar-header">
               <button type="button" class="navbar-toggle"
                                                   data-toggle="collapse"
                                                   data-target=".navbar-ex1-collapse">
                    <span class="sr-only">navigation title</span>                        
           </button>
           <a class="navbar-brand glyphicon" href="main.jsp">
               <span class="glyphicon glyphicon-home"></span>
           </a>
           </div>
           <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav">
              <!--  -->
                 <li class="dropdown">
                    <a data-toggle="dropdown" href="#">회원
                        <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                  <li><a href="#">회원로그인</a></li>
                  <li><a href="#">마이페이지</a></li>
                  <li><a href="#">장바구니</a></li>
                  </ul>    
                  </li>
              
              <!-- 드랍다운부분을 추가2  -->
              <li class="dropdown">
                    <a data-toggle="dropdown" href="#">게시판
                        <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                  <li><a href="freeBoard.html">자유게시판</a></li>
                  <li><a href="geulimBoard1.html">그림게시판</a></li>
                  </ul>    
                </li>
                <!-- 드롭다운부분 추가3  -->
                <li class="dropdown">
                    <a data-toggle="dropdown" href="#">이달의아이템
                        <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                  <li><a href="#">인테리어</a></li>
                  <li><a href="#">생활용품</a></li>
                  <li><a href="#">책상</a></li>
                  <li><a href="#">의자</a></li>
                  <li><a href="#">조명</a></li>
                  </ul>    
                  </li>
                </ul>
                <!--검색창-->
              <form class="navbar-form navbar-right" role="search">
                 <div class="form-group">
                    <input type="text" class="form-control" placeholder="item name search">
                 </div>
                     <button type="button" class="btn btn-default">Submit</button>
              </form>
           </div>
        </nav>
            
               
            <!-- 게시판 리스트  -->
         <table class="table table-bordered table-hover">
         <colgroup>
            <col width="200px" height="100px">
         </colgroup>
          <thead>
          <tr>
           <td class="align-middle  text-align:center">번호</td><td>글제목</td><td>작성자</td><td>게시글날짜</td><td>조회수</td>
          </tr>
          </thead>
          <tbody>
          <!-- 추가  -->
           <%
			    ArrayList list=(ArrayList)request.getAttribute("list");//${list}
			    if(list!=null){//데이터가 존재한다면
			    	Iterator iter=list.iterator();
			    while(iter.hasNext()){//꺼낼 데이터가 존재한다면
			    	//Board data=(Board)iter.next();//Object ->(Board)형변환
			        BoardCommand data=(BoardCommand) iter.next();
			    	//-------------------------------------------------------
			    	int num=data.getNum();
			    	String title=data.getTitle();
			    	String author=data.getAuthor();
			    	//String writeday=data.getDate();//날짜출력 ->10글자뿐만 출력하라
			    	String writeday=data.getWriteday();
			    	//------------------------------------------------
			    	int readcnt=data.getReadcnt();//조회수
			    	
			%>
       
    <tr>  
 		<td align="center"><%= num %></td>
		<td><a href="retrieve.do?num=<%= num %>"><%= title %></a></td>
		<td><%= author %></td>
		<td><%= writeday.substring(0,10)%></td>
		<td><%= readcnt%></td>
	</tr>
          
     <%
	}//end while
}//end if
%>     
     </tbody>
       </table>

   <!-- 게시판리스트 끝  -->
   
       <!-- 버튼 -->
          <div class="text-center">
       <a href="write.jsp" class="btn btn-primary" role="button">글작성</a>
      <!--  <a href="update.jsp" class="btn btn-primary" role="button">글수정</a> -->
       <a href="Delete.html" class="btn btn-primary" role="button" onclick="alert('삭제페이지로 이동합니다')">글삭제</a>
          </div>
          
     
     
        <!-- 페이징 (이전,다음 게시물 이동) -->
       <div class="text-center">
       <ul class="pagination pagination-lg">
         <li><a href="#">이전</a></li>
         <li class="active"><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>         
         <li><a href="#">4</a></li>
         <li class="disabled"><a href="#">5</a></li>
         <li><a href="#">다음</a></li>
      </ul>
      </div>
      
      <!-- 검색 기능 -->
      <center>
     <tr><td colspan="5" align="center">
		<form action="search.do">
		   <select name="searchName" size="1">
	          <option value="author">작성자</option>
    	          <option value="title">제목</option>
                 </select>
		   <input type="text" name="searchValue"><input type="submit" value="검색">
		</form>
	</td></tr>
	</center>
      <!--  하단으로 정리  -->
      <footer class="footer">
            <li>
               <a href="/commerce/agreement/">이용약관</a>
               <span class="division-line">|</span>
                <span onclick="location.href='mailto:info@osquarecorp.com';" style="cursor: pointer;">제휴문의</span>
                <span class="division-line">|</span>
                <a href="/partner/store_inquiry/">입점문의</a>
                <span class="division-line">|</span>
                <a href="/commerce/privacy/">개인정보취급방침</a>
             </li>
             <br>
             <li>
                <span>조장:김은지</span>
                <span>조원:권상규</span>
                <span>조원:김태민</span>
                <span>조원:김범근</span>
             </li>
                <i class="fab fa-java fa-2x"></i><i class="fab  fa-html5 fa-2x"></i><i class="fab fa-github-alt fa-2x"></i>
           </footer>
       
       </div>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>