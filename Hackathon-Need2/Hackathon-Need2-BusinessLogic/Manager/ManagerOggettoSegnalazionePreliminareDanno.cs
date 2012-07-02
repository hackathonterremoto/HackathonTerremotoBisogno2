using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Hackathon.Need2.Model;

namespace Hackathon.Need2.BusinessLogic
{
    public partial class Manager
    {
        //#region GetByID

        ///// <summary>
        ///// Questa operazione consente di reperire uno specifico modello di messaggio di posta elettronica
        ///// avente un determinato ID univoco.
        ///// </summary>
        ///// <param name="ID">
        ///// Questo parametro consente di specificare l'ID univoco del modello di messaggio di posta 
        ///// elettronica che si vuole reperire.
        ///// </param>
        ///// <param name="NHibernateSession">
        ///// Questo parametro consente di specificare la sessione NHibernate 
        ///// tramite la quale deve essere eseguita questa operazione.
        ///// </param>
        ///// <returns>
        ///// Il valore restituito consiste in un unico modello di messaggio di posta elettronica
        ///// che risponde ai criteri specificati.
        ///// </returns>
        //public static RPR.Model.Template.ModelloEmail
        //    ModelloEmail_GetByID(
        //        Int32 ID,
        //        NHibernate.ISession NHibernateSession
        //    )
        //{
        //    RPR.Model.Template.ModelloEmail aModelloEmail = null;
        //    try
        //    {
        //        aModelloEmail =
        //            NHibernateSession.Get<RPR.Model.Template.ModelloEmail>(ID);
        //    }
        //    catch (Exception)
        //    {
        //    }

        //    return aModelloEmail;
        //}

        ///// <summary>
        ///// Questa operazione consente di reperire uno specifico modello di messaggio di posta elettronica
        ///// avente un determinato ID univoco.
        ///// </summary>
        ///// <param name="ID">
        ///// Questo parametro consente di specificare l'ID univoco del modello di messaggio di posta 
        ///// elettronica che si vuole reperire.
        ///// </param>
        ///// <returns>
        ///// Il valore restituito consiste in un unico modello di messaggio di posta elettronica
        ///// che risponde ai criteri specificati.
        ///// </returns>
        //public static RPR.Model.Template.ModelloEmail
        //    ModelloEmail_GetByID(
        //        Int32 ID
        //    )
        //{
        //    RPR.Model.Template.ModelloEmail aModelloEmail;
        //    NHibernate.ISession aNHibernateSession = RPR.NHibernateHelper.NHibernateHelper.GetCurrentSession();

        //    aModelloEmail =
        //        ModelloEmail_GetByID(
        //            ID,
        //            aNHibernateSession
        //            );

        //    aNHibernateSession.Close();

        //    return aModelloEmail;
        //}

        //#endregion

        #region QueryGenerators

        /// <summary>
        /// Questa operazione consente di generare una query HQL che consente di reperire 
        /// una lista di modelli di messaggi di posta elettronica.
        /// </summary>
        /// <param name="NHibernateSession">
        /// Questo parametro consente di specificare la sessione NHibernate tramite la quale deve 
        /// essere eseguita questa operazione.
        /// </param>
        /// <returns>
        /// Il valore restituito consiste in una query HQL per la selezione di un elenco di 
        /// tipi di modelli di messaggi di posta elettronica.
        /// </returns>
        protected static NHibernate.IQuery
            OggettiSegnalazionePreliminareDanno_Query_Generator_Get(
                NHibernate.ISession NHibernateSession
            )
        {
            NHibernate.IQuery aIQuery = null;

            System.Text.StringBuilder query = new System.Text.StringBuilder();

            query.Append("SELECT o ");
            query.Append("FROM Hackathon.Need2.Model.OggettoSegnalazionePreliminareDanno o ");

            query.Append("ORDER BY o.Nome");

            aIQuery = NHibernateSession.CreateQuery(query.ToString());
            aIQuery.SetResultTransformer(new NHibernate.Transform.DistinctRootEntityResultTransformer());

            return aIQuery;
        }

        #endregion

        #region GetAll

        /// <summary>
        /// Questa operazione consente di reperire una lista completa di tutti i modelli 
        /// di messaggio di posta elettronica.
        /// </summary>
        /// <returns>
        /// Il valore restituito consiste in un elenco di modelli di messaggio di posta elettronica.
        /// </returns>
        public static System.Collections.Generic.IList<OggettoSegnalazionePreliminareDanno>
            OggettiSegnalazionePreliminareDanno_GetAll()
        {
            System.Collections.Generic.IList<OggettoSegnalazionePreliminareDanno>
                sOggettoSegnalazionePreliminareDanno;

            NHibernate.ISession NHibernateSession = NHibernateHelper.GetOrCreateCurrentSession();

            NHibernate.IQuery aIQuery = OggettiSegnalazionePreliminareDanno_Query_Generator_Get(
                NHibernateSession
                );

            sOggettoSegnalazionePreliminareDanno =
                aIQuery.List<OggettoSegnalazionePreliminareDanno>();

            return sOggettoSegnalazionePreliminareDanno;
        }

        #endregion

    }
}
