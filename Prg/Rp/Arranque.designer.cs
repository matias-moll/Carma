#region Usings
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
using TNGS.NetAppSupport;
using Carm;
using Carm.Shr;
#endregion

namespace Carm.Rp
{
    //----------------------------------------------------------------------------
    //                         TNG Software PRG Generator
    //----------------------------------------------------------------------------
    // Fecha                    : 25/07/2020 18:12
    // Sistema                  : Carm
    // Programa                 : Reportes
    //----------------------------------------------------------------------------
    // � 1996-2020 by TNG Software                                      Gndr 5.20
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
        /// Punto de arranque del sistema
        /// </summary>
        [STAThread]
        static void Main() 
        {
            // Creamos el objeto de reporte de errores
            StatMsg l_smResult= new StatMsg();

            try {
                // Verificamos si ya esta ejecut�ndose
                if (App.EnEjecucion) {
                    // Mostramos un aviso y nos vamos
                    MessageBox.Show("Ya existe una versi�n del Reportes en ejecuci�n", "Atenci�n");
                    return;
                }

                // Incializamos recursos
                ResourceManager l_rmApp= new ResourceManager(typeof(Arranque));

                // Habilitamos el estilo XP
                App.EnableXPStyle();

                // Definimos el skin
                TNGSSkin.ChangeSkin(FixedSkins.Office14);

                // Llamamos al PreInit del Shr y del Programa
                if (!SysRuts.PreInit()) return;
                if (!Arranque.PreInit()) return;

#if (!DEBUG)
                // Mostramos la ventana Splash (con la imagen interna del programa)
                App.ShowSplash((Bitmap)(l_rmApp.GetObject("AppSplash")), false, 296, 
                               (Bitmap)(l_rmApp.GetObject("AppSplashMarquee")));
#endif

                // Inicializamos nuestra clase App
                App.Init("Carm", "Rp",
                         FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location),
                         l_rmApp,
                         Application.StartupPath, 
                         ParOptions.LoadParameters,
                         LOGOptions.WithoutLOG,
                         ValidOptions.Validate,
                         ConStrOptions.Read,
                         true,
                         l_smResult);
            }
            catch (Exception l_expData) {
                // Se produjo un error no capturado
                l_smResult.BllError(l_expData);
            }

            if (l_smResult.NOk) {
                // Cerramos la ventana de Splash
                App.CloseSplash();

                // Errores de inicializacion. Mostramos el error
                MsgRuts.AnalizeError(null, l_smResult);
                return;
            }

            try {
                // Creamos la ventana MDI de la aplicacion
                MainFrame l_frmMain= new MainFrame(MFSizes.FREESIZE, 0, false, true, false);

                // Fijamos la imagen de Login/Pasword
                App.FdoLoginPassw= App.Imagen("AppLogPassw");

                // Ejecutamos la funcion que arma la info de About
                PrgRuts.MakeAboutInfo();

                // Llamamos al PreRun del Shr y del Programa
                if (!SysRuts.PreRun()) return;
                if (!Arranque.PreRun()) return;

                // Inicializamos la ventana principal y agregamos el handler para
                // procesar los comandos del menu
                App.MnuCommands += new MnuCommandsEventHandler(Arranque_MnuCommandsMF);

                App.Run(LoginModes.Full,
                        IMenuOptions.MAll,
                        ExitModes.Normal,
                        l_smResult);
            }
            catch (Exception l_expData) {
                // Se produjo un error no capturado
                l_smResult.BllError(l_expData);
            }

            MsgRuts.AnalizeError(null, l_smResult);
        }

        /// <summary>
        /// Handler de los comandos de Menu/Toolbar
        /// </summary>
        public static void Arranque_MnuCommandsMF(object sender, MFOptionEventArgs e)
        {
            // Bloqueamos el menu
            App.LockMenu(true);

            // Procesamos el c�digo 
            switch (e.CmdCode) {
                // *************************************************
                // ** Ejecuci�n autom�tica al inicio del programa
                // **
                case "$$AUTOEXEC$$"  : {SysRuts.AutoExecIni(App.Programa.Codigo); PrgRuts.AutoExec(); SysRuts.AutoExecEnd(App.Programa.Codigo); return;}

                // *************************************************
                // ** Menu: Clientes
                // **
                case "CLCR"          : {new CliCargadores().Show(); return;}
                // **
                case "BAJAS"         : {new CliBajas().Show(); return;}
                // **
                case "RECL"          : {new CliReclamos().Show(); return;}
                // **
                case "RECUP"         : {new CliRecuperos().Show(); return;}
                // **
                case "LOG"           : {new CliLog().Show(); return;}

                // *************************************************
                // ** Menu: Vendedores
                // **
                case "VRES"          : {new VndReservas().Show(); return;}
                // **
                case "VENT"          : {new VndEntrevistas().Show(); return;}
                // **
                case "VLLAM"         : {new VndLlamadas().Show(); return;}
                // **
                case "VVenc"         : {new VndVencidas().Show(); return;}
                // **
                case "VVTAS"         : {new VndVentas().Show(); return;}

                // *************************************************
                // ** Menu: Competencia
                // **
                case "CLOC"          : {new CmpXLocalidad().Show(); return;}
                // **
                case "CCLI"          : {new CmpClientes().Show(); return;}

                // *************************************************
                // ** Menu: Tasa de Uso
                // **
                case "XCLI"          : {new TusXCliente().Show(); return;}
                // **
                case "XTIN"          : {new TusXTipoInst().Show(); return;}

                // *************************************************
                // ** Menu: Secretarias
                // **
                case "LPROG"         : {new LlamadasProgramadas().Show(); return;}

                // *************************************************
                // ** Menu: Ventas
                // **
                case "VTAMES"        : {new Ventas().Show(); return;}
                // **
                case "ABON"          : {new FacturacionAbonos().Show(); return;}

                // *************************************************
                // ** Menu: Historico Abonos
                // **
                case "CLAN"          : {new AjustesAbonosXClienteXAnio().Show(); return;}
                // **
                case "XMES"          : {new AjustesAbonosXMes().Show(); return;}

                // *************************************************
                // ** Menu: Reajustes
                // **
                case "RCLAN"         : {new ReajustesXClienteXAnio().Show(); return;}
                // **
                case "RXMES"         : {new ReajustesXMes().Show(); return;}

                // *************************************************
                // ** Ejecuci�n autom�tica al final del programa
                // **
                case "$$ENDEXEC$$"   : {SysRuts.EndExecIni(App.Programa.Codigo); PrgRuts.EndExec(); SysRuts.EndExecEnd(App.Programa.Codigo); return;}
            }

            // Comando no identificado. Liberamos el menu
            App.LockMenu(false);
            App.HideMsg();
        }
    }
}
