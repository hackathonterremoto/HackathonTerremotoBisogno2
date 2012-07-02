using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class SegnalazionePreliminareDanno
    {
        #region Campi

        #region Tipi base

        private Guid m_ID;

        private DateTime m_DataCreazione;
        private Boolean m_Definitivo;

        #endregion

        #region Entità del dominio

        private OggettoSegnalazionePreliminareDanno m_OggettoSegnalazione;

        #endregion

        #region Collezioni

        private IList<DettaglioSegnalazionePreliminareDanno> m_Dettagli =
            new System.Collections.Generic.List<DettaglioSegnalazionePreliminareDanno>();
        private System.Collections.Generic.IList<Recapito> m_Recapiti =
            new System.Collections.Generic.List<Recapito>();
        private IList<Riferimento> m_Riferimenti =
            new System.Collections.Generic.List<Riferimento>();

        #endregion

        #endregion

        #region Proprietà

        #region Tipi base

        public virtual Guid ID
        {
            get { return m_ID; }
            set { m_ID = value; }
        }

        public virtual DateTime DataCreazione
        {
            get { return m_DataCreazione; }
            set { m_DataCreazione = value; }
        }

        public virtual Boolean Definitivo
        {
            get { return m_Definitivo; }
            set { m_Definitivo = value; }
        }

        #endregion

        #region Entità del dominio

        public virtual OggettoSegnalazionePreliminareDanno Oggetto
        {
            get { return m_OggettoSegnalazione; }
            set { m_OggettoSegnalazione = value; }
        }

        public virtual Recapito Recapito
        {
            get
            {
                if (m_Recapiti.Count > 0)
                {
                    return m_Recapiti[0];
                }
                else
                {
                    return null;
                }
            }
            set
            {
                if (m_Recapiti.Count > 0)
                {
                    m_Recapiti.RemoveAt(0);
                    m_Recapiti.Insert(0, value);
                }
                else
                {
                    m_Recapiti.Add(value);
                }
            }
        }

        public virtual Riferimento Riferimento
        {
            get
            {
                if (m_Riferimenti.Count > 0)
                {
                    return m_Riferimenti[0];
                }
                else
                {
                    return null;
                }
            }
            set
            {
                if (m_Riferimenti.Count > 0)
                {
                    m_Riferimenti.RemoveAt(0);
                    m_Riferimenti.Insert(0, value);
                }
                else
                {
                    m_Riferimenti.Add(value);
                }
            }
        }

        #endregion

        #region Collezioni

        public virtual IList<DettaglioSegnalazionePreliminareDanno> Dettagli
        {
            get { return m_Dettagli; }
            set { m_Dettagli = value; }
        }

        #endregion

        #endregion
    }
}
