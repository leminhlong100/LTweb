<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.LANG}"/>
<fmt:setBundle basename="app" var="lang"/>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");

  if (session.getAttribute("admin") == null) {
    response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
  }
%>
<!-- Start header section -->
<jsp:include page="./header/header.jsp" flush="true"/>
<div class="content-wrapper">
  <div class="container-fluid">

    <div class="row mt-3">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">
             Quản lý quyền người dùng
            </h5>
            <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                  <tr>
                    <th scope="col"><fmt:message key="number"
                                                 bundle="${lang}"></fmt:message></th>
                    <th scope="col">Tên Quyền</th>
                    <th scope="col">Tên tài nguyên</th>
                    <th scope="col">Url Pattern</th>
                    <th scope="col">Thao tác</th>
                    <c:set var="isDisplayed" value="false"/>
                    <c:forEach var="o" items="${sessionScope.admin.roles}">
                      <c:if test="${o.name.equals('admin')}">
                        <c:if test="${!isDisplayed}">
                          <th scope="col">
                            <fmt:message key="act" bundle="${lang}"/>
                          </th>
                          <c:set var="isDisplayed" value="true"/>
                        </c:if>
                      </c:if>
                    </c:forEach>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${requestScope.account.permissions}" var="o" varStatus="stt">
                    <tr>
                      <td scope="row">${stt.index+1}</td>
                      <td>${o.role.name }</td>
                      <td>${o.resource.name }</td>
                      <td>${o.resource.url }</td>
                      <td>${o.action}</td>
                      <td>
                        <c:set var="isDisplayed1" value="false"/>
                        <c:forEach var="role" items="${sessionScope.admin.roles}">
                          <c:if test="${role.name.equals('admin')}">
                            <c:if test="${!isDisplayed1}">
                              <a
                                      href="${pageContext.request.contextPath}/UserDelete?uid=${o.id}">
                                <button class="btn btn-danger">
                                  <fmt:message key="delete"
                                               bundle="${lang}"></fmt:message>
                                </button>
                              </a> <a
                                    href="${pageContext.request.contextPath}/admin-user/UserUpdate?uid=${o.id}">
                              <button class="btn btn-success">
                                <fmt:message key="edit" bundle="${lang}"></fmt:message>
                              </button>
                            </a>
                              <c:set var="isDisplayed1" value="true"/>
                            </c:if>
                          </c:if>
                        </c:forEach></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="overlay toggle-menu"></div>
  </div>
</div>
<jsp:include page="./footer/footer.jsp" flush="true"/>