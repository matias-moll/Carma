/*----------------------------------------------------------------------------
//                 TNG Software Script Generator (Tablas)                     
//----------------------------------------------------------------------------
// Fecha              : 25/07/2020 18:48
// Base de Datos      : TNGS_Carm
// Tabla              : TipoVend
//----------------------------------------------------------------------------
// � 1999-2020 by TNG Software                                      Gndr 5.20
//---------------------------------------------------------------------------*/

/* ***************************************************************************
/  Atencion!!!
/     Este archivo fue generado por un programa en forma autom�tica. Cualquier
/     modificaci�n que se realize sobre �l se perder� en la pr�xima
/     regeneraci�n.
/  **************************************************************************/

/*-------------------------------------------------*/
/* Selecciono la base en la que se creara la tabla */
/*-------------------------------------------------*/

use TNGS_Carm
go

/*-----------------------------------*/
/* Crea la tabla en la base indicada */
/*-----------------------------------*/

print 'Tabla: TipoVend'

if exists (select * from sysobjects where id = object_id('dbo.TipoVend'))
begin
   print '   - Borrando la vieja tabla'
   drop table dbo.TipoVend
end
go

print '   - Creando la nueva tabla'

create table TipoVend
   (
      tvn_rcd_cod tngs_codigo_r,
      tvn_cd1_nivel tngs_codigo_1,
      tvn_des_des tngs_descripcion,
      tvn_nro_vtasminimas tngs_numero,
      tvn_nro_reservasmax tngs_numero,
      tvn_cd1_vemayor tngs_codigo_1,
      instante tngs_fecyhor,
      deleted tngs_borrado,
      usuario tngs_nombre,
      version tngs_numero,
      constraint TipoVend_pk primary key clustered
      (
         tvn_rcd_cod
      )
   )
go

print '   - Asignando permisos a la nueva tabla'

grant select on TipoVend to tngsqbe

print ' '
go

/*--------------------------------------------------------------------------
// Fin del script de creacion de la tabla: TipoVend
//--------------------------------------------------------------------------*/
