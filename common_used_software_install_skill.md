

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
     export JAVA_HOME=/usr/local/jdk1.8.0_144
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

  1. 在官网下载<a href="https://www.jetbrains.com/idea/download/#section=linux">linux安装包</a>，community版的是免费的

  2. 解压到安装目录后到安装包的bin目录下打开终端，执行：

     ```
     sh ./idea.sh
     ```

  3. 设置部分自己视情况而定

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


# 5. Linux <a href="http://archive.cloudera.com/cdh5/cdh/5/hadoop-2.6.0-cdh5.9.3/hadoop-project-dist/hadoop-common/SingleCluster.html">Hadoop安装</a>

**Required Software** 

Required software for Linux include:

1. Java™ must be installed. Recommended Java versions are described at [ HadoopJavaVersions](http://wiki.apache.org/hadoop/HadoopJavaVersions).
2. ssh must be installed and sshd must be running to use the Hadoop scripts that manage remote Hadoop daemons.

**安装**

### 5.1 Java安装

- 解压安装包到 ~/app

- 设置 JAVA_HOME

  到根目录下执行：

  ```shell
  $ vi .bash_profile
  ```

  设置 JAVA_HOME

  ```
  export JAVA_HOME=/home/cxy/Hdp/app/jdk1.8.0_231
  export PATH=$JAVA_HOME/bin:$PATH
  ```

  保存退出，使设置生效：

  ```shell
  $ source .bash_profile
  ```

  测试：

  ```shell
  $ cd $JAVA_HOME
  or
  $ java -version
  ```

### 5.2  ssh免密登陆 

If your cluster doesn't have the requisite software you will need to install it.

For example on Ubuntu Linux:

```
  $ sudo apt-get install ssh
  $ sudo apt-get install rsync
```

`$ ssh localhost或者 $ ssh 主机名` （`$ exit退出`）都会要求输入密码，使得有些交互无法进行，故需要设置免密登陆。

免密配置：

zhu: 如果已经生成过ssh-key则不用生成了否则将把原来的覆盖，使有些操作失效。如git不能推送到远程仓库

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
-rw-------  1 cxy cxy 1679 11月 29 19:16 id_rsa  私钥
-rw-r--r--  1 cxy cxy  389 11月 29 19:16 id_rsa.pub 公钥
-rw-r--r--  1 cxy cxy 2354 11月 29 19:15 known_hosts

$ cat id_rsa.pub >> authorized_keys //复制id_rsa.pub 到 authorized_keys
$ chmod 600 authorized_keys //设置权限

/**测试**/
$ ssh Cxy  //不用输密码了
```

### 5.3 Hadoop安装

- 下载：http://archive.cloudera.com/cdh5/cdh/5/

  ​           hadoop-2.6.0-cdh5.9.3.tar.gz   hive-1.1.0-cdh5.9.3.tar.gz

- 解压到 ： ~/app

- **配置：**

  1)  **etc/hadoop-env.sh**

  ```
    # set to the root of your Java installation
    export JAVA_HOME=/usr/java/latest
  
    # Assuming your installation directory is /usr/local/hadoop
    export HADOOP_PREFIX=/usr/local/hadoop
  ```

  修改Hadoop配置文件, 添加HADOOP_HOME/bin到系统环境变量

  ```shell
  $ vi ~/app/hadoop-2.6.0-cdh5.9.3/etc/hadoop/hadoop-env.sh
  $ echo $JAVA_HOME //查看$JAVA_HOME（Linux系统自带Java）
  ```

  为了防止自动获取JAVA_HOME失败，手动添加。将原来的`export JAVA_HOME=${JAVA_HOME}`语句注释掉，改为(后面的地址写自己的JAVA_HOME地址)：

  ```shell
  export JAVA_HOME=/home/cxy/Hdp/app/jdk1.8.0_231
  ```

  2)  **etc/hadoop/core-site.xml**

  将下面<configuration></configuration>里的内容存到配置文件的<configuration></configuration>里

  ```
  <configuration>
      <property>
          <name>fs.defaultFS</name>
          <value>hdfs://localhost:8020</value>
      </property>
  </configuration>
  ```

  3) **etc/hadoop/hdfs-site.xml**

  ```
  <configuration>
      <property>
          <name>dfs.replication</name>
          <value>1</value>
      </property>
      
      <property>
          <name>hadoop.tmp.dir</name>
          <value>/home/cxy/Hdp/app/tmp</value>
      </property>
      
  </configuration>
  ```

  注：第二个属性中/home/cxy/Hdp/app/tmp路径用来存放临时文件，因为hadoop.tmp.dir的默认路径...tmp重启会被清空

  4)  **etc/hadoop/slaves**

  ```shell
  $ vi slaves
  ```

  将localhost改为你的主机名

  5) 到根目录下将Hadoop配置到环境变量

  ```shell
  $ vi ~/.bash_profile
  ```

  输入：

  ```
  export HADOOP_HOME=/home/cxy/Hdp/app/hadoop-2.6.0-cdh5.9.3
  export PATH=$HADOOP_HOME/bin:$PATH
  ```

  `:x`或`:wq`保存退出

  ```shell
   $ source ~/.bash_profile
  ```

  以上配置完成后，第一次启动Hadoop必须要格式化，格式化不要重复执行

  ```shell
  $ cd $HADOOP_HOME/bin
  $ hdfs namenode -format //格式化
  ```

  如果格式化没报错则配置完成

### 5.4 启动集群

执行$HADOOP_HOME/sbin/start-dfs.sh

```shell
$ ./start-dfs.sh
```

提示输入yes

```shell
$ jps
21364 DataNode
28201 Jps
21023 NameNode
```

DataNode，NameNode创建成功，启动成功

# 6. VS Code + Java开发

## 6.1 Maven

环境搭建：

extension：

Maven for Java;

创建project：

Ctrl + shift + p 或者左侧浏览器MAVEN PROJECT 处点 +  --> 选择 maven-archetype-quicksstart  --> 选择目录地址 --> 选择版本1.0 --> 选择包名

# 7. 如何使用VS Code编写Spring Boot

Java框架

浏览数:214

2019-7-24

​      本篇文章将教你如何使用VS Code编写Spring Boot程序。你不需要用Eclipse，也不需要用IDEA。已经习惯了VS，其他的IDE…… 但不得不说VS Code很厉害，一用就喜欢。微软给VS Code提供了编写Java的插件，你可以在VS Code上愉快地写Java。

### 一、环境搭建

（1） 安装Java、配置环境变量。（教程很多，这里不多说）

（2） 安装Maven和配置。参考<https://www.cnblogs.com/eagle6688/p/7838224.html>

（3） 安装VS Code

（4） 安装Java开发插件，配置VS Code的Java开发环境。（这一步微软替我们简化了，下载Vs Code Java安装程序，直接安装就可以编写Java代码了，下载连接 <http://aka.ms/vscode-java-installer-win> 此安装程序可以重复运行）

### 二、构建Maven项目

（1）访问 <http://start.spring.io/>

（2）选择Maven Project、Java、Spring Boot 版本 2.1.6，如图

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/MNBju2.png)

点击 Generate the Project 下载项目压缩包

 

（3）解压后用VS Code打开此文件夹

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/bAbmm2.png)

2.16版本官方推荐的项目结构如下：

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/VrE3qm.png)

目前用得更多的是类似这种结构：

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/fymaeu.png)

### 三、编写接口，输入Hello World

（1）pom.xml中添加支持web的模块，然后保存

```
`<dependency>``    ``<groupId>org.springframework.boot<``/groupId``>``    ``<artifactId>spring-boot-starter-web<``/artifactId``>``<``/dependency``>`
```

​       

保存后VS Code自动下载该模块，也可以右键pom.xml，点击Update project configuration手动更新配置      

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/M3A7by.png)

pom.xml 文件中默认有两个模块：

spring-boot-starter ：核心模块，包括自动配置支持、日志和 YAML，如果引入了 spring-boot-starter-web web 模块可以去掉此配置，因为 spring-boot-starter-web 自动依赖了 spring-boot-starter。

spring-boot-starter-test ：测试模块，包括 JUnit、Hamcrest、Mockito。

 

（2）编写Controller 内容

```
`@RestController``public class HelloWorldController {``    ``@RequestMapping(``"/hello"``)``    ``public String index() {``        ``return` `"Hello World"``;``    ``}``}`
```

@开头的是Spring的注解

@RestController 的意思就是 Controller 里面的方法都以 json 格式输出，不用再写什么 jackjson 配置的了。

@RequestMapping 用于映射Web请求，包括访问路径和参数，用于类或方法上。

 

（3）点调试，然后添加配置，自动生成启动Java配置文件

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/EJRV7b.png)

运行调试

![img](http://www.jqhtml.com/wp-content/uploads/2019/7/2iYNvq.png)

浏览器访问：<http://localhost:8080/hello>    成功输出Hello World

一切看上去都很简单，现在可以愉快地使用VS Code编写Spring Boot代码了

Demo GitHub地址：<https://github.com/ityouknow/spring-boot-examples/tree/master/spring-boot-helloWorld>

参考文章：<http://www.ityouknow.com/springboot/2016/01/06/spring-boot-quick-start.html>

推荐Spring Boot入门学习项目：<https://github.com/ityouknow/spring-boot-examples>

# 8. Tomcat安装

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

# 9. Mysql 安装

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
   > MySQL的服务已经开启了就直接打开的Navicat去连接
   >
   > ![新建的MySQL的连接](pic/%E6%96%B0%E5%BB%BA%E7%9A%84MySQL%E7%9A%84%E8%BF%9E%E6%8E%A5.png)
   >
   > **还记得刚刚让你复制的root @ localhost：后面的初始密码了吗？现在要用到它了复制粘贴上去！**
   >
   >

6. 修改密码

   在 Navicat 中双击连接名，修改密码

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

![IDEA连接Tomcat4](pic/IDEA连接Tomcat4.png)

![IDEA连接Tomcat5](pic/IDEA连接Tomcat5.png)

![IDEA连接Tomcat6](software_pic/IDEA连接Tomcat6.png)

注：Artifict在project structure里设置

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









