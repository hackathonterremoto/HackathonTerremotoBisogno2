using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.Model
{
    public class File
    {
        #region Campi

        private Guid m_ID;

        private string m_Nome;
        private string m_Estensione;

        #region Tipi base

        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion

        #region Proprietà

        #region Tipi base

        public virtual string Nome
        {
            get { return m_Nome; }
            set { m_Nome = value; }
        }

        public virtual string Estensione
        {
            get { return m_Estensione; }
            set { m_Estensione = value; }
        }

        public virtual Guid ID
        {
            get { return m_ID; }
            set { m_ID = value; }
        }

        #endregion

        #region Entità del dominio

        #endregion

        #region Collezioni

        #endregion

        #endregion


    }
}
