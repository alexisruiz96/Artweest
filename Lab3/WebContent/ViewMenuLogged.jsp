<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".logpage").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
    
    $(".profpage").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
    
    $(".perspage").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
    
    $(".mainpage").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
    
    $(".searchb").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>


	<div id="nav">
		<br>
		<div id="nav_wrapper">
			<br> <br> <img class="imglogomenu"
				src="css/images/logoinv.png">
			<ul>
				<li><a href=# class="searchb" id="ViewSearch.jsp">Search</a></li>
				<li><a href=# class="mainpage" id="MainTweetsController">Main Page</a></li>
				<li><a href=# class="perspage" id="TweetsController">Personal Page</a></li>
				<li><a href="#">BLABLA</a></li>
				<li><a href=# class="profpage" id="ViewProfile.jsp">${user} (profile page)</a></li> <!-- OBVIAMENTE HACE FALTA CONTROLLADOR DE PROFILE PARA PASAR LAS DADAS, PERO DE MIENTRAS -->
				<li><a href=# class="logpage" id="LogoutController">Logout</a></li>
			</ul>
		</div>
	</div>
