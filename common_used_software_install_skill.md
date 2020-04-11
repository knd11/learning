[TOC]

# 1. linux mplayer 

- 安装

  用Ctrl+Alt+T或者直接鼠标右键打开一个终端

  输入指令下载安装mplayer

  ```
  $ sudo apt-get install mplayer
  ```

  安装完成后，输入指令,查看是否安装成功。

  ```
  $ mplayer
  ```

  好了，现在，我们就可以找到要播放的视频，查看一下视频所在路径



- 使用

  1.  播放

     ```
     $ mplayer 视频路径
     ```

  2.  快捷键

     ```
     [: 以0.1的步长减速
     ]: 以0.1的步长加速
     shift + [ : 以0.5的步长减速
     shift + ] : 以0.5的步长加速
     ```


# 2. anaconda + opencv + tensorflow

1. 安装anaconda

   在官网下载安装包，然后cd到安装包路径

   ```
   $ bash Anaconda3-5.3.1-Linux-x86_64.sh
   ```

   安装时可同意安装python和vscode

   **测试：** $ anaconda-navigator

2. 安装tensorflow

   anaconda-navigator中新建一个环境，在环境中安装tensorflow

3. 安装opencv

   一定要先安装opencv的依赖库：

   ```
   sudo apt-get install build-essential
   sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
   sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
   ```

   在环境中安装opencv

4. vscode配置

   先新建工作环境，再配置debug，选择当前环境下的python为编译器

5. opencv报错解决

   1. 路径问题

   ```
   cv2.error: OpenCV(3.4.3) /io/opencv/modules/highgui/src/window.cpp:356: error: (-215:Assertion failed) size.width>0 && size.height>0 in function 'imshow'
   ```

   解决：注意路径为/home/cxy/... 

   2. 权限问题

      ```
      Cannot connect to X server :0.0
      ```

      - DISPLAY not set in the environment.
         **Solution**: 

        ```
        $ export DISPLAY=:0.0
        ```

      - Non-Authorised User trying to run the X Application
         **Solution** ( as X owning user, ie: yourself )

        ```
        $ xhost +$HOSTNAME
        ```

# 3. linux Java + IntelliJ

- Java

  1. 下载 Java <a href="https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html">安装包</a>

  2. 解压并移动至/usr/local

     ```
     $ sudo mv jdk-8u231-linux-x64 /usr/local
     ```

  3. 配置环境

     使用如下命令打开~/.bashrc文件

     ```
     $ gedit ~/.bashrc
     ```

     在文件末尾加上Java信息

     ```
     export JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
     export JRE_HOME=${JAVA_HOME}/jre
     export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
     export PATH=${JAVA_HOME}/bin:$PATH
     ```

  4. 使用source命令使配置立即生效

     ```
     $ source ~/.bashrc
     ```

  5. 测试

     ```
     $ java -version
     ```

- IntelliJ

  1. 在官网下载<a href="https://www.jetbrains.com/idea/download/#section=linux">linux安装包</a>

  2. 解压到安装目录

  3. 安装包的bin目录下打开终端，执行：
  
     ```
      sh ./idea.sh
     ```
  
  4. <a href="https://zhile.io/2018/08/17/jetbrains-license-server-crack.html">激活</a>
  
     <a href="https://www.jetbrains.com/shop/eform/students">学生免费激活使用 </a>
  
  5. 设置部分自己视情况而定
  
     
  

**IntelliJ 配置**

- 鼠标滚轮放大字体

  Editor --> Genneral --> Mouse -->change fontsize(Zoom)....

- 鼠标悬浮提示

  Editor --> Genneral -->Show quick documentation on mouse move

- 自动导包

  Insert imports on paste:All

  Editor --> Genneral -->auto Import -->选择：

  Add unambiguous imports on the fly
  Optimize imports on the fly(for current project)

- 显示分隔符

  Editor --> Genneral -->Apperence-->Show method separators

- 设置取消单行显示tabs的操作

  Editor --> Genneral -->Editor Tabs -->取消勾选Show tabs in one row

- 注解

  Editor  -->File and Code Templates --> Include -->File Header -->输入：

  ```java
  /**
      @author cxy
      @create ${YEAR}-${MONTH}-${DAY}-${TIME}
  */
  ```

- 更改编码方式

  Editor --> Genneral -->Code Style -->File Encoding-->全部改为UTF-8

  勾选Transparent native-to-ascii conversion

- 自动编译

  Build,Execution,Deployment --> Compiler -->勾选

  Compile independent modules in parallel 
  Rebuild module on dependency change



# 4. 用git上传文件到Github

1. 在github中新建一个repositories，并命名

2. 安装git，ubantu上自带，若没有则：

   ```
   $ sudo apt-get install git
   ```

3. 生成密钥

   ```
   $ ssh-keygen -t rsa -C "946704740@qq.com"
   ```

   之后会要求确认路径和输入密码，默认一路回车就行。

4. 成功的话会在～/下生成.ssh文件夹，按住ctrl+h可以显示隐藏文件夹，点进去，打开id_rsa.pub，复制里面的key。

5. 回到github，进入Account Setting，左边选择SSH Keys，Add SSH，title随便填，粘贴key.

6. 在将本地仓库上传到github之前，需要设置username和email，因为github每次commit都会记录他们。

   ```
   $ git config --global user.name "onlyou2030"
   $ git config --global user.email 529647632@qq.com
   ```

7. cd到要上传的仓库路径，添加远程地址

   ```
   git remote add origin git@github.com:yourName/yourRepo.git
   ```

8. 添加，提交，上传

   ```
   $ git add README
   $ git add . //添加所有文件
   $ git commit -m "first commit"
   $ git push origin master
   ```

   git push命令将本地仓库推送到远程服务器，git pull相反。

9. 合并

   在上面提交命令后，可能会出现“因为您当前分支的最新提交落后于其对应的远程分支”等类似错误，需要先获取远端更新并与本地合并，再git push

   ```
   $ git fetch origin   //获取远程更新
   $ git merge origin/master
   $ git push origin master
   ```

# 5. Linux Hadoop安装

## [5.1 Java安装](#3. linux Java + IntelliJ)

Hadoop官方网站：http://hadoop.apache.org/

**Required Software** 

Required software for Linux include:

