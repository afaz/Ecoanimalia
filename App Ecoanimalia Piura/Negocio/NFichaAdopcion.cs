﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using App_Ecoanimalia_Piura.Logica;
using App_Ecoanimalia_Piura.Datos;

namespace App_Ecoanimalia_Piura.Negocio
{
    public class NFichaAdopcion
    {

        public int N_asignar_adopcion(Persona persona, Usuario usuario, int estado, string relacion,string observacion,DateTime fecha)
        {
            FichaAdopcion adopcion = new FichaAdopcion();
            adopcion.Persona = persona;
            adopcion.Usuario = usuario;
            adopcion.Estado = estado;
            adopcion.Rel_res = relacion;
            adopcion.Observaciones = observacion;
            adopcion.Fec_adp = fecha;
         


            int band = new DFichaAdopcion().D_registrar_fichaA(adopcion);
            return band;
        }

        public int N_modificar_adopcion(int id, Persona persona, Usuario usuario, int estado, string relacion, string observacion, DateTime fecha)
        {

            FichaAdopcion adopcion = new FichaAdopcion();
            adopcion.Id = id;
            adopcion.Persona = persona;
            adopcion.Usuario = usuario;
            adopcion.Estado = estado;
            adopcion.Rel_res = relacion;
            adopcion.Observaciones = observacion;
            adopcion.Fec_adp = fecha;
            int band = new DFichaAdopcion().D_modificar_fichaA(adopcion);
            return band;
        }

        public int N_eliminar_adopcion(int id)
        {
            FichaAdopcion adopcion = new FichaAdopcion();
            adopcion.Id = id;

            int band = new DFichaAdopcion().D_eliminar_fichaA(adopcion);
            return band;
        }

    }
}
