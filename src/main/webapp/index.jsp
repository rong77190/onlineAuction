<html>
<body>
<h2>Hello World!</h2>

<p>
    <html:form action="/loadAction.do" method="POST" enctype="multipart/form-data">
        <html:file property="file"/><br />//对应于ActionFrom的FormFile file属性。

        <html:submit property="submit" value="Submit"/>
        <html:reset value ="Reset"/>
    </html:form>
<p>
    <logic:notEmpty property="fname">
        name:<bean:write property="fname"/>
        size:<bean:write property="size"/>
    </logic:notEmpty>
</p>
</body>
</html>
