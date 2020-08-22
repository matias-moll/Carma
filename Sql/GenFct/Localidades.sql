/*----------------------------------------------------------------------------
//                         TNG Software Fcts Generator
//----------------------------------------------------------------------------
// Fecha       : 22/08/2020 01:48
// Sistema     : Carm
// Tabla       : Localidades
//----------------------------------------------------------------------------
// � 1999-2020 by TNG Software                                      Gndr 5.20
//---------------------------------------------------------------------------*/

/* ***************************************************************************
/  Atencion!!!
/     Este archivo fue generado por un programa en forma autom�tica. Cualquier
/     modificaci�n que se realize sobre �l se perder� en la pr�xima
/     regeneraci�n.
/  **************************************************************************/

/*--------------------------------------------------*/
/* Selecciono la base en la que se crearan las Fcts */
/*--------------------------------------------------*/

use TNGS_Carm
go

---////////////////////////////////////////////////////////
---
--- <summary>
--- Funci�n : GetDesZona
--- </summary>
--- <param name="@codloc">Codigo de Localidad</param>
---
---////////////////////////////////////////////////////////

print 'Function: LOCALIDADES_GETDESZONA'

if exists (select * from sysobjects where id = object_id('LOCALIDADES_GETDESZONA'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function LOCALIDADES_GETDESZONA
end
go

print '       - Creando la nueva Funci�n'
go

create function LOCALIDADES_GETDESZONA
(
@codloc tngs_codigo_e
)
returns varchar (30)
as
begin

    
   declare @ret varchar (30) 
    
   select @ret = zns_des_nombre from TNGS_Carm..Zonas 
    
   join TNGS_Carm..Localidades on loc_rcd_codzona = zns_rcd_cod 
    
   where loc_ecd_codpost = @codloc 
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on LOCALIDADES_GETDESZONA to tngsmodulos
grant execute on LOCALIDADES_GETDESZONA to tngsqbe

print ' '
go

/*--------------------------------------------------------------------------
// Fin del script de creacion de las Funciones de la tabla: Localidades
//--------------------------------------------------------------------------*/
