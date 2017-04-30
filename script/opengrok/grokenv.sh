## Java

export JAVA_HOME=/opt/jdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin


## opengrok
export OPENGROK_APP_SERVER=Tomcat
export OPENGROK_TOMCAT_BASE=/opt/tomcat
export OPENGROK_INSTANCE_BASE=/opt/opengrok
export SRC_ROOT=/home/grok/src
export DATA_ROOT=/home/grok/data
# export LANG=zh_CN.gb2312
