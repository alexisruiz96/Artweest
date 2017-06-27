<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<title>Search page</title>

<form id = "serach_users">
	<input type = "text" placeholder="Search for username..." maxlength="30" class="search" name="s_user">
	<input type="submit" value="Search" class="submitsearch">
</form><br><br><br>

<div>

	<c:forEach  var="username" items="${userlist}">
		<div class="u_found">
  			<!--  <div class="username_s"><b>${username.user}</b></div>-->
  			<input class="username_s" type="submit" name="user_f_pp" value="${username.user}"></br>
  			<c:forEach  var="tweetslist" items="${tweetslist}">
  				<div><b><u>${tweetslist.title}</u></b> - at ${tweetslist.time}<br><br>${tweetslist.text}</div><br><br><br><br/>
	  			<c:if test="${empty isGuest}">
	  				<c:if test="${isAdmin eq 1}">
	  					<input id="${tweetslist.id}" class="delete_t" type="submit" onclick="drop(this)" name="tweet_d" value="Delete">
	  				</c:if>
	  			</c:if>
  			</c:forEach>
		</div><br><br><br>
  	</c:forEach>
	
</div>



<!-- Validate the form and send the serialize the searched userto use it after -->
<script>
	$(document).ready(
			function() {
				$("#serach_users").validate(
						{
							submitHandler : function(form) {
								$('#content').load('SearchTweetController',
										$("#serach_users").serialize());
							}
						});
			});
	
	function drop(that){
		var x = that.id;
	    if (that.value=="Delete") {
			$.ajax({ 
		        type: "POST",
		        url: 'DeleteTweetController',
		        data: {tweettodelete: x},
		        success: successFunc,
		        error: errorFunc
		    });

		    function successFunc(data, status) {
		    	console.log("Correct delete tweet execution");
		    }

		    function errorFunc() {
		    	console.log("Bad delete tweet execution");
		    }		
	    }
	    console.log(that.value);
	}
</script>