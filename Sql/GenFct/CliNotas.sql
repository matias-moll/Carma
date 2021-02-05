/*----------------------------------------------------------------------------
//                         TNG Software Fcts Generator
//----------------------------------------------------------------------------
// Fecha       : 05/02/2021 12:21
// Sistema     : Carm
// Tabla       : CliNotas
//----------------------------------------------------------------------------
// � 1999-2021 by TNG Software                                      Gndr 5.20
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
--- Funci�n : EstaBorrada
--- </summary>
--- <param name="@nrocliente">Numero del Cliente</param>
--- <param name="@fyhcreada">Fecha y Hora en que fue Creada</param>
---
---////////////////////////////////////////////////////////

print 'Function: CLINOTAS_ESTABORRADA'

if exists (select * from sysobjects where id = object_id('CLINOTAS_ESTABORRADA'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function CLINOTAS_ESTABORRADA
end
go

print '       - Creando la nueva Funci�n'
go

create function CLINOTAS_ESTABORRADA
(
@nrocliente tngs_numero,
@fyhcreada tngs_fecyhor
)
returns char(1)
as
begin

   declare @ret char(1) 
    
   select @ret = case 
                    when ltrim(rtrim(CliNotas.cln_nom_removedor)) = '' then 'N' 
                    else 'S' 
                 end 
     from TNGS_Carm..CliNotas 
     where cln_nro_numcliente = @nrocliente 
   			and cln_fyh_fechayhora = @fyhcreada 
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on CLINOTAS_ESTABORRADA to tngsmodulos
grant execute on CLINOTAS_ESTABORRADA to tngsqbe

print ' '
go

/*--------------------------------------------------------------------------
// Fin del script de creacion de las Funciones de la tabla: CliNotas
//--------------------------------------------------------------------------*/
