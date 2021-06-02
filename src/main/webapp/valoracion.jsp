<%-- 
    Document   : valoracion
    Created on : 12-may-2021, 17:21:31
    Author     : DAW2-PROFESOR
--%>

<%@page import="modelo.ValorPorAnio"%>
<%@page import="modelo.Valoracion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="/">DaniCoches</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                
                <li class="nav-item">
                  <a class="nav-link" href="/ServletValoracion">Calculadora de coches</a>
                </li>


              </ul>
              
            </div>
        </nav>
        <br>
        <br>
        <div style="text-align: center">
        <h1>Valoración de Coches</h1>
        <% 
            ArrayList<String> listaAnios = ( ArrayList<String> ) request.getAttribute("listaAnios");
            ArrayList<ValorPorAnio> listaValoraciones = ( ArrayList<ValorPorAnio> ) request.getAttribute("listaValoraciones");

            String nombre=( String ) request.getAttribute("nombre");
           if (nombre==null) {
               nombre="";
           }
           Valoracion miValoracion = ( Valoracion ) request.getAttribute("miValoracion");
            double valorActual=0;
            double precioNuevo=0;
            double precioDesguace=0;
            int anioMat=0;
            if ( miValoracion!=null) {
                valorActual=miValoracion.getValorActual(); 
                precioNuevo=miValoracion.getPrecioNuevo();
                anioMat= miValoracion.getAnioMat();
            }
            
        %>
        <form action="ServletValoracion" method="post">
            <p><label>Nombre:</label><input type="text" value="<%=nombre%>" name="nombre"></p>
            <p><label>Precio Nuevo:</label><input type="text" name="precio_nuevo" value="<%=precioNuevo %>"></p>
            <p><label>Precio Desguace:</label><input type="text" name="precio_desguace" value="${miValoracion.precioDesguace}"></p>
            <p><label>Año matriculación:</label>
                <select name="anioMat">
                    <%

                        for ( String a: listaAnios ){
                            
                          String cadenaSelected="";
                          if ( Integer.parseInt(a)==anioMat){
                              cadenaSelected = " selected ";
                          }
                          out.println("<option value=" + a + cadenaSelected+ ">" + a + "</option>" );
                      }
                       %>
                    
                </select>
            </p>
            <p><input type="submit" value="Valorar"></p>
            <h1>Valor Actual <%=valorActual %></h1>
           <div style="text-align:center;align-content: center;margin-top: 30px;margin-bottom: 30px">
            
               <!--<table border="1">
                <tr>
                    <td>Año</td>
                    <td>Valor</td>
                    
                </tr>
                <%
                   for(int i=0;i<listaAnios.size();i++){
                        
                          
                          out.println("<tr>"+ 
                                        "<td>" + listaAnios.get(i) + "</td>"+
                                        "<td>" + listaValoraciones + "</td>"    
                                     + "</tr>" );
                          
                      }
                   
                %>
                
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>-->
                
                <% if(listaValoraciones!=null){
                    out.print("<table style='border:2px solid blue'>");
                    for( ValorPorAnio v:listaValoraciones){
                        out.print("<tr>"
                                    + "<td>Anio</td>"
                                    + "<td>Precio</td>"
                                +"</tr>"
                                +"<tr>"
                                    + "<td>"+v.getAnio()+"</td>"
                                    + "<td>"+v.getValorAnual()+"</td>"
                                + "</tr>");
                    }
               }%>
            
            </div>
        </form>
        </div>
    </body>
</html>
