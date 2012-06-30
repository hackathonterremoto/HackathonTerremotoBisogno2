/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO


/* RIMOZIONE VALORI DEFAULT */

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [DF_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [DF_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_FILE_FLD_FIL_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_FILE] DROP CONSTRAINT [DF_TBL_FILE_FLD_FIL_ID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_RECAPITO_FLD_REC_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_RECAPITO] DROP CONSTRAINT [DF_TBL_RECAPITO_FLD_REC_ID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_OGG_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [DF_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_OGG_ID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_STA_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [DF_TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_STA_ID]
END

GO




/* RIMOZIONE CHIAVI ESTERNE */

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE]'))
ALTER TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE] DROP CONSTRAINT [FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_FILE]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE]'))
ALTER TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE] DROP CONSTRAINT [FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_FILE]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO]'))
ALTER TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_RIFERIMENTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO]'))
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO] DROP CONSTRAINT [FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_RIFERIMENTO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO]'))
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO] DROP CONSTRAINT [FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_RECAPITO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO]'))
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO] DROP CONSTRAINT [FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_RECAPITO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO]'))
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO] DROP CONSTRAINT [FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO]'))
ALTER TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO] DROP CONSTRAINT [FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO]
GO




/* RIMOZIONE TABELLE */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_SEGNALAZIONE_PRELIMINARE_DANNO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_FILE]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_FILE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RIFERIMENTO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_RIFERIMENTO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_RECAPITO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_RECAPITO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]
GO




/* CREAZIONE TABELLE */

