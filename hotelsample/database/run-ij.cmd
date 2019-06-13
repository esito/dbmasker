set DERBY_HOME=c:\java\db-derby-10.13.1.1-bin
set CLASSPATH=%DERBY_HOME%\lib\derby.jar;%DERBY_HOME%\lib\derbytools.jar
java -Dderby.ui.codeset=UTF8 org.apache.derby.tools.ij 
