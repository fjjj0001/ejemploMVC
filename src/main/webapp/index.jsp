<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index.css">
  <title>Ejemplo MVC</title>

</head>
<body>
<h1 class="titulo">Formulario de alta de clientes</h1>
<form action="${pageContext.request.contextPath}/api/clientes/alta" method="POST">
  <div class="form-group">
    <div>
      <label>Nombre</label>
      <input name="nombre" class="form-control" type="text" placeholder="Nombre y apellidos">
    </div>
    <div>
      <div>
      <label>DNI</label>
      <input name="dni" class="form-control" type="text" placeholder="DNI"></div>
  <div class="form-row" style="text-align: center">
    <input class="btn btn-primary col-md-2" name="enviar" type="Submit" value="Guardar">
    <input class="btn btn-primary col-md-2" name="enviar" type="Reset" value="Limpiar">
  </div>
  </div>
</form>

<h3>Datos de los clientes</h3>
<table>
  <thead>
  <tr>
    <th>DNI</th>
    <th>Nombre completo</th>
    <th></th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="cliente" items="${clientes}">
    <tr>
      <td ><a href="${pageContext.request.contextPath}/api/clientes/${cliente.key}">${cliente.key}</a></td>
      <td>${cliente.value}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>