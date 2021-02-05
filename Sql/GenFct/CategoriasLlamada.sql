/*----------------------------------------------------------------------------
//                         TNG Software Fcts Generator
//----------------------------------------------------------------------------
// Fecha       : 05/02/2021 12:21
// Sistema     : Carm
// Tabla       : CategoriasLlamada
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
--- Funci�n : GetTipo
--- </summary>
--- <param name="@tipo">Tipo de Llamada</param>
---
---////////////////////////////////////////////////////////

print 'Function: CATEGORIASLLAMADA_GETTIPO'

if exists (select * from sysobjects where id = object_id('CATEGORIASLLAMADA_GETTIPO'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function CATEGORIASLLAMADA_GETTIPO
end
go

print '       - Creando la nueva Funci�n'
go

create function CATEGORIASLLAMADA_GETTIPO
(
@tipo tngs_codigo_1
)
returns varchar(10)
as
begin

   declare @ret varchar(10) 
    
   select @ret =  case @tipo 
                      when 'E' then 'Entrante' 
                      else 'Saliente' 
                  end 
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on CATEGORIASLLAMADA_GETTIPO to tngsmodulos
grant execute on CATEGORIASLLAMADA_GETTIPO to tngsqbe

print ' '
go

/*--------------------------------------------------------------------------
// Fin del script de creacion de las Funciones de la tabla: CategoriasLlamada
//--------------------------------------------------------------------------*/
