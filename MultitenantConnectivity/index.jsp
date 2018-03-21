<%@page
	import="javax.naming.InitialContext,javax.naming.Context,com.sap.core.connectivity.api.http.HttpDestination,java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SAP Cloud Platform - Multitenant Connectivity Demo Application</title>
</head>

<body>
	<h2>Welcome to SAP Cloud Platform - multitenant connectivity demo application</h2>
	<br></br>

	<%
		try {
			Context context = (Context) new InitialContext()
					.lookup("java:comp/env");

			// In this case you don't need to explicitly use the TenantContext API
			// because the Connectivity service handles the tenancy by itself.
			// The retrieved HttpDestination object will be tenant-specific.
			String destinationName = "search_engine_destination";
			HttpDestination destination = (HttpDestination) context
					.lookup(destinationName);
			out.println("<p><font size=\"5\"> Retreived destination with name <i>"
					+ destination.getName()
					+ "</i> and URI <b>"
					+ destination.getURI() + "</b></font></p>");
		} catch (Exception e) {
			out.println("<b>An exception has been thrown: <i>" + e.getMessage()
					+ "</i></b>");
			out.println(Arrays.toString(e.getStackTrace()));
		}
	%>

</body>
</html>