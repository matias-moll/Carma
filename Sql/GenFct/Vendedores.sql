/*----------------------------------------------------------------------------
//                         TNG Software Fcts Generator
//----------------------------------------------------------------------------
// Fecha       : 01/12/2020 21:33
// Sistema     : Carm
// Tabla       : Vendedores
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
--- Funci�n : CantReservasAct
--- </summary>
--- <param name="@codvend">Codigo del Vendedor</param>
---
---////////////////////////////////////////////////////////

print 'Function: VENDEDORES_CANTRESERVASACT'

if exists (select * from sysobjects where id = object_id('VENDEDORES_CANTRESERVASACT'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function VENDEDORES_CANTRESERVASACT
end
go

print '       - Creando la nueva Funci�n'
go

create function VENDEDORES_CANTRESERVASACT
(
@codvend tngs_codigo_6
)
returns int
as
begin

   declare @ret int 
    
   SELECT @ret = COUNT (*) 
    
       FROM TNGS_Carm..Clientes 
    
       WHERE cli_cd6_codvend = @codvend and cli_cd1_alta = 'N' 
    
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on VENDEDORES_CANTRESERVASACT to tngsmodulos
grant execute on VENDEDORES_CANTRESERVASACT to tngsqbe

print ' '
go

---////////////////////////////////////////////////////////
---
--- <summary>
--- Funci�n : GetFullName
--- </summary>
--- <param name="@codvend">Codigo del Vendedor</param>
---
---////////////////////////////////////////////////////////

print 'Function: VENDEDORES_GETFULLNAME'

if exists (select * from sysobjects where id = object_id('VENDEDORES_GETFULLNAME'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function VENDEDORES_GETFULLNAME
end
go

print '       - Creando la nueva Funci�n'
go

create function VENDEDORES_GETFULLNAME
(
@codvend tngs_codigo_6
)
returns varchar(60)
as
begin

   declare @ret varchar(60) 
    
   select @ret =  rtrim(vnd_des_nombre) + ' '+ vnd_des_apellido 
     from TNGS_Carm..Vendedores 
    
      where vnd_cd6_cod = @codvend 
    
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on VENDEDORES_GETFULLNAME to tngsmodulos
grant execute on VENDEDORES_GETFULLNAME to tngsqbe

print ' '
go

---////////////////////////////////////////////////////////
---
--- <summary>
--- Funci�n : GetJefeVentas
--- </summary>
--- <param name="@codvend">Codigo de Vendedor</param>
---
---////////////////////////////////////////////////////////

print 'Function: VENDEDORES_GETJEFEVENTAS'

if exists (select * from sysobjects where id = object_id('VENDEDORES_GETJEFEVENTAS'))
begin
   print '       - Borrando la vieja Funci�n'
   drop function VENDEDORES_GETJEFEVENTAS
end
go

print '       - Creando la nueva Funci�n'
go

create function VENDEDORES_GETJEFEVENTAS
(
@codvend tngs_codigo_6
)
returns varchar(60)
as
begin

   declare @ret varchar(60) 
    
   select @ret = rtrim(jvt_nom_nombre) + ' '+ jvt_nom_apellido 
     from TNGS_Carm..JefesVentas 
     join TNGS_Carm..Supervisores on sup_cd6_codjefevtas = jvt_cd6_cod 
     join TNGS_Carm..Vendedores on vnd_cd6_codsuperv = sup_cd6_cod 
    
      where vnd_cd6_cod = @codvend 
    
    
   return @ret 

end
go

print '       - Asignando permisos a la Funci�n'

grant execute on VENDEDORES_GETJEFEVENTAS to tngsmodulos
grant execute on VENDEDORES_GETJEFEVENTAS to tngsqbe

print ' '
go

/*--------------------------------------------------------------------------
// Fin del script de creacion de las Funciones de la tabla: Vendedores
//--------------------------------------------------------------------------*/
