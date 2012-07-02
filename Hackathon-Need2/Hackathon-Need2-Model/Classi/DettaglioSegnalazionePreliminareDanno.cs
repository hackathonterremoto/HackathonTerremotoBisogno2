using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class DettaglioSegnalazionePreliminareDanno
    {
        #region Campi

        #region Tipi base

        private Guid m_ID;

        private string m_Corpo;
        private DateTime m_DataCreazione;

        #endregion

        #region Entità del dominio

        private SegnalazionePreliminareDanno m_SegnalazionePreliminareDanno;

        #endregion

        #region Collezioni

        private System.Collections.Generic.IList<File> m_Files =
            new System.Collections.Generic.List<File>();

        #endregion

        #endregion

        #region Proprietà

        #region Tipi base

        public virtual Guid ID
        {
            get { return m_ID; }
            set { m_ID = value; }
        }


        public virtual string Corpo
        {
            get { return m_Corpo; }
            set { m_Corpo = value; }
        }

        public virtual DateTime DataCreazione
        {
            get { return m_DataCreazione; }
            set { m_DataCreazione = value; }
        }

        #endregion

        #region Entità del dominio

        public virtual File File
        {
            get
            {
                if (m_Files.Count > 0)
                {
                    return m_Files[0];
                }
                else
                {
                    return null;
                }
            }
            set
            {
                if (m_Files.Count > 0)
                {
                    m_Files.RemoveAt(0);
                    m_Files.Insert(0, value);
                }
                else
                {
                    m_Files.Add(value);
                }
            }
        }

        public virtual SegnalazionePreliminareDanno SegnalazionePreliminareDanno
        {
            get { return m_SegnalazionePreliminareDanno; }
            set { m_SegnalazionePreliminareDanno = value; }
        }

        #endregion

        #region Collezioni

        #endregion

        #endregion
    }
}