1. Java™ must be installed. Recommended Java versions are described at [ HadoopJavaVersions](http://wiki.apache.org/hadoop/HadoopJavaVersions).
2. ssh must be installed and sshd must be running to use the Hadoop scripts that manage remote Hadoop daemons.

**安装**

## 5.2 ssh免密登陆

<a href="http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html">什么是SSH</a>

<a href="https://baijiahao.baidu.com/s?id=1662669440853469635&wfr=spider&for=pc">什么是SSH</a>

If your cluster doesn't have the requisite software you will need to install it.

For example on Ubuntu Linux:

```shell
  $ sudo apt-get install ssh
  $ sudo apt-get install rsync
```

`$ ssh localhost或者 $ ssh 主机名` （`$ exit退出`）都会要求输入密码，使得有些交互无法进行，故需要设置免密登陆。

免密配置：

 ==如果已经生成过ssh-key则不用生成了否则将把原来的覆盖==，使有些操作失效。如git不能推送到远程仓库

```shell
$ ssh-keygen -t rsa
```

一路回车或yes

```shell
$ ls -a //-a查看隐藏文件夹，.开头的是隐藏文件夹
$ cd .ssh
$ ls
id_rsa  id_rsa.pub  known_hosts
$ ll
-rw-------  1 cxy cxy 1679 11月 29 19:16 id_rsa  #私钥
-rw-r--r--  1 cxy cxy  389 11月 29 19:16 id_rsa.pub #公钥
-rw-r--r--  1 cxy cxy 2354 11月 29 19:15 known_hosts

$ cat id_rsa.pub >> authorized_keys #复制id_rsa.pub 到 authorized_keys
$ chmod 600 authorized_keys #设置权限

/**测试**/
$ ssh Cxy  #不用输密码了
```

## 5.3 Hadoop安装

<a href="https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html">参考官网</a>

###<a href="http://archive.cloudera.com/cdh5/cdh/5/">1. 下载</a>(速度很慢)

```
hadoop-2.6.0-cdh5.9.3.tar.gz
hive-1.1.0-cdh5.9.3.tar.gz
```

### 2. 解压到 ： ~/opt

###  3. 配置环境变量

到根目录下将Hadoop配置到环境变量

  ```shell
#$ vi ~/.bash_profile #配置这个重启后就失效了
#$ gedit ~/.bashrc #出问题
$ sudo vi /etc/profile
  ```

  输入：

  ```shell
export JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
export PATH=$PATH:$JAVA_HOME/bin

export HADOOP_HOME=/opt/hadoop-2.6.0-cdh5.9.3
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
  ```

  `:x`或`:wq`保存退出

  ```shell
# $ source ~/.bash_profile #配置这个重启后就失效了
# $ source ~/.bashrc #出问题
$ source /etc/profile
  ```

  以上配置完成后，查看是否安装成功:

```shell
$ hadoop version
```

### 4. 单机模式/本地模式(Standalone Operation)

1. 官方Grep案例

```shell
$ mkdir input
$ cp etc/hadoop/*.xml input
$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0-cdh5.9.3.jar grep input output 'dfs[a-z.]+'
$ cat output/*
```

2. 官方WordCount案例

```shell
$ mkdir wcinput
$ vim wcinput/wc.input
#输入:
hadoop yarn
hadoop mapreduce
atguigu
atguigu

$ hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0-cdh5.9.3.jar wordcount wcinput wcoutput
#查看结果
$ cat wcoutput/part-r-00000
atguigu	2
hadoop	2
mapreduce	1
yarn	1
```

### 5.伪分布模式(Pseudo-Distributed Operation)

#### 1. 启动HDFS并运行MapReduce程序

##### 分析

​	（1）配置集群

​	（2）启动、测试集群增、删、查

​	（3）执行WordCount案例

##### 执行步骤

- **配置集群**

  1. /opt/hadoop-2.6.0-cdh5.9.3/etc/hadoop/==hadoop-env.sh==

     修改Hadoop配置文件, 添加HADOOP_HOME/bin到系统环境变量 

     ```shell
     $ vi /opt/hadoop-2.6.0-cdh5.9.3/etc/hadoop/hadoop-env.sh
     #输入:
     
     #$ echo $JAVA_HOME #自动获取JAVA_HOME可能失败
     export JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
       	
     # Assuming your installation directory is /opt/hadoop-2.6.0-cdh5.9.3
     export HADOOP_PREFIX=/opt/hadoop-2.6.0-cdh5.9.3
     ```

  2. /opt/hadoop-2.6.0-cdh5.9.3/etc/hadoop/==core-site.xml==

     将下面<configuration></configuration>里的内容存到配置文件的<configuration></configuration>里

       ```xml
     <configuration>
       
           <property>
             <!-- 指定HDFS副本的数量 -->
             <name>fs.defaultFS</name>
               <value>hdfs://localhost:9000</value>
           </property>
       
       </configuration>
       ```

  3. /opt/hadoop-2.6.0-cdh5.9.3/etc/hadoop/==hdfs-site.xml==

       ```xml
     <configuration>
         
           <property>
             					<!-- 指定HDFS中NameNode的地址 -->
                       <name>dfs.replication</name>
                       <value>1</value>
               </property>
       
               <property>
                 			<!-- 指定Hadoop运行时产生文件的存储目录 -->
                       <name>hadoop.tmp.dir</name>
                       <value>/opt/hadoop-2.6.0-cdh5.9.3/temp</value>
               </property>  
         
       </configuration>
     ```

      注：第二个属性中/home/cxy/Hdp/app/tmp路径用来存放临时文件，因为hadoop.tmp.dir的默认路径...tmp重启会被清空

  4. /opt/hadoop-2.6.0-cdh5.9.3/etc/hadoop/==slaves==

       ```shell
     $ vi etc/hadoop/slaves
     ```

       将localhost改为主机名. 此步骤可省

     

- **启动集群**

  1. 第一次启动Hadoop必须要格式化，格式化不要重复执行, 如果格式化没报错则配置完成

     ```shell
     $ bin/hdfs namenode -format #格式化
     #看到最后某行显示如下,即格式化成功
     INFO common.Storage: Storage directory /opt/hadoop-2.6.0-cdh5.9.3/temp/dfs/name has been successfully formatted
     ```

  2. 启动NameNode

     ```shell
     $ sbin/hadoop-daemon.sh start namenode
     ```

  3. 启动DataNode

       ```shell
     $ sbin/hadoop-daemon.sh start datanode
     ```


- **查看集群**

  1. 查看是否启动成功 :

  ```shell
  $ jps
  14913 Jps
  14650 NameNode
  15260 DataNode
  ```

  ​	注意：jps是JDK中的命令，不是Linux命令。不安装JDK不能使用jps

  

  2. web端查看HDFS文件系统

     http://localhost:50070/dfshealth.html#tab-overview

     看到如下图则配置成功:

     ![image-20200409212540503](pic/image-20200409212540503.png)

     ![image-20200409212501730](pic/image-20200409212501730.png)

     注意：如果不能查看，参考4,思考. 或看如下帖子处理

     http://www.cnblogs.com/zlslch/p/6604189.html

  3. 查看产生的Log日志

     说明：在企业中遇到Bug时，经常根据日志提示信息去分析问题、解决Bug。

     当前目录：/opt/hadoop-2.6.0-cdh5.9.3/logs

  4. **思考：为什么不能一直格式化NameNode，格式化NameNode，要注意什么？**

     注意：格式化NameNode，会产生新的集群id,导致NameNode和DataNode的集群id不一致，集群找不到已往数据。所以，格式NameNode时，一定要先删除之前设置的临时文件缓存目录: temp/dfs/data数据和log日志，然后再格式化NameNode

     ```shell
      $ cd /opt/hadoop-2.6.0-cdh5.9.3/temp/dfs/name/current
     $ cat VERSION
     	clusterID=CID-f0330a58-36fa-4a2a-a65f-2688269b5837
     
     $ cd /opt/hadoop-2.6.0-cdh5.9.3/temp/dfs/data/current
     ```

- **操作集群**

  1. 在HDFS文件系统上**创建**一个input文件夹

     ```shell
     $ bin/hdfs dfs -mkdir -p /user/atguigu/input
     ```

  2. 将测试文件内容**上传**到文件系统上

     ```shell
     $bin/hdfs dfs -put wcinput/wc.input  /user/atguigu/input/
     ```

  3. **查看**上传的文件是否正确

     ```shell
     $ bin/hdfs dfs -ls  /user/atguigu/input/
     $ bin/hdfs dfs -cat  /user/atguigu/ input/wc.input
     ```

  4. **运行**MapReduce程序

  ```shell
  $ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.2.jar wordcount /user/atguigu/input/ /user/atguigu/output
  ```

  5. 查看**输出**结果

  ```shell
  $ bin/hdfs dfs -cat /user/atguigu/output/*
  ```

  ![image-20200409204820871](pic/image-20200409204820871.png)

  6. 将测试文件内容**下载**到本地

  ```shell
  $ hdfs dfs -get /user/atguigu/output/part-r-00000 ./wcoutput/
  ```

  7. **删除**输出结果

  ```shell
  $ hdfs dfs -rm -r /user/atguigu/output
  ```

### [Unable to load native-hadoop library for your platform... using builtin-java classes where applicable](https://www.cnblogs.com/zhi-leaf/p/11424620.html)

最近在做hbase脚本执行时发现以下警告，但不影响操作，问题截图：

![img](pic/1031555-20190828155227026-2010074800.png)

出于好奇，对该警告进行了一番探究。

Hadoop是使用Java语言开发的，但是有一些需求和操作并不适合使用java，所以就引入了本地库（Native Libraries）的概念，通过本地库，Hadoop可以更加高效地执行某一些操作。（摘自网络）

既然有影响，那我们就把问题解决掉。

 

**下载native-hadoop**

![img](pic/1031555-20190828155956255-1612522769.png)

从[官网](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/NativeLibraries.html)得知，native-hadoop包含在每个发行版本的$HADOOP_HOME/lib/native目录下，因此我直接从官网上下载hadoop-2.9.2.tar.gz。

 

**配置native-hadoop**

解压hadoop-2.9.2.tar.gz，将里面的/lib/native所有内容拷贝到/usr/local/lib/hadoop-native目录中。

![img](pic/1031555-20190828162709739-1077142050.png)

修改/etc/profile文件，在结尾添加以下配置：

```shell
export JAVA_LIBRARY_PATH=/opt/hadoop-2.6.0-cdh5.9.3/lib/native
```

source /etc/profile，发现上面的警告没有了

![img](pic/1031555-20190828163159895-2076248147.png)

# 6. VS Code + Java开发

## 6.1 Maven

环境搭建：

extension：

Maven for Java;

创建project：

Ctrl + shift + p 或者左侧浏览器MAVEN PROJECT 处点 +  --> 选择 maven-archetype-quicksstart  --> 选择目录地址 --> 选择版本1.0 --> 选择包名

# 7. 如何使用VS Code创建SpringBoot项目

#### 1. 安装扩展(Ctrl+Shift+X)

- [Java Extension Pack (Java 扩展包)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)
- Spring Boot Extension Pack

![javaextention](pic/javaextention.png)

#### 2. 配置Maven：

点左下角的设置图标->设置，打开设置内容筛选框，输入maven，然后点击右侧的打开json格式setting：

![949088-20181018142037876-936312706](pic/949088-20181018142037876-936312706.png)

然后把:

- maven的可执行文件路径配置
- maven的setting路径配置
- java.home的路径配置

拷贝到右侧的用户设置区域并且设置为自己电脑的实际路径

![949088-20181018142807301-1282887727](pic/949088-20181018142807301-1282887727.png)

也可以直接在设置界面中设置，记住两边都要配置好

#### 3. 创建Maven项目

使用快捷键(Ctrl+Shift+P)命令窗口，输入 Spring 选择创建 Maven 项目。 效果如下：

![949088-20181019110527579-986789609](pic/949088-20181019110527579-986789609.png)

选择需要使用的语言、Group Id、项目名称等，这里选择Java：

![949088-20181019110754155-40455743](pic/949088-20181019110754155-40455743.png)

![949088-20181019110856222-1209305730](pic/949088-20181019110856222-1209305730.png)

![949088-20181019111002777-1987557021](pic/949088-20181019111002777-1987557021.png)

选择Spring Boot版本：

![949088-20181019111039119-440533955](pic/949088-20181019111039119-440533955.png)

选择需要引入的包，引入如下几个包即可满足web开发：

DevTools（代码修改热更新，无需重启）、Web（集成tomcat、SpringMVC）、Lombok（智能生成setter、getter、toString等接口，无需手动生成，代码更简介）、Thymeleaf （模板引擎）。

![949088-20181019111826340-254130709](pic/949088-20181019111826340-254130709.png)

选择好要引入的包后直接回车，在新弹出的窗口中选择项目路径，至此Spring Boot项目创建完成

#### 4. 打开项目

创建好后vscode右下角会有如下提示，点击Open it 即可打开刚才创建的Spring Boot项目

![949088-20181019112116653-410014195](pic/949088-20181019112116653-410014195.png)

####  5. 项目运行跟调试

项目创建后会自动创建DemoApplication.java文件，在DemoApplication 文件目录下新建文件夹 Controller，新建文件HomeController.java。效果如下：

![949088-20181019133810848-1910514658](pic/949088-20181019133810848-1910514658.png)

Ps:SpringBoot项目的Bean装配默认规则是根据DemoApplication类所在的包位置从上往下扫描。所以必须放在同一目录下否则会无法访问报如下所示错误：

![949088-20181018171327250-1855055392](pic/949088-20181018171327250-1855055392.png)启动工程之前还需要配置下运行环境，如下图，点左边的小虫子图标，然后点上面的下拉箭头，选择添加配置，第一次设置时VS Code会提示选择需要运行的语言环境，选择对应环境后自动创建 launch.json 文件。

![image-20200331152054138](pic/image-20200331152054138.png)

launch.json 调试配置文件如下，默认不修改配置也可使用：

![img](pic/949088-20181018170816359-2101824580.png)

选择对应的配置环境调式项目如下，默认端口为8080。

![image-20200331152224047](pic/image-20200331152224047.png)

启动后可在控制台输出面板查看启动信息，显示如下后，访问：http://localhost:8080即可

![image-20200331152247349](pic/image-20200331152247349.png)

最终效果如下：

![img](pic/949088-20181019135017904-1365099465.png)

#### 6. 访问HTML页面

在spring boot 中访问html需要引入Thymeleaf （模板引擎）包，在创建项目时已引用该包这里不需在重复引用。在resources-->templates目录下创建Index.html文件，效果如下：

![img](pic/949088-20181019135536794-1609170362-1585639453139.png)

html内容：

```
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>第一个HTML页面</title>
</head>
<body>
<h1>Hello Spring Boot!!!</h1>
<p th:text="${hello}"></p>
</body>
</html>
```

 在controller目录下新建TestController.java文件，代码如下：

```
@Controller
public class TestController {

    /**
     * 本地访问内容地址 ：http://localhost:8080/hello
     * @param map
     * @return
     */
    @RequestMapping("/hello")
    public String helloHtml(HashMap<String, Object> map) {
        map.put("hello", "欢迎进入HTML页面");
        return "/index";
    }
}
```

Ps:如果要访问html页面注解必须为Controller不能为RestController。否则无法访问。

**RestController和Controller的区别：**

@RestController is a stereotype annotation that combines @ResponseBody and @Controller.
意思是：
@RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用。
1)如果只是使用@RestController注解Controller，则Controller中的方法无法返回jsp页面，配置的视图解析器InternalResourceViewResolver不起作用，返回的内容就是Return 里的内容。

