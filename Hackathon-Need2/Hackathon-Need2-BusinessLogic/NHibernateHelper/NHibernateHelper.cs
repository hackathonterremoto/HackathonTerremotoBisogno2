using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hackathon.Need2.BusinessLogic
{
    public sealed class NHibernateHelper
    {
        private const string CurrentSessionKey = "nhibernate.current_session";

        private static readonly NHibernate.ISessionFactory m_ISessionFactory;

        private static NHibernate.ISessionFactory GetFactory()
        {
            NHibernate.ISessionFactory aISessionFactory = null;

            NHibernate.Cfg.Configuration aConfiguration = new NHibernate.Cfg.Configuration();

            if (aConfiguration == null)
            {
                throw new InvalidOperationException("La configurazione di NHibernate non è disponibile.");
            }

            aConfiguration.Configure();
            aISessionFactory = aConfiguration.BuildSessionFactory();

            if (aISessionFactory == null)
            {
                throw new InvalidOperationException("Impossibile creare l'oggetto NHibernate.ISessionFactory.");
            }

            return aISessionFactory;
        }

        static NHibernateHelper()
        {
            if (m_ISessionFactory == null)
            {
                m_ISessionFactory = GetFactory();
            }
        }



        public static NHibernate.ISession GetCurrentSession(System.Web.HttpContext HttpContext)
        {
            try
            {
                NHibernate.ISession aNHibernateSession = HttpContext.Items[CurrentSessionKey] as NHibernate.ISession;
                return aNHibernateSession;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static NHibernate.ISession GetOrCreateCurrentSession()
        {
            System.Web.HttpContext aHttpContext = System.Web.HttpContext.Current;

            if (aHttpContext != null)
            {
                return GetOrCreateCurrentSession(aHttpContext);
            }
            else
            {
                return m_ISessionFactory.OpenSession();
            }
        }

        public static NHibernate.ISession GetOrCreateCurrentSession(System.Web.HttpContext HttpContext)
        {
            NHibernate.ISession aNHibernateSession = GetCurrentSession(HttpContext);

            if (aNHibernateSession == null || (aNHibernateSession != null && aNHibernateSession.IsOpen == false))
            {
                aNHibernateSession = CreateCurrentSession(HttpContext);
            }

            return aNHibernateSession;

        }

        public static NHibernate.ISession CreateCurrentSession(
            System.Web.HttpContext HttpContext
            )
        {
            NHibernate.ISession aNHibernateSession = m_ISessionFactory.OpenSession();
            if (HttpContext != null)
            {
                HttpContext.Items[CurrentSessionKey] = aNHibernateSession;
            }
            return aNHibernateSession;
        }


        public static NHibernate.ISession CreateCurrentSession()
        {
            System.Web.HttpContext aHttpContext = System.Web.HttpContext.Current;
            return CreateCurrentSession(aHttpContext);
        }

        public static void DisposeCurrentSession()
        {
            System.Web.HttpContext aHttpContext = System.Web.HttpContext.Current;
            DisposeCurrentSession(aHttpContext);
        }

        public static void DisposeCurrentSession(
            System.Web.HttpContext HttpContext
            )
        {
            if (HttpContext != null)
            {
                try
                {
                    HttpContext.Items[CurrentSessionKey] = null;
                }
                catch (Exception)
                {
                }
            }
        }
    }
}