--/* OGGETTO SEGNALAZIONE PRELIMINARE DANNO */
--CREATE TABLE dbo.TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO
--	(
--	FLD_STA_ID uniqueidentifier NOT NULL,
--	FLD_STA_NOME varchar(100) NOT NULL
--	)  ON [PRIMARY]
--GO
--DECLARE @v sql_variant 
--SET @v = N'ID'
--EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_STA_ID'
--GO
--DECLARE @v sql_variant 
--SET @v = N'NOME'
--EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_STA_NOME'
--GO
--ALTER TABLE dbo.TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
--	DF_TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_STA_ID DEFAULT (newid()) FOR FLD_STA_ID
--GO
--ALTER TABLE dbo.TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
--	PK_TBL_STATO_SEGNALAZIONE_PRELIMINARE_DANNO PRIMARY KEY CLUSTERED 
--	(
--	FLD_STA_ID
--	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--GO

/* OGGETTO SEGNALAZIONE PRELIMINARE DANNO */
CREATE TABLE dbo.TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_OGG_ID uniqueidentifier NOT NULL,
	FLD_OGG_NOME varchar(100) NOT NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_OGG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'NOME'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_OGG_NOME'
GO

ALTER TABLE dbo.TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	DF_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_OGG_ID DEFAULT (newid()) FOR FLD_OGG_ID
GO

ALTER TABLE dbo.TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	PK_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO PRIMARY KEY CLUSTERED 
	(
	FLD_OGG_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

/* RECAPITO */
CREATE TABLE dbo.TBL_RECAPITO
	(
	FLD_REC_ID uniqueidentifier NOT NULL,
	FLD_REC_INDIRIZZO varchar(250) NOT NULL,
	FLD_REC_LOCALITA varchar(250) NOT NULL,
	FLD_REC_PROVINCIA varchar(2) NOT NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_RECAPITO', N'COLUMN', N'FLD_REC_ID'
GO
DECLARE @v sql_variant 
SET @v = N'INDIRIZZO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_RECAPITO', N'COLUMN', N'FLD_REC_INDIRIZZO'
GO
DECLARE @v sql_variant 
SET @v = N'LOCALITA'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_RECAPITO', N'COLUMN', N'FLD_REC_LOCALITA'
GO
DECLARE @v sql_variant 
SET @v = N'PROVINCIA'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_RECAPITO', N'COLUMN', N'FLD_REC_PROVINCIA'
GO
ALTER TABLE dbo.TBL_RECAPITO ADD CONSTRAINT
	DF_TBL_RECAPITO_FLD_REC_ID DEFAULT (newid()) FOR FLD_REC_ID
GO
ALTER TABLE dbo.TBL_RECAPITO ADD CONSTRAINT
	PK_TBL_RECAPITO PRIMARY KEY CLUSTERED 
	(
	FLD_REC_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

/* RIFERIMENTO */
CREATE TABLE dbo.TBL_RIFERIMENTO
	(
	FLD_RIF_ID uniqueidentifier NOT NULL,
	FLD_RIF_NOMINATIVO varchar(100) NOT NULL,
	FLD_RIF_TELEFONO varchar(100) NULL,
	FLD_RIF_EMAIL varchar(100) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TBL_RIFERIMENTO ADD CONSTRAINT
	PK_TBL_RIFERIMENTO PRIMARY KEY CLUSTERED 
	(
	FLD_RIF_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

/* FILE */
CREATE TABLE dbo.TBL_FILE
	(
	FLD_FIL_ID uniqueidentifier NOT NULL,
	FLD_FIL_NOME varchar(100) NOT NULL,
	FLD_FIL_ESTENSIONE varchar(10) NOT NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'NOME'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_FILE', N'COLUMN', N'FLD_FIL_NOME'
GO
DECLARE @v sql_variant 
SET @v = N'ESTENSIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_FILE', N'COLUMN', N'FLD_FIL_ESTENSIONE'
GO
ALTER TABLE dbo.TBL_FILE ADD CONSTRAINT
	DF_TBL_FILE_FLD_FIL_ID DEFAULT (newid()) FOR FLD_FIL_ID
GO
ALTER TABLE dbo.TBL_FILE ADD CONSTRAINT
	PK_TBL_FILE PRIMARY KEY CLUSTERED 
	(
	FLD_FIL_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

/* SEGNALAZIONE PRELIMINARE DANNO */
CREATE TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_SEG_ID uniqueidentifier NOT NULL,
	FLD_OGG_ID uniqueidentifier NOT NULL,
	FLD_SEG_DATA_CREAZIONE datetime NOT NULL,
	FLD_SEG_DEFINITIVO bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	DF_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID DEFAULT (newid()) FOR FLD_SEG_ID
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	DF_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_DEFINITIVO DEFAULT 0 FOR FLD_SEG_DEFINITIVO
GO
DECLARE @v sql_variant 
SET @v = N'ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_SEG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ID OGGETTO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_OGG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'DATA CREAZIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_SEG_DEFINITIVO'
GO
DECLARE @v sql_variant 
SET @v = N'DEFINITIVO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_SEG_DATA_CREAZIONE'
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	PK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO PRIMARY KEY CLUSTERED 
	(
	FLD_SEG_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO FOREIGN KEY
	(
	FLD_OGG_ID
	) REFERENCES dbo.TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_OGG_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

/* SEGNALAZIONE PRELIMINARE DANNO RECAPITO */
CREATE TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO
	(
	FLD_SEG_ID uniqueidentifier NOT NULL,
	FLD_REC_ID uniqueidentifier NOT NULL,
	FLD_SER_ORDINE int NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID SEGNALAZIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO', N'COLUMN', N'FLD_SEG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ID RECAPITO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO', N'COLUMN', N'FLD_REC_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ORDINE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO', N'COLUMN', N'FLD_SER_ORDINE'
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO ADD CONSTRAINT
	PK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO PRIMARY KEY CLUSTERED 
	(
	FLD_SEG_ID,
	FLD_REC_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO ADD CONSTRAINT
	FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO FOREIGN KEY
	(
	FLD_SEG_ID
	) REFERENCES dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_SEG_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO ADD CONSTRAINT
	FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RECAPITO_TBL_RECAPITO FOREIGN KEY
	(
	FLD_REC_ID
	) REFERENCES dbo.TBL_RECAPITO
	(
	FLD_REC_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

/* SEGNALAZIONE PRELIMINARE DANNO RIFERIMENTO */
CREATE TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO
	(
	FLD_SEG_ID uniqueidentifier NOT NULL,
	FLD_RIF_ID uniqueidentifier NOT NULL,
	FLD_SEF_ORDINE int NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID SEGNALAZIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO', N'COLUMN', N'FLD_SEG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ID RIFERIMENTO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO', N'COLUMN', N'FLD_RIF_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ORDINE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO', N'COLUMN', N'FLD_SEF_ORDINE'
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO ADD CONSTRAINT
	PK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO PRIMARY KEY CLUSTERED 
	(
	FLD_SEG_ID,
	FLD_RIF_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO ADD CONSTRAINT
	FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO FOREIGN KEY
	(
	FLD_SEG_ID
	) REFERENCES dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_SEG_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO ADD CONSTRAINT
	FK_TBL_SEGNALAZIONE_PRELIMINARE_DANNO_RIFERIMENTO_TBL_RIFERIMENTO FOREIGN KEY
	(
	FLD_RIF_ID
	) REFERENCES dbo.TBL_RIFERIMENTO
	(
	FLD_RIF_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO


/* SEGNALAZIONE PRELIMINARE DANNO DETTAGLIO */
CREATE TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_DET_ID uniqueidentifier NOT NULL,
	FLD_SEG_ID uniqueidentifier NOT NULL,
	FLD_DET_DATA_CREAZIONE datetime NOT NULL,
	FLD_DET_CORPO ntext NULL,
	FLD_DET_ORDINE int NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_DET_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ID SEGNALAZIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_SEG_ID'
GO
DECLARE @v sql_variant 
SET @v = N'DATA CREAZIONE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_DET_DATA_CREAZIONE'
GO
DECLARE @v sql_variant 
SET @v = N'CORPO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_DET_CORPO'
GO
DECLARE @v sql_variant 
SET @v = N'ORDINE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO', N'COLUMN', N'FLD_DET_ORDINE'
GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	DF_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FLD_SEG_ID DEFAULT (newid()) FOR FLD_DET_ID
GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	PK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO PRIMARY KEY CLUSTERED 
	(
	FLD_DET_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO ADD CONSTRAINT
	FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_TBL_SEGNALAZIONE_PRELIMINARE_DANNO FOREIGN KEY
	(
	FLD_SEG_ID
	) REFERENCES dbo.TBL_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_SEG_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO

/* SEGNALAZIONE PRELIMINARE DANNO RECAPITO */
CREATE TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE
	(
	FLD_DET_ID uniqueidentifier NOT NULL,
	FLD_FIL_ID uniqueidentifier NOT NULL,
	FLD_DEF_ORDINE int NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'ID DETTAGLIO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE', N'COLUMN', N'FLD_DET_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ID FILE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE', N'COLUMN', N'FLD_FIL_ID'
GO
DECLARE @v sql_variant 
SET @v = N'ORDINE'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE', N'COLUMN', N'FLD_DEF_ORDINE'
GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE ADD CONSTRAINT
	PK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE PRIMARY KEY CLUSTERED 
	(
	FLD_DET_ID,
	FLD_FIL_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE ADD CONSTRAINT
	FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_FILE FOREIGN KEY
	(
	FLD_FIL_ID
	) REFERENCES dbo.TBL_FILE
	(
	FLD_FIL_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE ADD CONSTRAINT
	FK_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO_FILE_TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO FOREIGN KEY
	(
	FLD_DET_ID
	) REFERENCES dbo.TBL_DETTAGLIO_SEGNALAZIONE_PRELIMINARE_DANNO
	(
	FLD_DET_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO


/* CARRICAMENTO DATI */
INSERT INTO [TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]
           ([FLD_OGG_NOME])
     VALUES
           ('Crepa')
INSERT INTO [TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]
           ([FLD_OGG_NOME])
     VALUES
           ('Crollo')
INSERT INTO [TBL_OGGETTO_SEGNALAZIONE_PRELIMINARE_DANNO]
           ([FLD_OGG_NOME])
     VALUES
           ('Altro')
GO


COMMIT