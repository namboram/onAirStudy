/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.57
 * Generated at: 2020-10-18 19:59:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pre_002dtest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1599824644000L));
    _jspx_dependants.put("jar:file:/C:/GitRepo/final/onAirStudy/onAirStudy/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/fn.tld", Long.valueOf(1425946270000L));
    _jspx_dependants.put("jar:file:/C:/GitRepo/final/onAirStudy/onAirStudy/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/fmt.tld", Long.valueOf(1425946270000L));
    _jspx_dependants.put("jar:file:/C:/GitRepo/final/onAirStudy/onAirStudy/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
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

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <title>모의 시험- Pre-test</title>\r\n");
      out.write("\r\n");
      out.write("\t<script src=\"http://code.jquery.com/jquery-latest.min.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"\r\n");
      out.write("    integrity=\"sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z\" crossorigin=\"anonymous\">\r\n");
      out.write("  <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"\r\n");
      out.write("    integrity=\"sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"\r\n");
      out.write("    integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"\r\n");
      out.write("    integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/css/invitation.css\">\r\n");
      out.write("    <style>\r\n");
      out.write("        .tq_G {\r\n");
      out.write("            columns: 2;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"pre_test\" style=\"margin-bottom: 0;\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"col-sm\" style=\"background-color: white;\">\r\n");
      out.write("                <div>\r\n");
      out.write("                    <div>\r\n");
      out.write("                        <h2>Pre-test</h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div align=\"center\">\r\n");
      out.write("                        <div class=\"col-lg-4\" style=\"background-color: #F6E5FE; border-radius: 15px; \">\r\n");
      out.write("                            <h4 style=\"text-align: center;\">오늘의 Test</h4>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"tq_G\">\r\n");
      out.write("                        <for:each items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${list}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" var=\"\">\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"col-lg\" style=\" background-color: #FFF0F0; border-radius: 15px; padding: 15px;\">\r\n");
      out.write("                                <textarea id=\"question_box_g\" rows=\"5\" class=\"col-lg\" readonly> </textarea>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <input type=\"button\" class=\"btn btn-outline-dark btn-sm\" id=\"choice1\" value=\"1\"\r\n");
      out.write("                                    style=\"margin-right: 10px; border-radius: 50%;\"> <input type=\"text\"\r\n");
      out.write("                                    class=\"col-lg-10\" style=\"border-radius: 15px;\" readonly>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <input type=\"button\" class=\"btn btn-outline-dark btn-sm\" id=\"choice1\" value=\"2\"\r\n");
      out.write("                                    style=\"margin-right: 10px; border-radius: 50%;\"> <input type=\"text\"\r\n");
      out.write("                                    class=\"col-md-10\" style=\"border-radius: 15px; margin-top: 15px;\" readonly>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <input type=\"button\" class=\"btn btn-outline-dark btn-sm\" id=\"choice1\" value=\"3\"\r\n");
      out.write("                                    style=\"margin-right: 10px; border-radius: 50%;\"> <input type=\"text\"\r\n");
      out.write("                                    class=\"col-lg-10\" style=\"border-radius: 15px; margin-top: 15px;\" readonly>\r\n");
      out.write("                                <br>\r\n");
      out.write("                                <input type=\"button\" class=\"btn btn-outline-dark btn-sm\" id=\"choice1\" value=\"4\"\r\n");
      out.write("                                    style=\"margin-right: 10px; border-radius: 50%;\"> <input type=\"text\"\r\n");
      out.write("                                    class=\"col-lg-10\" style=\"border-radius: 15px; margin-top: 15px;\" readonly>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <br>\r\n");
      out.write("                     \r\n");
      out.write("\r\n");
      out.write("                        </for:each>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                    <div align=\"center\">\r\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-outline-primary\" style=\"margin-right: 30px;\"\r\n");
      out.write("                            data-toggle=\"modal\" data-target=\"#myModal_sub_G\">제출하기 </button>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <br>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- The Modal -->\r\n");
      out.write("            <div class=\"modal fade\" id=\"myModal_sub_G\">\r\n");
      out.write("                <div class=\"modal-dialog\">\r\n");
      out.write("                    <div class=\"modal-content\">\r\n");
      out.write("\r\n");
      out.write("                        <!-- Modal Header -->\r\n");
      out.write("                        <div class=\"modal-header\" style=\"color: #E2A182;\">\r\n");
      out.write("                            <h4 class=\"modal-title\">오늘의 Test 제출</h4>\r\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">×</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <!-- Modal body -->\r\n");
      out.write("                        <div class=\"modal-body\">\r\n");
      out.write("                            제출 하시겠습니까?\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <!-- Modal footer -->\r\n");
      out.write("                        <div class=\"modal-footer\">\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-outline\">제출</button>\r\n");
      out.write("                            <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">취소</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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