﻿CREATE TABLE AudioCodecs (
  Id varchar(100) NOT NULL,
  CodecName varchar(64) DEFAULT NULL,
  CodecValue varchar(255) DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

CREATE TABLE Effect (
  Id varchar(100) NOT NULL,
  EffectFile varchar(255) DEFAULT NULL,
  Version varchar(32) DEFAULT NULL,
  Price float DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

CREATE TABLE Layer (
  Id varchar(100) NOT NULL,
  IdProject varchar(100) DEFAULT NULL,
  Muted_Showed tinyint DEFAULT NULL,
  Blocked varbinary(MAX)
  ,VersionNum bigint NOT NULL
);

CREATE TABLE Project (
  Id varchar(100) NOT NULL,
  IdUser varchar(100) DEFAULT NULL,
  IdVideoCodec varchar(100) DEFAULT NULL,
  IdAudioCodec varchar(100) DEFAULT NULL,
  Width decimal(10,0) DEFAULT NULL,
  Height decimal(10,0) DEFAULT NULL,
  FPS decimal(10,0) DEFAULT NULL,
  Depth varchar(64) DEFAULT NULL,
  Proportions varchar(32) DEFAULT NULL,
  OptimiseFrames tinyint DEFAULT NULL,
  Quality float DEFAULT NULL,
  AudioFreq varchar(32) DEFAULT NULL,
  AudioChanells varchar(16) DEFAULT NULL,
  AudioBitrate varchar(16) DEFAULT NULL
  ,[Name] varchar(64)
  ,[Description] varchar(255)
  ,VersionNum bigint NOT NULL
);

CREATE TABLE Row (
  Id varchar(100) NOT NULL,
  IdLayer varchar(100) DEFAULT NULL,
  MaterialFile varchar(255) DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

CREATE TABLE RowEffects (
  Id varchar(100) NOT NULL,
  IdRow varchar(100) DEFAULT NULL,
  IdEffect varchar(100) DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

CREATE TABLE [User] (
  Id varchar(100) NOT NULL,
  Email varchar(64) DEFAULT NULL,
  Surname varchar(32) DEFAULT NULL,
  Name varchar(32) DEFAULT NULL,
  Password varchar(64) DEFAULT NULL
);

CREATE TABLE UsersEffects (
  Id varchar(100) NOT NULL,
  IdUser varchar(100) DEFAULT NULL,
  IdEffect varchar(100) DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

CREATE TABLE VideoCodecs (
  Id varchar(100) NOT NULL,
  CodecName varchar(64) DEFAULT NULL,
  CodecValue varchar(255) DEFAULT NULL
  ,VersionNum bigint NOT NULL
);

ALTER TABLE AudioCodecs
  ADD PRIMARY KEY (Id);

ALTER TABLE Effect
  ADD PRIMARY KEY (Id);

ALTER TABLE Project
  ADD PRIMARY KEY (Id);

ALTER TABLE Layer
  ADD
	PRIMARY KEY (Id),
	CONSTRAINT FK_IdProject FOREIGN KEY (IdProject) REFERENCES Project (Id);

ALTER TABLE Row
  ADD PRIMARY KEY (Id),
  CONSTRAINT FK_IdLayer FOREIGN KEY (IdLayer) REFERENCES Layer (Id);

ALTER TABLE RowEffects
  ADD PRIMARY KEY (Id),
  CONSTRAINT FK_IdEffect FOREIGN KEY (IdEffect) REFERENCES Effect (Id),
  CONSTRAINT FK_IdRow FOREIGN KEY (IdRow) REFERENCES Row (Id);

ALTER TABLE [User]
  ADD PRIMARY KEY (Id);

ALTER TABLE UsersEffects
  ADD PRIMARY KEY (Id),
  CONSTRAINT FK_IdUsersEffectsEffect FOREIGN KEY (IdEffect) REFERENCES Effect (Id),
  CONSTRAINT FK_IdUsersEffectsUser FOREIGN KEY (IdUser) REFERENCES [User] (Id);

ALTER TABLE VideoCodecs
  ADD PRIMARY KEY (Id);

ALTER TABLE Project
  ADD
	  CONSTRAINT FK_IdUser FOREIGN KEY (IdUser) REFERENCES [User] (Id),
	  CONSTRAINT FK_IdAudioCodec FOREIGN KEY (IdAudioCodec) REFERENCES AudioCodecs (Id),
	  CONSTRAINT FK_IdVideoCodec FOREIGN KEY (IdVideoCodec) REFERENCES VideoCodecs (Id);