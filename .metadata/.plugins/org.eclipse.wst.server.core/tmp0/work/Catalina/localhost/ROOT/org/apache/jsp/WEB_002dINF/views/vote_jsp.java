/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.76
 * Generated at: 2024-01-19 11:14:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class vote_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(8);
    _jspx_dependants.put("/WEB-INF/views/./includes/header.jsp", Long.valueOf(1702899521744L));
    _jspx_dependants.put("/WEB-INF/views/./includes/footer.jsp", Long.valueOf(1702899388456L));
    _jspx_dependants.put("jar:file:/D:/vote-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Vote/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("jar:file:/D:/vote-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Vote/WEB-INF/lib/jstl-1.2.jar!/META-INF/fmt.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/spring-security-taglibs-5.0.6.RELEASE.jar", Long.valueOf(1700568224554L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1700568222909L));
    _jspx_dependants.put("jar:file:/D:/vote-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Vote/WEB-INF/lib/jstl-1.2.jar!/META-INF/fn.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("jar:file:/D:/vote-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Vote/WEB-INF/lib/spring-security-taglibs-5.0.6.RELEASE.jar!/META-INF/security.tld", Long.valueOf(1528824936000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("	integrity=\"sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<style>\r\n");
      out.write("    .blink {\r\n");
      out.write("        animation: blinker 1s linear infinite;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @keyframes blinker {\r\n");
      out.write("        50% {\r\n");
      out.write("            opacity: 0;\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<ul class=\"nav justify-content-end\">\r\n");
      out.write("    <li class=\"nav-item\">\r\n");
      out.write("    	<a class=\"nav-link disabled\" href=\"#\" id=\"current-time\"></a>\r\n");
      out.write("    </li>\r\n");
      out.write("    <li class=\"nav-item\">\r\n");
      out.write("    <a class=\"nav-link\" href=\"http://www.nec.go.kr\">중앙선거관리위원회</a>\r\n");
      out.write("  	</li>\r\n");
      out.write("   <li class=\"nav-item\">\r\n");
      out.write("    <a class=\"nav-link\" href=\"http://info.nec.go.kr\">선거통계시스템</a>\r\n");
      out.write("  	</li>\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav aria-label=\"breadcrumb\">\r\n");
      out.write("	<ol class=\"breadcrumb\">\r\n");
      out.write("		<li class=\"breadcrumb-item active\">선거 목록</li>\r\n");
      out.write("	</ol>\r\n");
      out.write("</nav>\r\n");
      out.write("<form class=\"row g-3\"  id=\"form\">\r\n");
      out.write("<h1>선거 목록</h1>\r\n");
      out.write("<p class=\"list\"></p>\r\n");
      out.write("</form>\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function () {\r\n");
      out.write("\r\n");
      out.write("	//뒤로가기 문제해결\r\n");
      out.write("	history.replaceState({}, null, null);\r\n");
      out.write("	\r\n");
      out.write("	//역대 선거 출력\r\n");
      out.write("	var key = \"ho5ZzWHhC23tx5jSARHsEQdNvJY0fvloxEjtNOA39cLoKzXVaIuEyFPIwCpGm2uN52UF8PuwJF%2BSaStXbsHTBw%3D%3D\";\r\n");
      out.write("	$.ajax({\r\n");
      out.write("		type: 'get',\r\n");
      out.write("		url: 'https://apis.data.go.kr/9760000/CommonCodeService/getCommonSgCodeList?serviceKey=' + key,\r\n");
      out.write("		data: {numOfRows:100, pageNo:1, resultType:\"json\"},\r\n");
      out.write("		success: function (data) {\r\n");
      out.write("			var list = '';\r\n");
      out.write("			var vnoarr= new Array();\r\n");
      out.write("			var codearr= new Array();\r\n");
      out.write("			var idarr= new Array();\r\n");
      out.write("			var namearr= new Array();\r\n");
      out.write("			list += '<table width=\"100%\" class=\"table table-striped table-bordered table-hover\" id=\"dataTables-example\">';\r\n");
      out.write("			list += '<thead>';\r\n");
      out.write("			list += '<tr>';\r\n");
      out.write("			list += '<th>이름</th>';\r\n");
      out.write("			list += '</tr>';\r\n");
      out.write("			list += '</thead>';\r\n");
      out.write("			list += '<tbody>';\r\n");
      out.write("			\r\n");
      out.write("			for(i=0; i<data.response.body.totalCount; i++){\r\n");
      out.write("				codearr[i] = data.response.body.items.item[i].sgTypecode;\r\n");
      out.write("				idarr[i] = data.response.body.items.item[i].sgId;	\r\n");
      out.write("				namearr[i] = data.response.body.items.item[i].sgName;	\r\n");
      out.write("				list += '<tr class=\"even\">';\r\n");
      out.write("				if(codearr[i] != 0){\r\n");
      out.write("				list += '<td>' + '<a href=\"/district?code='+codearr[i]+'&id='+idarr[i]+'\">' + namearr[i] + '</a></td>';\r\n");
      out.write("				} else {\r\n");
      out.write("					list += '<td><b>' +  namearr[i] + '</b></td>';	\r\n");
      out.write("				}\r\n");
      out.write("				\r\n");
      out.write("				list += '</tr>';\r\n");
      out.write("			\r\n");
      out.write("			}\r\n");
      out.write("\r\n");
      out.write("		\r\n");
      out.write("			list += '</tbody>';\r\n");
      out.write("			list += '</table>';\r\n");
      out.write("			\r\n");
      out.write("			$(\".list\").append(list);\r\n");
      out.write("		}\r\n");
      out.write("	});\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("setInterval(function () {\r\n");
      out.write("      let now = new Date();\r\n");
      out.write("      let year = now.getFullYear();\r\n");
      out.write("      let month = now.getMonth() + 1;\r\n");
      out.write("      let date = now.getDate();\r\n");
      out.write("      let hour = now.getHours();\r\n");
      out.write("      let minute = now.getMinutes();\r\n");
      out.write("      let second = now.getSeconds();\r\n");
      out.write("      let Monthzero = '';\r\n");
      out.write("      let Datezero = '';\r\n");
      out.write("      let Hourzero = '';\r\n");
      out.write("      let Minutezero = '';\r\n");
      out.write("      let Secondzero = '';\r\n");
      out.write("      if (month < 10) {\r\n");
      out.write("        Monthzero += '0'\r\n");
      out.write("      }\r\n");
      out.write("      if (date < 10) {\r\n");
      out.write("        Datezero += '0'\r\n");
      out.write("      }\r\n");
      out.write("      if (hour < 10) {\r\n");
      out.write("        Hourzero += '0'\r\n");
      out.write("      }\r\n");
      out.write("      if (minute < 10) {\r\n");
      out.write("        Minutezero += '0'\r\n");
      out.write("      }\r\n");
      out.write("      if (second < 10) {\r\n");
      out.write("        Secondzero += '0'\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      let time = year + '-' + Monthzero + month + '-' + Datezero + date + ' ' + Hourzero + hour + '<b class=\"blink\">:</b>' + Minutezero + minute + '<b class=\"blink\">:</b>' + Secondzero + second;\r\n");
      out.write("      document.querySelector('#current-time').innerHTML = time;\r\n");
      out.write("    }, 1000);\r\n");
      out.write("  </script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
