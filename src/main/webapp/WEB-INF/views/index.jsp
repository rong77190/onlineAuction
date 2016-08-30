<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<body>
<h2>Hello World!</h2>

<form:form id="inputForm" modelAttribute="student" action="/student/info" method="post"><%--
		<form:hidden path="email" htmlEscape="false" maxlength="255" class="input-xlarge"/>
		<sys:ckfinder input="email" type="files" uploadPath="/mytask" selectMultiple="false"/> --%>
    <%--<sys:message content="${message}"/>--%>
    <div>
        <label>id:</label>
        <div>
            <label>${student.id}</label>
        </div>
    </div>
    <div>
        <label class="control-label">姓名:</label>
        <div class="controls">
            <label class="lbl">${student.name}</label>
        </div>
    </div>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">姓名:</label>--%>
        <%--<div class="controls">--%>
            <%--<form:input path="name" htmlEscape="false" maxlength="50" class="required" readonly="true"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">邮箱:</label>--%>
        <%--<div class="controls">--%>
            <%--<form:input path="email" htmlEscape="false" maxlength="50" class="email"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">电话:</label>--%>
        <%--<div class="controls">--%>
            <%--<form:input path="phone" htmlEscape="false" maxlength="50"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">手机:</label>--%>
        <%--<div class="controls">--%>
            <%--<form:input path="mobile" htmlEscape="false" maxlength="50"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">备注:</label>--%>
        <%--<div class="controls">--%>
            <%--<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">用户类型:</label>--%>
        <%--<div class="controls">--%>
            <%--<label class="lbl">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">用户角色:</label>--%>
        <%--<div class="controls">--%>
            <%--<label class="lbl">${user.roleNames}</label>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="control-group">--%>
        <%--<label class="control-label">上次登录:</label>--%>
        <%--<div class="controls">--%>
            <%--<label class="lbl">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-actions">--%>
        <%--<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>--%>
    <%--</div>--%>
</form:form>
</body>
</html>
