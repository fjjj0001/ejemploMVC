package com.ejemplo.mvc.ejemplomvc;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.binding.MvcBinding;
import jakarta.ws.rs.*;

import java.util.HashMap;
import java.util.Map;

@Path("/clientes")
@Controller
@ApplicationScoped
public class ClienteController {

    @MvcBinding
    private final Map<String, String> clientes = new HashMap<>();
    @Inject
    Models models;

    @GET
    @Path("/alta")
    public String volver(){
        models.put("clientes", clientes);
        return "/index.jsp";
    }

    @GET
    @Path("{dni}")
    public String muestraCliente(@PathParam("dni") String dni){
        String nombre = clientes.get(dni);
        models.put("dni", dni);
        models.put("nombre", nombre);
        return "/visualiza.jsp";
    }

    @POST
    @Path("{dni}")
    public String borraCliente(@PathParam("dni") String dni){
        clientes.remove(dni);
        models.put("clientes", clientes);
        return "/index.jsp";
    }
    @POST
    @Path("/alta")
    public String altaCliente( @FormParam("nombre") String nombre, @FormParam("dni") String dni) {

        Map<String, String> errores = new HashMap<>();

        if(!nombre.matches("^.{3,40}$")){
            errores.put("nombre", "El nombre debe tener una longitud entre 3 y 40 caracteres");
        }

        if(!dni.matches("\\d{7,8}(-?[A-Z])?")){
            errores.put("dni", "El formato del DNI no es válido");
        }

        if(clientes.containsKey(dni)){
            errores.put("dni", "Este DNI ya está en uso");
        }

        if (errores.size() > 0){

            models.put("nombre", nombre);
            models.put("dni", dni);
            models.put("errores", errores);
            models.put("clientes", clientes);

        } else {

            clientes.put(dni, nombre);
            models.put("clientes", clientes);

        }
        return "/index.jsp";
    }
}
