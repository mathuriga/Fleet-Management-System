View : <%=(String)session.getAttribute("view") %>
<%
session.removeAttribute("view");
%>