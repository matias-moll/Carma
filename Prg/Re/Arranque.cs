using System;
using System.Resources;
using System.Windows.Forms;
using System.Drawing;
using System.Diagnostics;
using System.Reflection;
using System.IO;
using System.Threading;
using TNGS.NetRoutines;
using TNGS.NetApp;
using Sima;
using Carm.Shr;

namespace Carm.Re
{
    //----------------------------------------------------------------------------
    //                         TNG Software PRG Generator
    //----------------------------------------------------------------------------
    // Fecha                    : 27/05/2013 18:25
    // Sistema                  : Sima
    // Programa                 : Reservas y Entrevistas
    //----------------------------------------------------------------------------
    // � 1996-2013 by TNG Software                                      Gndr 5.00
    //----------------------------------------------------------------------------

    //****************************************************************************
    // Atencion!!!
    //    Esta clase fue generada por un programa en forma autom�tica. Cualquier
    //    modificaci�n que se realize sobre ella se perder� en la pr�xima
    //    regeneraci�n.
    //****************************************************************************


    /// <summary>
    /// Clase que contiene el Punto de arranque del sistema
    /// </summary>
    public sealed partial class Arranque
    {
        /// <summary>
        /// Metodo que se ejecuta antes del App.Init
        /// </summary>
        /// <returns>T- Todo OK / F- Cancelar el programa</returns>
        public static bool PreInit()
        {
            App.TitleWithBuild = false;

            // Todo ok
            return true;
        }

        /// <summary>
        /// Metodo que se ejecuta antes del App.Run
        /// </summary>
        /// <returns>T- Todo OK / F- Cancelar el programa</returns>
        public static bool PreRun()
        {
            PrgRuts.MakeAboutInfo();
            // Todo ok
            return true;
        }

    }
}
