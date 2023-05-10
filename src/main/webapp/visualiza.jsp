<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/visualiza.css">
    <title>Ejemplo MVC</title>
</head>
<body>
<div class="card">
    <h1 class="titulo">Datos del cliente</h1>
    <div class="container">
        <div><strong>Nombre: </strong>${nombre}</div>
        <div><strong>DNI: </strong>${dni}</div>
        <form method="POST" action="${pageContext.request.contextPath}/api/clientes/${dni}">
            <input type="submit" class="btn btn-danger" value="Borrar cliente">
        </form>
        <a class="enlace" href="${pageContext.request.contextPath}/api/clientes/alta">Volver al formulario</a>
    </div>
</div>
</body>
</html>
