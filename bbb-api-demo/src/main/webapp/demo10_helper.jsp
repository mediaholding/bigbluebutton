<%@ page contentType="text/xml" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="bbb_api.jsp" %>
<?xml version="1.0" ?>

<%
String reqIP=request.getHeader("x-forwarded-for");
String locIP=request.getLocalAddr();
%>


<% if (request.getParameter("command").equals("isRunning")){ %>
<response>
	<running><%= isMeetingRunning(request.getParameter("meetingID")) %></running>
</response>
<% } else if(request.getParameter("command").equals("getRecords")){%>
      <%= getRecordings("English 101,English 102,English 103,English 104,English 105,English 106,English 107,English 108,English 109,English 110")%>
<% } else if(request.getParameter("command").equals("publish")||request.getParameter("command").equals("unpublish")){%>
	<%= setPublishRecordings( (request.getParameter("command").equals("publish")) ? true : false , request.getParameter("recordID"))%>
<% } else if(request.getParameter("command").equals("delete")){%>
	<%= deleteRecordings(request.getParameter("recordID"))%>
<% } %>
