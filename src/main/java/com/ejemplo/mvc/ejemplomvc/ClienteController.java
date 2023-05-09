package com.ejemplo.mvc.ejemplomvc;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.View;
import jakarta.mvc.binding.MvcBinding;
import jakarta.ws.rs.*;

import java.util.HashMap;
import java.util.Map;

@Path("/clientes")
@Controller
@ApplicationScoped
public class ClienteController {

    @MvcBinding
    private Map<String, String> clientes = new HashMap<>();
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

    // @DELETE
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
        clientes.put(dni, nombre);
        models.put("clientes", clientes);
        return "/index.jsp";
    }
}