例如：本来应该到success.html页面的，则其显示success.

2)如果需要返回到指定页面，则需要用 @Controller配合视图解析器InternalResourceViewResolver才行。

3)如果需要返回json或者xml或者自定义mediaType内容到页面，则需要在对应的方法上加上@ResponseBody注解

效果展示如下：

![img](pic/949088-20181019140657585-1350811104.png)

到处基础配置结束，可以愉快的玩耍Spring Boot!





# 8. Tomcat安装

## Windows 环境

[下载地址](#<http://tomcat.apache.org/>)

1. 解压到安装目录

2. 配置环境变量

   | 变量名        | 变量值                                       |
   | ------------- | -------------------------------------------- |
   | CATALINA_BASE | D:\Program files\Apache\apache-tomcat-8.5.51 |
   | CATALINA_HOME | D:\Program files\Apache\apache-tomcat-8.5.51 |
   | Path          | %CATALINA_HOME%\bin                          |

3. 启动

   命令行中输入`startup` 或 `catalina run`，然后在浏览器地址栏输入如下验证：

   ```html
   localhost:8080
   //或
   127.0.0.1:8080
   ```

## Linux 环境

```shell
#将压缩包移动到新建文件夹，解压，删除压缩包
sudo cp apache-tomcat-9.0.33.tar.gz /home/cxy/Programfiles
sudo tar -zxvf apache-tomcat-9.0.33.tar.gz
sudo rm apache-tomcat-9.0.33.tar.gz

#设置权限，进入解压路径下的bin目录
sudo chmod 755 -R apache-tomcat-9.0.33
cd apache-tomcat-9.0.33/bin

#启动Tomcat
sudo ./startup.sh

#验证，通过在浏览器中输入下面地址，如果进入Tomcat首页即安装成功
localhost:8080
```



# 9. Mysql 安装

## 9.1 Windows 环境

1. 在官网下载 [MySQL](https://dev.mysql.com/downloads/mysql/) ， [安装版MySQL](https://link.zhihu.com/?target=https%3A//link.jianshu.com/%3Ft%3Dhttp%3A//dev.mysql.com/downloads/installer/)

2. 配置初始化的my.ini文件的文件

   解压后的目录并没有的my.ini文件，没关系可以自行创建在安装根目录下添加的my.ini（新建文本文件，将文件类型改为的.ini），写入基本配置： 记得改路径，Data文件夹会自动生成，无需创建

   ```ini
   [client]
   # 设置mysql客户端默认字符集
   default-character-set=utf8
    
   [mysqld]
   # 设置3306端口
   port = 3306
   # 设置mysql的安装目录
   basedir=D:\\Program files\\Oracle\\mysql-8.0.19-winx64
   # 设置 mysql数据库的数据的存放目录，MySQL 8+ 不需要以下配置，系统自己生成即可，否则有可能报错
   # datadir=D:\\Program files\\Oracle\\mysql-8.0.19-winx64\\Data
   # 允许最大连接数
   max_connections=20
   # 服务端使用的字符集默认为8比特编码的latin1字符集
   character-set-server=utf8
   # 创建新表时将使用的默认存储引擎
   default-storage-engine=INNODB
   ```

   配置文件中的路径要和实际存放的路径一致

3. 初始化MySQL

   > 运行`mysqld --initialize-insecure`自动生成无密码的root用户。
   > 运行`mysqld --initialize`自动生成带随机密码的root用户
   >
   > 
   >
   > 以==管理员的方式打开cmd==， 切换到安装目录下的bin目录下，执行：
   >
   > ```shell
   > mysqld --initialize --console
   > ```
   >
   > 输出：
   >
   > ```shell
   > ...
   > 2020-03-11T02:38:19.492703Z 5 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: OWMyd1?KzWj4
   > ```
   >
   > 记录下密码：OWMyd1?KzWj4
   >
   > 一定要以管理员的方式打开，不然会报错：Install/Remove of the Service Denied

4. 安装MySQL服务 + 启动MySQL 服务

   >安装：
   >
   >```shell
   >mysqld --install [服务名]（服务名可以不加默认为mysql）
   >```
   >
   >启动：
   >
   >```shell
   >net start mysql
   >```

5. 连接 MySQL

   > 下载 [Navicat](https://www.navicat.com.cn/download/navicat-premium)
   >
   > [安装与破解](#11. Navicat 安装与激活)
   >
   > MySQL的服务已经开启了就直接打开的Navicat去连接
   >
   > ![image-20200402150347474](pic/image-20200402150347474.png)
   >
   > **还记得刚刚让你复制的root @ localhost：后面的初始密码了吗？现在要用到它了复制粘贴上去！**
   >
   > 

6. 修改密码

   在 Navicat 中双击连接名，修改密码

## 9.2 Linux 环境

<a href = "https://dev.mysql.com/downloads/mysql/">MySQL下载</a>

### mysql 安装

```mysql
# 安装MySQL的依赖库
sudo apt install yum
sudo apt install numactl
sudo apt install libaio-dev

#解压mysql压缩包到 /usr/local/mysql 下
tar -zxvf mysql-8.0.19-linux-glibc2.12-x86_64.tar.xz  /usr/local/mysql
#也可解压后重命名为mysql，再移动到/usr/local/
sudo mv mysql /usr/local

#给Ubuntu系统添加一个mysql的用户组
groupadd mysql

#添加一个mysql用户到mysql用户组中
useradd -r -g mysql -s /bin/false/mysql

#切换到/usr/local/mysql目录
cd /usr/local/mysql

#然后给移动后的文件夹添加目录权限到mysql用户组
sudo mkdir mysql-files
sudo chown mysql:mysql mysql-files
sudo chmod 750 mysql-files

#对mysql数据库执行初始化命令
bin/mysqld --initialize --user=mysql

#开启MySQL服务
bin/mysqld_safe --user=mysql&
```

测试是否安装成功

```shell
mysqladmin --version
```

 linux上该命令将输出以下结果，该结果基于你的系统信息：

```shell
mysqladmin  Ver 8.42 Distrib 5.7.29, for Linux on x86_64
```

 如果以上命令执行后未输出任何信息，说明你的Mysql未安装成功。 



### 使用 MySQL Client(Mysql客户端) 执行简单的SQL命令

 你可以在 MySQL Client(Mysql客户端) 使用 mysql 命令连接到 MySQL 服务器上，默认情况下 MySQL 服务器的登录密码为空，所以本实例不需要输入密码。

命令如下：

```
[root@host]# mysql
```

 以上命令执行后会输出 mysql>提示符，这说明你已经成功连接到Mysql服务器上，你可以在 mysql> 提示符执行SQL命令：

```mysql
mysql> SHOW DATABASES;
```

### Mysql安装后需要做的

 Mysql安装成功后，默认的root用户密码为空，你可以使用以下命令来创建root用户的密码：

```mysql
[root@host]# mysqladmin -u root password "new_password";
```

 现在你可以通过以下命令来连接到Mysql服务器：

```mysql
[root@host]# mysql -u root -p
Enter password:*******

use mysql;
update user set host = '%' where user = 'root'; 
select host, user from user; 
flush privileges;#授权之后必须刷新权限才生生效
```

 **注意：**在输入密码时，密码是不会显示了，你正确输入即可。

### MySQL提示ERROR 1698 (28000): Access denied for user 'root'@'localhost'错误解决办法

#### Step1：修改mysqld.cnf配置文件

在ubuntu的terminal（也即终端）上输入

```shell
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

进入到配置文件后在这个配置文件中的 **[mysqld]** 这一块中加入skip-grant-tables这句话。

[![复制代码](pic/copycode.gif)](javascript:void(0);)

```
 1 [mysqld]
 2 #
 3 # * Basic Settings
 4 #
 5 user            　 = mysql
 6 pid-file        　 = /var/run/mysqld/mysqld.pid
 7 socket        　　 = /var/run/mysqld/mysqld.sock
 8 port            　 = 3306
 9 basedir        　　= /usr
10 datadir       　　 = /var/lib/mysql
11 tmpdir       　　　= /tmp
12 lc-messages-dir   = /usr/share/mysql
13 skip-external-locking
14 character-set-server=utf8
15 collation-server=utf8_general_ci
16 skip-grant-tables　　　　<-- add here
```

**保存:wq，退出**。

```mysql
service mysql restart #重新启动mysql
```

#### step2：设置root密码

在终端上输入mysql -u root -p，遇见输入密码的提示直接回车即可,进入mysql后，分别执行下面三句话：

```mysql
use mysql;
update user set authentication_string=password("12345c") where user="root"; 
flush privileges;

select user, plugin from user;

#如果plugin root的字段是auth_socket，那我们改掉它
#改为下面的 mysql_native_password，如果和该字段内其它值一样，就直接quit
update user set authentication_string = password("12345c"),plugin = 'mysql_native_password' where user='root';

flush privileges;
select user,plugin from user;

quit;#退出mysql 
```

#### step3：注释掉skip-grant-tables

```shell
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf  
# 然后注释掉skip-grant-tables
#保存退出

service mysql restart #重新启动mysql
mysql -u root -p
#输入刚设置的密码，进入mysql
```

![img](pic/1425775-20180904131927504-1825749614.png)

### navicat Can't connect to local MySQL server through socket '/var/lib/mysqld/mysqld.sock的解决办法

navicat上报错的路径var/lib/mysqld/mysqld.sock和mysql配置环境的路径不一样，在配置环境中改一下[mysqld]下的sock路径，并给大权限

```
sudo chmod 777 /var/lib/mysql/
```



### ERROR 2002 (HY000): Can’t connect to local MySQL server through socket ‘/var/run/mysqld/mysqld.sock’

对于这类错误，要么找到/tmp/mysql.sock文件 进行修改(但是比较麻烦)。但是我没找到这个文件 于是就用下面的方法了比较暴力但是很实用，直接==卸载重装==

```shell
首先查看版本号:
sudo mysql -V  
下面是版本号:
mysql  Ver 14.14 Distrib 5.7.18, for Linux (x86_64) using  EditLine wrapper
执行:
apt-get autoremove --purge mysql-server-5.7 // 这一步执行不了,继续下面的;

需要删除很多文件:
依次执行这三步:
sudo apt-get autoremove mysql-server
sudo apt-get remove mysql-common 
sudo dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 

重新安装:
sudo apt-get install mysql-server mysql-client 
执行mysql :
mysql -u root -p

#登录不上去，没有设置密码，前面有重置密码的方法
```

### ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

客户端：终端和navicat的socket地址不一样，没有制定客户端所以两个不能同时登录。可以在配置文件中添加如下配置：

`sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf`

```cfg
[client]
default-character-set = utf8
socket          = /var/lib/mysql/mysql.sock
```





### 服务管理

```mysql
#服务管理
#启动
sudo service mysql start
#停止
sudo service mysql stop
#服务状态
sudo service mysql status
```

### 卸载

```mysql
#首先使用以下命令删除MySQL服务器：
sudo apt-get remove mysql-server
#然后，删除随MySQL服务器自动安装的任何其他软件：
sudo apt-get autoremove
#卸载其他组件：
sudo apt-get remove <<package-name>>
#查看从MySQL APT存储库安装的软件包列表：
dpkg -l | grep mysql | grep ii
```







# 10. IDEA 部署 Tomcat

使用Idea的时候，修改了代码，需要反复的重启Tomcat，查看效果，是不是贼烦？还记得刚上手idea的时候，瞎配置部署Tomcat，结果最后修改一个jsp都要重新启动服务器，我这金牛座程序员能忍？~这个时候就必须砸电脑了~这个时候就可以在项目中加入热部署，这样才会大大节省开发效率！

#### Tomcat 下载~

官网地址-点击进入 <http://tomcat.apache.org/>

#### Tomcat 安装

解压即可，安装就over了，但解压路径最好不要是C盘，可能会出现拒绝访问等各种奇葩问题，还有解压路径不要有中文和特殊字符，切记！！！

#### Tomcat 热部署到IDEA

intellij idea默认文件是自动保存的，但是手头有个项目jsp文件改动后，在tomcat中不能立即响应变化
这时就需要热部署。

> 看过来 ： 如果各位觉得烦可以不看下面一大串文字~当我在放P~，直接按图操作也是完全OK滴！！！

在idea tomcat 中server的配置里，有个on frame deactivation，选择update classes and resources。另外有个配置on update action，就是手动操作的时候采取什么动作，可以重启服务器，也可以像上面一样更新类和资源文件，我选的是Redeploy。可是当前项目没有update classes and resources这个选项，有个Hot Swap classes。这是由于服务器添加的Artifact类型问题，一般一个module对应两种类型的Artifact，一种是war，一种是war explored。war就是已war包形式发布，当前项目是这种形式，在这种形式下on frame deactivation配置没有update classes and resources选项。war explored是发布文件目录，选择这种形式，on frame deactivation中就出现update classes and resources选项了。具体操作如下：

![IDEA连接Tomcat1](pic/IDEA连接Tomcat1-1584088725961.png)

![IDEA连接Tomcat2](pic/IDEA连接Tomcat2.png)

![IDEA连接Tomcat3](pic/IDEA连接Tomcat3.png)

 server 的配置里，找到 ==on frame deactivation 条目，选择 update classes and resources==

![IDEA连接Tomcat4](pic/IDEA连接Tomcat4.png)

![IDEA连接Tomcat5](pic/IDEA连接Tomcat5.png)

![IDEA连接Tomcat6](pic/IDEA%E8%BF%9E%E6%8E%A5Tomcat6-1585637517135.png)

注：==Artifact==在project structure里设置，如果没有 系统会自动提示。artifact放的是服务器从项目中copy的web目录的内容，建议保存目录写到服务器安装目录的 webapps 下

## idea两种热部署设置方法

第二种方法：在pom.xml添加相应依赖（不太建议使用），至于为什么不建议是因为之后开发没有那么多闲功夫注重有没有引入热部署坐标依赖，还不如直接在idea上配置，所谓一劳百益嘛！！！具体操作类似入下

```
 <!--支持热部署依赖-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
```

到这里，两种方法也讲完了，哎哎这不就讲了一种吗，我顶你个肺....兄弟别冲动别急着顶我个fei，第一种方法就是idea自带的设置，上面已经配好了！挥爪，告辞~那个要顶我fei的同学放学别走啊~...

# 11. Navicat 安装与激活

Navicat 可以说是众多程序猿小伙伴的忠爱了，因为界面简洁且操作简单，让我们爱不释手；最近Navicat Premium 15发布了， 让我们来看看如何安装永久激活版哦（简称白嫖版）

## Windows 环境

### 1. Navicat Premium 15 安装

安装软件包和注册机：

链接：https://pan.baidu.com/s/1C1CkGtVhWMz-VEhS80HSVw

提取码：6umm

 

进入安装页面直接疯狂点下一步直到安装成功即可，当然你可以自己选择安装目录

[![img](pic/1680705-20200122141329061-521874380-1585637518798.png)](https://img2018.cnblogs.com/i-beta/1680705/202001/1680705-20200122141329061-521874380.png)

### 2. Navicat Premium 15 激活

使用注册机先退出所有杀毒软件，再打开注册机，否则会一直报错哦！

[![img](pic/1896874-20200123203653934-1905719632-1585637521727.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123203653934-1905719632.png)

##### **1.Patch**

**![img](pic/1896874-20200123203718599-1855354632-1585637517686.png)**

 

在 1) Patch 中选择Backup、Host、Navicat v15这三个，默认也是选择了这三个；勾选这三个后点击Patch

点击Patch按钮并找到Navicat Premium 15的安装目录的navicat.exe文件

[![img](pic/1680705-20200122135623740-1819333424.png)](https://img2018.cnblogs.com/i-beta/1680705/202001/1680705-20200122135623740-1819333424.png)

出现以下提示说明Patch成功了，但别高兴的太早，这还只是第一步。

[![img](pic/1680705-20200122124513888-771093616.png)](https://img2018.cnblogs.com/i-beta/1680705/202001/1680705-20200122124513888-771093616.png)

##### **2. License. Product and Language**

License里选中Enterprise、在Produce里选择Premium、在Languages里选择Simplified Chinese(简体中文)

##### **3. Resale License**

保持默认选择即可

[![img](pic/1896874-20200123203939098-214143870.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123203939098-214143870.png)

 

##### **4. Keygen / Offline Activation**

点击Generate按钮就会生成一个许可证秘钥，将许可证秘钥复制后就打开Navicat Premium 15

**![img](pic/1896874-20200123204033056-1300081833.png)**

然后打开Navicat Premium 15，一个是试用14天，一个是注册，这里我们点击注册

[![img](pic/1896874-20200123204653788-657172093.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123204653788-657172093.png)

 

粘贴刚刚注册机生成的许可证秘钥,然后激活

[![img](pic/1896874-20200123204233217-1350995875.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123204233217-1350995875.png)

 

 点击激活后会提示因为激活服务器暂时不可用,所以你的许可证未能激活，我们就选择手动激活。

[![img](pic/1896874-20200123204254272-44884750.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123204254272-44884750.png)

点击手动激活后会生成一个请求码

复制请求码到注册机中的Request Code里面，之后点击Activation Code下面的Generate按钮就会生成一个激活码

[![img](pic/1896874-20200123204510101-401514966-1585637517452.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123204510101-401514966.png)

 

将激活码复制到Navicat Premium 15中的激活码框框里，点击激活即可完成激活

[![img](pic/1896874-20200123204524902-1348525559.png)](https://img2018.cnblogs.com/i-beta/1896874/202001/1896874-20200123204524902-1348525559.png)



## Linux 环境

### 1. <a heref="https://www.navicat.com.cn/download/navicat-premium">Navicat下载</a>

### 2. 官方安装

```shell
####### 官方安装步骤 #########
# 1 
$ chmod +x navicat15.AppImage
# 2
$ ./navicat15.AppImage
```

```
NAVB-LXGS-EES6-RZFI
```

### 3. 实际安装与破解

- 在官网下载软件，注意不是for Mysql版的，激活工具不能激活

- 下载wine，运行激活工具激活

  下面等等方式测试失败

  ---

  

#### 3.1 提取AppImage文件到文件夹里

```shell
$ su
mount -o loop navicat15.AppImage navicat15-mysql-cs
cp -r navicat15-mysql-cs navicat15-mysql-cs-patched
umount navicat15-mysql-cs
rm -rf navicat15-mysql-cs
取AppImage文件到文件夹里

$ su
# mkdir navicat15-premium-cs
# mount -o loop navicat.AppImage navicat15-premium-cs
# cp -r navicat15-premium-cs navicat
# umount navicat15-premium-cs
# rm -rf navicat15-premium-cs

```

如果 `$su` 密码错误，可参见<a href="https://www.cnblogs.com/xuliangxing/p/7427121.html">这里</a>，可以用`$sudo passwd`，先输入当前用户密码，再输入新密码。

#### 3.2 编译安装（如果你觉得git下载太慢 [keystone-master.zip](https://rmc.ink/?go&url=aHR0cDovL29zcy5ybWMuaW5rL3R5cGVjaG8vMjAyMC8wMy8xNi85NDAxMzU4MDU0NTAzNy56aXA=)）

```shell
# 编译patcher-keygen需要以下几个库支持
sudo apt-get install libcapstone-dev
sudo apt-get install cmake
sudo apt-get install rapidjson-dev

git clone https://github.com/keystone-engine/keystone.git
cd keystone
mkdir build
cd build
../make-share.sh
sudo make install
sudo ldconfig
```

#### 3.3 生成私钥 (下载navicat-patcher和navicat-keygen  [激活工具.zip](https://rmc.ink/?go&url=aHR0cDovL29zcy5ybWMuaW5rL3R5cGVjaG8vMjAyMC8wMy8xNi85Mzg2OTM5MDc3MDA1MTAuemlw))

```shell
cd active_tool
chmod +x navicat-patcher
./navicat-patcher navicat
```

#### 3.4 激活

```shell
navicat-keygen --text ./RegPrivateKey.pem
```

1）选择类别
2）选择语语言
3）主版本号
4）输入用户名)
5）输入组织名
6）在navicat中找到注册 输入序列号
7）点击 激活
8）选择 手动激活
9）复制 请求码 到keygen，连按两次回车结束
10）最终你会得到一个base64编码的 激活码
11）将之复制到 手动激活 的窗口，然后点击 激活

# 12 Linux 安装 wine

**sudo apt-get autoremove --purge**

.文件在/home/cxy下

```shell
apt-get install wine

apt install yum-utils

yum-config-manager --enable wine

winecfg 配置wine
```

Wine安装成功后Linux系统上会有一个wine命令，wine命令的使用方法是这样的，：
运行一个exe文件：
wine exe文件在linux上的路径

### 报错

0052:err:mscoree:CLRRuntimeInfo_GetRuntimeHost Wine Mono is not installed

### Solution： Winetricks

I decided to go old school and fall back to this neat little  		[wrapper script](https://www.dedoimedo.com/computers/winetricks.html), which you can use to install tons of common Windows 		applications, libraries and utilities, and hopefully, not have to deal with any fancy errors. I 		installed the script from the repos, and then installed dotNET 4.5 using it.

```shell
sudo apt-get install winetricks

winetricks dotnet45
```

The UI launched, and I started clicking buttons. Progress was made. Errors came up, but the wizard did not crash. The errors are far from helpful, and unless they block the installation, they should not be  shown.



**Ubuntu 18.04下给Wine设置微软雅黑字体（4步操作）**

2、新新建一个空文本，取名为msyh_font.reg（后缀是reg即可，文件名随便取的），终端命令操作：

sudo gedit msyh_font.reg

再把下面内容复制进去（注意Tahoma Bold那一行我是对应的之前复制过来的msyh粗体，如果你只复制了常规字体，下面应该全部填msyh.ttc）：

```reg
REGEDIT4
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
"Lucida Sans Unicode"="msyh.ttc"
"Microsoft Sans Serif"="msyh.ttc"
"MS Sans Serif"="msyh.ttc"
"Tahoma"="msyh.ttc"
"Tahoma Bold"="msyhbd.ttc"
"msyh"="msyh.ttc"
"Arial"="msyh.ttc"
"Arial Black"="msyh.ttc"
```



保存好之后，终端执行命令才能生效：

regedit msyh_font.reg

3、进入wine目录，编辑system.reg配置文件：

sudo gedit ~/.wine/system.reg

查找关键词FontSubstitutes，把它下面挨着的“MS Shell Dlg”=”SimSun”改为“MS Shell Dlg”=”msyh”。

改完记得保存。

4、终端执行命令打开wine配置管理：

winecfg

选中默认设置，再把系统改成Windows 10或者Win 7，这个随意，只要不是Windows XP什么的就行，因为老系统上没有雅黑这个字体，所以会看不到效果。

最好是重启下系统或者注销一下，搞定。既能解决乱码问题，又美观。

# 13 Maven 安装

#### 1. 下载压缩包:

<a href="http://maven.apache.org/download.cgi">官网地址</a> 

#### 2. 解压

提取到想要安装的目录

#### 3. 配置环境变量

```shell
$ gedit ~/.bashrc
```

配置 MAVEN_HOME 和 PATH，如果没有配置JAVA_HOME，也加上

```
JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
export MAVEN_HOME=/home/cxy/Programfiles/apache-maven-3.6.3
export PATH=$MAVEN_HOME/bin:$PATH
```

#### 4.source 一下profile

```shell
$source ~/.bashrc
```

#### 修改配置文件

```xml
<localRepository>/home/cxy/Programfiles/apache-maven/repository</localRepository>


 <!-- 阿里云仓库 -->
        <mirror>
            <id>alimaven</id>
            <mirrorOf>central</mirrorOf>
            <name>aliyun maven</name>
            <url>http://maven.aliyun.com/nexus/content/repositories/central/</url>
        </mirror>
        <mirror>
            <id>nexus-aliyun</id>
            <mirrorOf>*</mirrorOf>
            <name>Nexus aliyun</name>
            <url>http://maven.aliyun.com/nexus/content/groups/public</url>
        </mirror>
        <!-- 中央仓库1 -->
        <mirror>
            <id>repo1</id>
            <mirrorOf>central</mirrorOf>
            <name>Human Readable Name for this Mirror.</name>
            <url>http://repo1.maven.org/maven2/</url>
        </mirror>
    
        <!-- 中央仓库2 -->
        <mirror>
            <id>repo2</id>
            <mirrorOf>central</mirrorOf>
            <name>Human Readable Name for this Mirror.</name>
            <url>http://repo2.maven.org/maven2/</url>
        </mirror>
```

#### 5. 验证安装是否成功

```shell
mvn -v
```



# 14. GitLab安装

<a href="https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu/pool/trusty/main/g/gitlab-ce/">镜像地址</a>

#### 1.安装依赖包

```shell
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
```

#### 2. 邮件配置

> 选择Internet那一项,不带Smarthost的

```shell
sudo apt-get install -y postfix
```

安装期间，可能会出现配置屏幕。选择“Internet Site”，按回车键。使用您的服务器的外部DNS 'mail name' :==gitlab.atguigu.com==和按回车。如果出现其他屏幕，继续按enter以接受默认设置。如果点确定没有反应就按Tab键

![InternetSite](pic/InternetSite.png)

![DNS](pic/DNS-1585648137364.png)

#### 3.  安装方式一：镜像安装

免费版
 `curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash`
 企业版
 `curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash`

```shell
sudo apt-get update
sudo apt-get install gitlab-ce
或者 
sudo apt-get install gitlab-ee
```

#### 4. 安装方式二：下载安装

```shell
dpkg -i /home/cxy/下载/Java/gitlab-ce_11.9.0-ce.0_amd64.deb
```

#### 5. 配置访问路径

```shell
sudo vim /etc/gitlab/gitlab.rb

#写入：
external_url 'http://gitlab.atguigu.com'
```

#### 6. 更新配置

```shell
sudo gitlab-ctl reconfigure
```

#### 7. 重新启动gitlab

```shell
sudo gitlab-ctl restart
```

 **结果如下图**

![img](pic/3878590-816e0b7382551780.png)

#### 8. 打开 sshd 和 postfix 服务

```shell
service sshd start
service postfix start
```

#### 9. 查看gitlab服务器状态

```shell
sudo gitlab-ctl status
```

#### 10. 结果

**在浏览器中访问http://gitlab.atguigu.com**

#### 参考：

https://www.jianshu.com/p/2eef885b4aed

https://www.jianshu.com/p/907bd880761c



# 15. Redis安装

#### 安装

```shell
$sudo apt-get update
$sudo apt-get install redis-server
```

#### 启动 Redis

```shell
$ redis-server
```

#### 查看 redis 是否启动？

```shell
$ redis-cli
```

以上命令将打开以下终端：

```shell
redis 127.0.0.1:6379>
```

127.0.0.1 是本机 IP ，6379 是 redis 服务端口。现在我们输入 PING 命令。

```shell
redis 127.0.0.1:6379> ping
PONG
```

whereis redis 查看redis的安装位置

# 16. Xmind安装

#### 1.下载安装包

#### 2. 安装相关依赖

```shell
#将安装包解压复制到安装路径
sudo cp -r xmind-8-update9-linux /opt/

#找到setup.sh,执行:

apt-get update
sudo /opt/xmind-8-update9-linux/setup.sh
```

注: 后面步骤可以视情况而定,如果直接能打开了就不用后面的步骤

#### 3. 修改配置文件

```shell
sudo vim /opt/xmind-8-update9-linux/XMind_amd64/XMind.ini
```

>  将相对路径改为绝对路径 :

```ini
-configuration
/opt/xmind-8-update9-linux/XMind_amd64/configuration
-data
/opt/xmind-8-update9-linux/workspace
-startup
/opt/xmind-8-update9-linux/plugins/org.eclipse.equinox.launcher_1.3.200.v20160318-1642.jar
--launcher.library
/opt/xmind-8-update9-linux/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.1.400.v20160518-1444
--launcher.defaultAction
openFile
--launcher.GTK_version
2
-eclipse.keyring
@user.home/.xmind/secure_storage_linux
-vmargs
-Dfile.encoding=UTF-8
```

#### 4. 配置环境变量

```
export PATH=$PATH:/opt/xmind-8-update9-linux/XMind_amd64/
```

#### 5. 创建桌面图标

打开目录 /usr/share/applications
创建appname.desktop文件（需要管理员权限，名称任意，不影响在开始菜单中的名称）
添加下面代码

```desktop
[Desktop Entry]
Exec=/opt/xmind-8-update9-linux/XMind_amd64/XMind
Icon=/opt/xmind-8-update9-linux/XMind_amd64/xmind.png
Type=Application
Terminal=false
Name=Xmind
GenericName=Development
Categories=Development;IDE;
InitialPreference=9
```
------------------------------------------------

# 17. 安装gif制作工具

### 安装

```shell
apt install ffmpeg imagemagick
```

### 应用

####把图片放缩为640x480

```shell
$ mogrify -resize 640x480 \*.jpg
```



####图片生成动态 GIF

如果你有静态的 jpg 图片序列，在 Linux 中也可轻松生成动态 GIF，而不必动用到 Windows 中像 Photoshop 这样的神器。先将所有 JPG 放到同一文件夹，再在终端中执行如下命令即可：

```shell
convert -delay 120 -loop 0 *.jpg linux.gif
```

> - -delay 120 表示 GIF 动画速度
> - -loop 0 表示无限循环



#### 视频生成GIF

要将视频转换为 GIF 只使用到 ffmpeg 命令，格式如下：

```
ffmpeg -ss 00:00:20 -i input.mp4 -to 10 -r 10 -vf scale=200:-1 output.gif
```

> - -ss 表示起始点
> - -i 后面跟要操作的那个视频文件
> - -to 表示文件的终止点
> - -r 帧速率，可以增大这个值输出更画质更优的 GIF 文件
> - -vf 图形筛选器，GIF 的缩放大小





# 18. 虚拟环境配置

#### 1. 安装虚拟机

```shell
sudo apt-get install virtualbox
```



virtualbox就可以打开

https://www.cnblogs.com/luengmingbiao/p/10859905.html

https://www.jianshu.com/p/9cc4622d11f6

![image-20200410230708139](pic/image-20200410230708139.png)

# 19. 集群环境搭建

### 1. 删除所有dump.rdb文件

```shell
sudo rm -rf /var/lib/redis/dump*
```

### 2. 安装ruby

```shell
sudo apt-get install ruby-full # Debian 或 Ubuntu 系统
```

### 3. 安装Hadoop

​	[Hadoop安装](#5. Linux Hadoop安装)

### 4. 启动YARN并运行MapReduce程序

#### 分析

​	（1）配置集群在YARN上运行MR

​	（2）启动、测试集群增、删、查

​	（3）在YARN上执行WordCount案例

#### 执行步骤

##### 1. 配置集群

1. 配置 ==yarn-env.sh==

   ```shell
   export JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
   ```

2. 配置==yarn-site.xml==

   将下面<configuration></configuration>里的内容存到配置文件的<configuration></configuration>里

     ```xml
   <configuration>
   
           <!-- Reducer获取数据的方式 -->
           <property>
                   <name>yarn.nodemanager.aux-services</name>
                   <value>mapreduce_shuffle</value>
           </property>
   
           <!-- 指定YARN的ResourceManager的地址 -->
           <property>
                   <name>yarn.resourcemanager.hostname</name>
                   <value>localhost</value>
           </property>
     
     </configuration>
     ```

3. 配置：==mapred-env.sh==

   ```sh
   export JAVA_HOME=/usr/local/jdk-8u231-linux-x64/jdk1.8.0_231
   ```
   
4. 配置： (对mapred-site.xml.template重新命名为) ==mapred-site.xml==

   ```shell
   $ cp mapred-site.xml.template mapred-site.xml
   $ vi mapred-site.xml
   #输入:
   <!-- 指定MR运行在YARN上 -->
   <property>
      		<name>mapreduce.framework.name</name>
      		<value>yarn</value>
   </property>
   ```
##### 2.启动集群

1. 启动前必须保证NameNode和DataNode已经启动

2. 启动ResourceManager

   ```shell
   $ sbin/yarn-daemon.sh start resourcemanager
   ```

3. 启动NodeManager

   ```shell
   $ sbin/yarn-daemon.sh start nodemanager
   ```

   


##### 3. 查看集群

1. 查看是否启动成功 :

```shell
$ jps
16194 ResourceManager
5557 DataNode
17189 Jps
17015 NodeManager
5454 NameNode
```

##### 4. 操作集群

1. YARN的浏览器页面http://localhost:8088/cluster查看，如图2-35所示

![image-20200409222454432](pic/image-20200409222454432.png)



```shell
hadoop fs -put wcinput /

hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0-cdh5.9.3.jar wordcount /wcinput /wcoutput

hadoop fs -cat /wcoutput/*
```

2. 删除文件系统上的output文件

   ```shell
   $ bin/hdfs dfs -rm -R /user/atguigu/output
   ```

3. 执行MapReduce程序

   ```shell
   $ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.2.jar wordcount /user/atguigu/input  /user/atguigu/output
   ```

4. 查看运行结果

   ```shell
   $  bin/hdfs dfs -cat /user/atguigu/output/*
   ```

# 20. 双系统下对Ubuntu系统扩容

#### 1. 在Windows系统下对磁盘分区

核心:想要从哪个磁盘分出空间,就在那个盘右键选择压缩卷,设置要压缩的空间. 然后在新的未分配区上右键,新建分区,后面的就根据情况设置,基本是默认



---



1-3 计算机–>管理–>管理磁盘:

右键单击所要分区的硬盘，在菜单中选择“压缩卷”。

![Win10系统对磁盘进行快速分区的步骤3](pic/14555142526085568442e.jpg)

4、分配分区大小，点击“压缩”。

![Win10系统对磁盘进行快速分区的步骤4](pic/14555142527745474474e.jpg)

5、接着会出现一个未分配的分区，即刚刚压缩的，在此盘符上单击右键，在弹出的菜单中选择“新建简单卷”。

![Win10系统对磁盘进行快速分区的步骤5](pic/145551425294890677702.jpg)

6、新建简单卷向导。

![Win10系统对磁盘进行快速分区的步骤6](pic/1455514253167448399705.jpg)

7、指定简单卷大小，此处默认即可，下一步。

![Win10系统对磁盘进行快速分区的步骤7](pic/1455514253382731225142.jpg)

8、分配以下驱动器号，即盘符号，可在出现的各字母中任意选择，下一步。

![Win10系统对磁盘进行快速分区的步骤8](pic/1455514253598610620052.jpg)

9、格式化分区，一般设置默认即可，下一步。

![Win10系统对磁盘进行快速分区的步骤9](pic/145551425378965613632.jpg)

10、单击完成，稍等片刻。

![Win10系统对磁盘进行快速分区的步骤10](pic/145551425401724622492e.jpg)

11、正在格式化ing……

![Win10系统对磁盘进行快速分区的步骤11](pic/14555142542810004647f.jpg)

12、格式化成功！

![Win10系统对磁盘进行快速分区的步骤12](pic/1455514254497920854912.jpg)

13、新建好的E盘，可以存储数据了！

![Win10系统对磁盘进行快速分区的步骤13](pic/145551425468447046358f.jpg)

#### 2. 在Ubuntu系统下安装Gparted

```shell
#安装
$ sudo apt-get install gparted
#启动
$ sudo gparted
```

#### 3. 用Gparted分区

前提: 交换空间和/根目录都是带锁的

核心: 先分区,将分出的盘符一步步移动到交换空间上面, 卸载交换空间,得以和当前盘符交换,交换后启动交换空间.此时分出的盘符在Linux swap交换空间下面. 继续移动到/根目录前面,不能交换了,制作虚拟硬盘,按F12 or F10进入bios 启动USB启动盘, 选择try Ubuntu,进去再打开Gparted就可以将当前的未分区盘符合并到根目录上了. z

注意: 注意要把操作应用到系统才能生效



别人的教程: 过程是看了多个教程自己琢磨的, 具体看上面的分析

![img](pic/20190516180527147.png)

点击右上角, 选择当前磁盘(小C这里是250G固态和1T机械,ubuntu装在机械硬盘里),如下图:

![在这里插入图片描述](pic/20190516180733792.png)

在这里插入图片描述可以看到320G未分配区域,这块区域是小C从windows系统下腾出来(也可以不用腾),要一步步挪到/根目录上方,最后与根目录合并的.后面给出合并过程.在此之前,我们需要将ext4前面的小钥匙去掉,有它存在,我们就不能对根目录操作了呢~
接着,制作ubuntu16.04的U盘启动盘,从U盘启动,进入安装ubuntu界面,选择"try ubuntu"(切记不要安装),直接进入试用ubuntu界面,如下:

![在这里插入图片描述](pic/20190516182105245.png)

进入GParted,发现小钥匙不见了!
![在这里插入图片描述](pic/20190516182242813.jpg)
接下来,选中linux-swap,右键,选择"禁用交换空间/swapoff",小钥匙又不见了! 终于可以放心合并空间了.
![在这里插入图片描述](pic/20190516182901462.jpg)

右键fat32,选择"调整大小/移动":

![在这里插入图片描述](pic/2019051618455212.jpg)

![在这里插入图片描述](pic/20190516190624401.jpg)

这里有三个编辑框，分别是：

- Free Space Preceding: 代表从sda4压缩出未分配空间，并将其放在sda4的上方，即sda4与sda3之间
- New Size: 表示sda4的容量，若要从sda4压缩出未分配空间，该处为减去压缩值后的值
- Free Space following : 代表从sda4压缩出未分配空间，并将其放在sda4的下方，即sda4与sda5之间

由于小C已经提前压缩了未分配空间,这里只需将Free Space Preceding的容量剪切到Free Space following里,然后选择"resize/move"就可以了.
tip:若没有提前压缩,选择你想腾出空间的磁盘,只需将Free Space Preceding或Free Space following里填入需要压缩的容量(New Size里会自动计算剩余值),再把未分配空间一步步挪到根目录上方或下方就可以了.
![在这里插入图片描述](pic/20190516190738255.jpg)

可以看到未分配空间已经挪到了sdb4和sdb5之间,中间提示的警告可以忽略.同样的方法将其挪到根目录上方.如下:
![在这里插入图片描述](pic/20190516191139879.jpg)

右键ext4,选择"调整大小/移动":

![在这里插入图片描述](pic/20190516191324326.jpg)

将上方的条形框拉到最大,此时Free Space Preceding和Free Space following都为0,选择"resize/move".如下:

![在这里插入图片描述](pic/20190516191502174.jpg)

至此,调整工作完成! 如下图(根目录扩充到了490G). 但是别急,后面还有重要的
![在这里插入图片描述](pic/20190516191729482.jpg)

如果发现调整的不对,不用担心,点击上方橙色的箭头可以撤销,检查没有问题,点击绿色对号,将调整结果应用到整个系统.
![在这里插入图片描述](pic/20190516192105996.jpg)

进度条走完后,还有项非常重要的工作,敲小黑板啦~ 将linux-swap的小钥匙添加回来(右键-启动交换空间/swapon), 否则,重启系统会出错!

------------------------------------------------
![img](pic/20190516192605486.jpg)