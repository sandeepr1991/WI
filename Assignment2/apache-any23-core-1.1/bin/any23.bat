@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\lib

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\apache-any23-api-1.1.jar;"%REPO%"\slf4j-api-1.7.5.jar;"%REPO%"\apache-any23-csvutils-1.1.jar;"%REPO%"\apache-any23-mime-1.1.jar;"%REPO%"\commons-io-2.4.jar;"%REPO%"\sesame-rio-n3-2.7.10.jar;"%REPO%"\apache-any23-encoding-1.1.jar;"%REPO%"\commons-lang-2.6.jar;"%REPO%"\commons-httpclient-3.1.jar;"%REPO%"\commons-logging-1.0.4.jar;"%REPO%"\commons-codec-1.8.jar;"%REPO%"\nekohtml-1.9.20.jar;"%REPO%"\xercesImpl-2.10.0.jar;"%REPO%"\xml-apis-1.4.01.jar;"%REPO%"\jcommander-1.30.jar;"%REPO%"\tika-core-1.4.jar;"%REPO%"\tika-parsers-1.4.jar;"%REPO%"\vorbis-java-tika-0.1.jar;"%REPO%"\netcdf-4.2-min.jar;"%REPO%"\apache-mime4j-core-0.7.2.jar;"%REPO%"\apache-mime4j-dom-0.7.2.jar;"%REPO%"\commons-compress-1.5.jar;"%REPO%"\xz-1.2.jar;"%REPO%"\pdfbox-1.8.1.jar;"%REPO%"\fontbox-1.8.1.jar;"%REPO%"\jempbox-1.8.1.jar;"%REPO%"\bcmail-jdk15-1.45.jar;"%REPO%"\bcprov-jdk15-1.45.jar;"%REPO%"\poi-3.8.jar;"%REPO%"\poi-scratchpad-3.8.jar;"%REPO%"\poi-ooxml-3.8.jar;"%REPO%"\poi-ooxml-schemas-3.8.jar;"%REPO%"\xmlbeans-2.3.0.jar;"%REPO%"\dom4j-1.6.1.jar;"%REPO%"\geronimo-stax-api_1.0_spec-1.0.1.jar;"%REPO%"\tagsoup-1.2.1.jar;"%REPO%"\asm-debug-all-4.1.jar;"%REPO%"\isoparser-1.0-RC-1.jar;"%REPO%"\aspectjrt-1.6.11.jar;"%REPO%"\metadata-extractor-2.6.2.jar;"%REPO%"\xmpcore-5.1.2.jar;"%REPO%"\boilerpipe-1.1.0.jar;"%REPO%"\rome-0.9.jar;"%REPO%"\jdom-1.0.jar;"%REPO%"\vorbis-java-core-0.1.jar;"%REPO%"\juniversalchardet-1.0.3.jar;"%REPO%"\sesame-model-2.7.10.jar;"%REPO%"\sesame-util-2.7.10.jar;"%REPO%"\sesame-rio-api-2.7.10.jar;"%REPO%"\sesame-rio-turtle-2.7.10.jar;"%REPO%"\sesame-rio-datatypes-2.7.10.jar;"%REPO%"\sesame-rio-languages-2.7.10.jar;"%REPO%"\sesame-rio-rdfxml-2.7.10.jar;"%REPO%"\sesame-rio-ntriples-2.7.10.jar;"%REPO%"\sesame-rio-trix-2.7.10.jar;"%REPO%"\sesame-repository-sail-2.7.10.jar;"%REPO%"\sesame-sail-api-2.7.10.jar;"%REPO%"\sesame-queryparser-api-2.7.10.jar;"%REPO%"\sesame-queryalgebra-model-2.7.10.jar;"%REPO%"\sesame-query-2.7.10.jar;"%REPO%"\sesame-sail-memory-2.7.10.jar;"%REPO%"\sesame-sail-inferencer-2.7.10.jar;"%REPO%"\sesame-queryparser-serql-2.7.10.jar;"%REPO%"\sesame-queryalgebra-evaluation-2.7.10.jar;"%REPO%"\sesame-repository-sparql-2.7.10.jar;"%REPO%"\sesame-queryparser-sparql-2.7.10.jar;"%REPO%"\sesame-queryresultio-sparqlxml-2.7.10.jar;"%REPO%"\sesame-http-client-2.7.10.jar;"%REPO%"\sesame-http-protocol-2.7.10.jar;"%REPO%"\sesame-queryresultio-api-2.7.10.jar;"%REPO%"\sesame-repository-api-2.7.10.jar;"%REPO%"\semargl-sesame-0.6.1.jar;"%REPO%"\semargl-core-0.6.1.jar;"%REPO%"\semargl-rdfa-0.6.1.jar;"%REPO%"\semargl-rdf-0.6.1.jar;"%REPO%"\jsonld-java-sesame-0.5.0.jar;"%REPO%"\jsonld-java-0.5.0.jar;"%REPO%"\jackson-core-2.3.3.jar;"%REPO%"\jackson-databind-2.3.3.jar;"%REPO%"\jackson-annotations-2.3.0.jar;"%REPO%"\httpclient-cache-4.2.5.jar;"%REPO%"\httpclient-4.2.5.jar;"%REPO%"\httpcore-4.2.4.jar;"%REPO%"\jcl-over-slf4j-1.7.5.jar;"%REPO%"\commons-csv-1.0-SNAPSHOT-rev1148315.jar;"%REPO%"\metainf-services-1.5.jar;"%REPO%"\apache-any23-core-1.1.jar
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% -Xms500m -Xmx500m -XX:PermSize=128m -XX:-UseGCOverheadLimit -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="any23" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" org.apache.any23.cli.ToolRunner %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
