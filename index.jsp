<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.sun.jna.platform.win32.Advapi32Util.Account" %>
<%@ page import="com.sun.jna.platform.win32.Advapi32Util" %>
<%@ page import="com.sun.jna.platform.win32.WinNT.PSID" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>System Info Test</title>
</head>
<body>
<%


String currentUserName = Advapi32Util.getUserName();

Account accountByName = Advapi32Util.getAccountByName(currentUserName);
out.println("AccountByName: " + currentUserName);
out.println(" Fqn: " + accountByName.fqn);
out.println(" Domain: " + accountByName.domain);
out.println(" Sid: " + accountByName.sidString);

Account accountBySid = Advapi32Util.getAccountBySid(new PSID(accountByName.sid));
out.println("AccountBySid: " + accountByName.sidString);
out.println(" Fqn: " + accountBySid.fqn);
out.println(" Name: " + accountBySid.name);
out.println(" Domain: " + accountBySid.domain);

%>
<%-- <%
/* Total number of processors or cores available to the JVM */
out.println("Available processors (cores): " + 
    Runtime.getRuntime().availableProcessors()+"<br>");

/* Total amount of free memory available to the JVM */
out.println("Free memory (bytes): " + 
    Runtime.getRuntime().freeMemory()+"<br>");

/* This will return Long.MAX_VALUE if there is no preset limit */
long maxMemory = Runtime.getRuntime().maxMemory();
/* Maximum amount of memory the JVM will attempt to use */
out.println("Maximum memory (bytes): " + 
    (maxMemory == Long.MAX_VALUE ? "no limit" : maxMemory)+"<br>");

/* Total memory currently available to the JVM */
out.println("Total memory available to JVM (bytes): " + 
    Runtime.getRuntime().totalMemory()+"<br>");


/* Get a list of all filesystem roots on this system */
File[] roots = File.listRoots();

/* for(File fi: roots)
{
	out.print(" "+fi.toString()+"<br>");
	out.println();
} */

/* For each filesystem root, print some info */
/* for (File root : roots) {
  out.println("File system root: " + root.getAbsolutePath()+"<br>");
  out.println("Total space (Gbytes): " + (double)root.getTotalSpace()/1024/1024/1024+"<br>");
  out.println("Free space (Gbytes): " + (double)root.getFreeSpace()/1024/1024/1024+"<br>");
  out.println("Usable space (Gbytes): " + (double)root.getUsableSpace()/1024/1024/1024+"<br>");
} */



%> --%>

</body>
</html>