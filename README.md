

# SSM整合CRUD项目

## 前言介绍：

* SSM整合:Spring4 ,SpringMVC,MyBatis3

* CRUD:C(create)   R(retrieve)   U(update)   D(delete)

* 参考尚硅谷的ssm项目，自己实战

* 功能点：

  1、分页
  2、数据校验    jquery前端校验+JSR303后端校验
  3、 Ajax
  4、 Rest风格的URI；使用HTTP协议请求方式的动词，来表示对资源的操作（GET（查询）， POST（新增）， PUT（修改）， DELETE（删除））  

* 技术点：

  • 基础框架-ssm（SpringMVC+Spring+MyBatis）
  • 数据库-MySQL
  • 前端框架-bootstrap快速搭建简洁美观的界面
  • 项目的依赖管理-Maven
  • 分页-pagehelper
  • 逆向工程-MyBatis Generator  

* 后期工作：整合书城项目SSM

基础环境说明：

* win10
* jdk1.8
* maven3.6.3
* mysql 5.5
* idea 2020.2
* 参考链接：https://www.cnblogs.com/given-aj/p/13332764.html

## 1. 创建maven项目

### （1）建立本地maven仓库

（参考尚硅谷的maven教程，很详细）

### （2）设置maven仓库

在==创建项目之前设置==，不然maven创建后会先从默认仓库重新下载依赖包。

* ![image-20201220205549271](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220205549271.png)

  

  ![image-20201220205304344](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220205304344.png)

### （3）选择新建工程

选择maven，==不勾crate  from archetype==，看个人习惯，又看到教程这块，说要勾上的，问题不大。


![image-20201220204823711](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220204823711.png)

（4）项目设置

  ![image-20201220205027738](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220205027738.png)

  

（5）项目配置的说明（参考尚硅谷的maven教程）

  ![image-20201220205129832](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220205129832.png)

## 2. 创建web项目

### （1）右键模块，Add Framework Support 

![image-20201221170420750](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201221170420750.png)

### （2）添加web模块，

![image-20201221170640683](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201221170640683.png)



## 3. 引入项目依赖的jar包

可以在https://mvnrepository.com 仓库中搜索需要的jar包

### （1） 首先先有个大的标签

 <dependencies> 包含小的<dependency>

* 先导入常用的依赖包，后期有实际需要再导入。

* 版本上可以自己选择，mysql的对应驱动版本可能有局限，别选太高。

* 如果出现导入依赖时，报红，没有自动导入，例如

  ![image-20201220212407104](https://gitee.com/jayzou11223/cloud-image/raw/master/img/image-20201220212407104.png)

  solution：右侧maven窗口，刷新

  ![image-20201220213522189](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201220213522189.png)

### （2）spring,springMVC

  ```xml
  		<dependency>
              <groupId>org.springframework</groupId>
              <artifactId>spring-webmvc</artifactId>
              <version>4.2.5.RELEASE</version>
   		</dependency>
   
   		<!--spring-jdbc-->
          <dependency>
              <groupId>org.springframework</groupId>
              <artifactId>spring-jdbc</artifactId>
              <version>4.2.5.RELEASE</version>
          </dependency>
  
          <!--spring-面向切面-->
          <dependency>
              <groupId>org.springframework</groupId>
              <artifactId>spring-aspects</artifactId>
              <version>4.2.5.RELEASE</version>
          </dependency>
  ```

###  （3） mybatis

    ```xml
    		<!--Mybatis-->
            <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
            <dependency>
                <groupId>org.mybatis</groupId>
                <artifactId>mybatis</artifactId>
                <version>3.4.2</version>
            </dependency>
    
            <!--mybatis-spring-->
            <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
            <dependency>
                <groupId>org.mybatis</groupId>
                <artifactId>mybatis-spring</artifactId>
                <version>1.3.1</version>
            </dependency>
    ```

###  （4） 数据库连接池，驱动

      ```xml
      		<!--数据库连接池、驱动-->
              <!-- https://mvnrepository.com/artifact/com.mchange/c3p0 -->
              <dependency>
                  <groupId>com.mchange</groupId>
                  <artifactId>c3p0</artifactId>
                  <version>0.9.2.1</version>
              </dependency>
      
              <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
              <dependency>
                  <groupId>mysql</groupId>
                  <artifactId>mysql-connector-java</artifactId>
                  <version>5.1.41</version>
              </dependency>
      ```

###   （5）JSTL,servlet-api,junit

      ```xml
      		<!--jstl,servlet-api,junit-->
              <!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
              <dependency>
                  <groupId>javax.servlet</groupId>
                  <artifactId>jstl</artifactId>
                  <version>1.2</version>
              </dependency>
      
              <!-- https://mvnrepository.com/artifact/javax.servlet/servlet-api -->
              <dependency>
                  <groupId>javax.servlet</groupId>
                  <artifactId>servlet-api</artifactId>
                  <version>2.5</version>
                  <scope>provided</scope>
              </dependency>
      
              <!-- https://mvnrepository.com/artifact/junit/junit -->
              <dependency>
                  <groupId>junit</groupId>
                  <artifactId>junit</artifactId>
                  <version>4.12</version>
                  <scope>test</scope>
              </dependency>
      ```

### （6）引入bootstrap前端框架

  官网下载jar包



## 4. 配置Tomcat服务器，运行

### （1）选择建立本地Tomcat服务器。

（前提之前学习过web的项目建立，Tomcat已安装配置）

![image-20201221164826621](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221164826621.png)

![image-20201221171007439](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221171007439.png)

![image-20201221164746962](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221164746962.png)

### （2）进一步设置，浏览器访问地址等。

![image-20201221165032198](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221165032198.png)

![image-20201221165004084](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221165004084.png)

### （3）运行Tomcat服务器

可以在index.js中加一些内容，测试服务器是否正常运行。

### （4）如果报404错误：

* ![image-20201221171454713](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221171454713.png)

  我当前目录结构是这样的：

![image-20201221165311381](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221165311381.png)

* 在项目设置中，modules这一栏内，把报红的Web Resource Directorise这一栏改一下，右侧有修改的图标；到web这一级。

* ![image-20201221165227909](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221165227909.png)

![image-20201221113606426](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221113606426.png)

* 404错误2：

  （1）maven手动打包生成的target，然后Tomcat服务器运行时报404

  solution：让服务器热部署的时候，自动打包就能避免

  （2）









（5）如果有lib库报红的，建议按照流程重新来一次，熟悉流程。

## 5. 编写ssm整合的关键配置文件

* web.xml， spring,springmvc,mybatis，使用mybatis的逆向工程生成对应的bean以
  及mapper  (当前为基础配置，后面有需要再配置，不必一下子配置很多东西，这样有条理一些。)
* 首先建立起基本的项目结构：

![image-20201221221058188](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201221221058188.png)

###  （1）配置web.xml



![image-20201226102954134](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201226102954134.png)





```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">

    <!--1、启动spring的容器-->
    <!-- 设置配置文件的路径 -->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
    </context-param>
    <!-- 配置spring的监听器，默认只加载web-inf目录下的applicationContext.xml配置文件 -->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <!--2、springMVC的前端控制器，拦截所有请求-->
    <servlet>
        <servlet-name>dispatcherServlet</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    </servlet>

    <servlet-mapping>
        <servlet-name>dispatcherServlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

    <!--3、字符编码过滤器，一定要放在所有过滤器前面，过滤器有顺序-->
    <filter>
        <filter-name>CharacterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>utf-8</param-value>
        </init-param>
        <init-param>
            <param-name>forceEncoding</param-name>
            <param-value>true</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>CharacterEncodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!--4、使用rest风格，将页面普通的post请求，转为指定的delete或者put请求-->
    <filter>
        <filter-name>HiddenHttpMethodFilter</filter-name>
        <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>HiddenHttpMethodFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    <filter>
        <filter-name>HttpPutFormContentFilter</filter-name>
        <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>HttpPutFormContentFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

</web-app>

```

### （2）配置springMVC(applicationContext.xml)

这个文件需要放置在和web.xml同级目录下。namespace 会自动导入；

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <!--springMVC配置，包含网站跳转逻辑，配置-->
    <context:component-scan base-package="com.company" use-default-filters="false">
        <!--只扫描控制器-->
        <context:include-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>

    <!--配置视图解析器-->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"></property>
        <property name="suffix" value=".jsp"></property>
    </bean>

    <!--两个标准配置-->
    <!--将springmvc不能处理的请求交给tomcat-->
    <mvc:default-servlet-handler/>
    <!--能支持springMVC高级的一些功能，JSR303校验，快捷ajax，映射动态请求-->
    <mvc:annotation-driven/>

</beans>
```

### (3)配置spring（applicationContext.xml）

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

    <!--配置扫描除了controller的其他注解-->
    <context:component-scan base-package="com.company">
        <context:exclude-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>
    
    <!--spring 的配置文件，主要配置和业务相关的-->
    <!--================数据源，事务控制=============================-->
    <context:property-placeholder location="classpath:dbconfig.properties"/>
    <bean id="pooledDataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="jdbcUrl" value="${jdbc.jdbcUrl}"></property>
        <property name="driverClass" value="${jdbc.driverClass}"></property>
        <property name="user" value="${jdbc.user}"></property>
        <property name="password" value="${jdbc.password}"></property>
    </bean>


    <!--===================配置和mybatis的整合=================-->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <!--指定mybatis全局配置文件的位置-->
        <property name="configLocation" value="classpath:mybatis-config.xml"></property>
        <property name="dataSource" ref="pooledDataSource"></property>
        <!--指定mybatis,mapper文件的位置-->
        <property name="mapperLocations" value="classpath:mapper/*.xml"></property>
    </bean>

    <!--配置扫描器，将mybatis接口的实现加入到ioc容器中-->
    <bean  class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!--扫描所以dao接口的实现，加入到IOC容器中-->
        <property name="basePackage" value="com.company.crud.dao"></property>
    </bean>

    <!--====================================================================-->

    <!--==============事务控制的配置====================================-->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!--控制数据源-->
        <property name="dataSource" ref="pooledDataSource"></property>
    </bean>
    <!--开启具有注解的事务，使用xml配置形式的事务（主要是使用配置式）-->
    <aop:config>
        <!--切入点表达式-->
        <aop:pointcut id="txPoint" expression="execution(* com.company.crud.service..*(..))"/>
        <!--配置事务增强-->
        <aop:advisor advice-ref="txAdvice" pointcut-ref="txPoint"/>
    </aop:config>

    <!--配置事务增强，事务如何切入-->
    <tx:advice id="txAdvice" transaction-manager="transactionManager" >
        <tx:attributes>
            <!--所有方法都是事务方法-->
            <tx:method name="*"/>
            <!--以get开始的所有方法，只做查询，简单调优-->
            <tx:method name="get*" read-only="true"/>
        </tx:attributes>
    </tx:advice>

    <!--主要spring核心配置，mybatis整合，事务控制-->

</beans>
```

数据源配置（dbconfig.properties）

```properties
jdbc.jdbcUrl=jdbc:mysql://localhost:3306/book
jdbc.driverClass=com.mysql.jdbc.Driver
jdbc.user=root
jdbc.password=322309
```



## 6. 基础模块搭建

### （1）mybatis逆向工程（MBG）

在与pom.xml同级的目录下建立mbg.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <context id="DB2Tables" targetRuntime="MyBatis3">

        <!--去除set，get方法的注释-->
        <commentGenerator>
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>
        <!--配置数据库连接-->
        <jdbcConnection driverClass="com.mysql.jdbc.Driver" connectionURL="jdbc:mysql://localhost:3306/book"
                        userId="root" password="322309">

        </jdbcConnection>

        <javaTypeResolver>
            <property name="forceBigDecimals" value="false"/>
        </javaTypeResolver>

        <!--指定javaBean生成的位置-->
        <javaModelGenerator targetPackage="com.company.crud.bean" targetProject=".\src\main\java">
            <property name="enableSubPackages" value="true"/>
            <property name="trimStrings" value="true"/>
        </javaModelGenerator>

        <!--指定sql映射文件生成的位置-->
        <sqlMapGenerator targetPackage="mapper" targetProject=".\src\main\resources">
            <property name="enableSubPackages" value="true"/>
        </sqlMapGenerator>

        <!--指定dao接口生成的位置，mapper接口-->
        <javaClientGenerator type="XMLMAPPER" targetPackage="com.company.crud.dao" targetProject=".\src\main\java">
            <property name="enableSubPackages" value="true"/>
        </javaClientGenerator>
        
        <!--table指定每个表的生成策略-->
        <table tableName="t_book" domainObjectName="Books"></table>
        <table tableName="t_user" domainObjectName="Users"></table>



    </context>
</generatorConfiguration>
```

### （2）生成基本类和查询

在src/mian/java/com.company.crud.test目录下建个MBGTest类用来生成对应的MBG工程

```java
package com.company.crud.test;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author jayzou
 * @create 2020-12-22 16:16
 */
public class MBGTest {
    public static void main(String[] args) throws Exception {
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        //改成自己的MBG的配置xml文件名
        File configFile = new File("mbg.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }
}

```

### （3）测试Mapper(数据库内容自行创建)

```java
import com.company.crud.bean.Books;
import com.company.crud.bean.Users;
import com.company.crud.dao.BooksMapper;
import com.company.crud.dao.UsersMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;

/**测试DAO层
 * @author jayzou
 * @create 2020-12-22 16:58
 * 使用springtest进行测试，需要导入依赖包，自动注入组件
 * @ContextConfiguration指定spring配置文件的位置
 * 直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    BooksMapper booksMapper;

    @Autowired
    UsersMapper usersMapper;

    @Test
    public void testCURD(){

        System.out.println(booksMapper);
//        booksMapper.insertSelective(new Books(null,"javacode",new BigDecimal(120),"jayzou",12,12,"111"));
        Books books = booksMapper.selectByPrimaryKey(23);
        System.out.println(books);
        Users users = usersMapper.selectByPrimaryKey(3);
        System.out.println(users);
        System.out.println("success");

    }

}
```

### （4） 批量sqlSession

在applicationContext.xml中,mybatis后面配置

```xml
<!--配置一个可以执行批量的sqlSession-->
    <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
        <constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"></constructor-arg>
        <constructor-arg name="executorType" value="BATCH"></constructor-arg>
    </bean>
```



###  Error

* error1：@Test报红
* solution：将测试文件放在src/test/java/目录下（原因是Junit配置时设置了scope）





* error2：idea application context not configured for this file的问题

![img](https://img-blog.csdn.net/20180801203258687?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNDM3MTUy/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

* solution：

在project structure 中，配置

![image-20201222192937703](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201222192937703.png)





## 7. CRUD之查询

• 1、访问index.jsp页面
• 2、 index.jsp页面发送出查询员工列表请求
• 3、 BooksController来接受请求，查出员
• 4、 pageHelper分页插件完成分页查询功能
• 5、 来到list.jsp页面进行展示

URI： /books 

### (1)index.jsp

转发请求到/books

```java
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/books"></jsp:forward>
```

### (2)BooksController处理请求

1、建立getbooks方法，引入分页插件

```xml
<!--pagerhelper分页插件-->
        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper</artifactId>
            <version>5.0.0</version>
        </dependency>
```

2、在mybatis-config.xml中配置插件，主要配置的顺序，需要在typeAliases后面

```xml
	<plugins>
        <plugin interceptor="com.github.pagehelper.PageInterceptor"></plugin>
    </plugins>
```

3、根据三层架构，controller层依赖service层，service层调用dao层

建立BookService类

```java
 */
@Service
public class BookService {

    @Autowired
    BooksMapper booksMapper;

    /**
     * 查询所有书籍
     * @return
     */
    public List<Books> getAll() {
        return booksMapper.selectByExample(null);
    }
}
```



建立BooksController类

```java
@Controller
public class BooksController {

    @Autowired
    BookService bookService;

    /**
     * 查询所有书籍(分页查询),同时将数据保存在model中，给页面调用
     * @return
     */
    @RequestMapping("/books")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        //引入分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage 后面紧跟的查询就是一个分页查询
        List<Books> books = bookService.getAll();
        //使用pageInfo 包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的页面信息，包括有我们查询的数据，传入连续显示的页数
        PageInfo page = new PageInfo(books,5);
        model.addAttribute("pageInfo",page);
		//返回到list页面
        return "list";
    }
}
```

### (3) 利用spring，查询测试

1、src/test/java/目录下建立MVCTest类

```java
/**使用spring测试模块提高的测试请求功能，测试crud请求的正确性
 * @author jayzou
 * @create 2020-12-22 20:22
 */
//idea中dispatcherServlet-servlet.xml的路径注意和eclipse是不一样的，web目录是和src同级的目录。

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "file:web/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {

    //传入springMVC的IOC
    @Autowired
    WebApplicationContext context;
    //虚拟的MVC请求，获取到处理结果
    MockMvc mockMvc;
    //每次引入都要初始化，所以要加before注解
    //主要引入的是org.junit.Before包;
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/books").param("pn", "1")).andReturn();

        //请求成功后，请求域中会有pageInfo；
        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码："+pi.getPageNum());
        System.out.println("总页码："+pi.getPages());
        System.out.println("总记录数："+pi.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums = pi.getNavigatepageNums();
        for(int i: nums){
            System.out.println(" "+i);
        }

        //获取书籍数据
        List<Books> books = pi.getList();
        for(Books b:books){
            System.out.println("id:"+b.getId()+"==name:"+b.getName());
        }

    }

}

```

### Error

error：

![image-20201222204241615](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201222204241615.png)

solution：替换为servlet3.0

```xml
<!-- https://mvnrepository.com/artifact/javax.servlet/servlet-api -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>3.0.1</version>
            <scope>provided</scope>
        </dependency>
```





* 关于idea中web路径结果

（1）建立web 层路径的时候注意结构层次：

![image-20201222221105997](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201222221105997.png)

生成的out目录结构：

![image-20201223154501103](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201223154501103.png)



* 页面放在pages中；

* 静态的css样式，jQuery包，图片等等放在static中；
* WEB-INF目录下放置lib包，和web.xml；
* mbg.xml和pom.xml是和web文件同级目录
* index.jsp是在web文件下，和pages，static同级目录

![image-20201222221412229](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201222221412229.png)



![image-20201223111111101](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201223111111101.png)

由于我将list.jsp文件放在了pages/views/目录下，所以需要修改dispatchServlet-servlet.jsp

```xml
<!--配置视图解析器，方便页面放回-->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/pages/"></property>
        <property name="suffix" value=".jsp"></property>
    </bean>
```

以及在BooksController类的getBooks返回值，

```java
return "views/list";
```



Tips:

* spring mvc视图解析器的如何指定多个页面存放路径?（例如我的视图解析器配置的是在pages目录下，而我的list页面在pages/views目录下）

solution:

```
return 的时候写上views就可以
比如 “views/list”其实就是/pages/views/list.jsp 
```

* IDEA右键选择new新文件的时候没有JSP文件选项解决

  solution: web目录设置一下，可能还是原来的webapp，不对应。

![image-20201222214927712](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201222214927712.png)





（4）list.jsp 页面

​	在调整了目录结构后，首先建立一个head.jsp静态包含base标签，css样式，jquery文件，这样就不用每次加上base标签路径和引入样式，jQuery。

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String basePath = request.getScheme()
            +"://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
<!-- 写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">

<%--引入jQuery--%>
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<%--引入bootstrap样式--%>
<!-- Bootstrap -->
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
```

* href标签前面会自动加上http://localhost:8080/projectSSM/  ，所以注意后面href标签的地址

list.jsp

* 主要使用了bootstrap样式，pageHelper处理分页

```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jayzou11223
  Date: 2020/12/22
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题--%>
<%--以/开始的相对路径，找资源，以服务器的路径为标准，（http://localhost:3306）；--%>

<%--静态包含base标签，css，jQuery文件--%>
<%@include file="/pages/common/head.jsp"%>
<html>
<head>
    <title>首页</title>
</head>
<body>
    <%--搭建显示页面--%>
    <div class="container ">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SMM-Books-CRUD</h1>
            </div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-md-8 col-md-offset-8">
               <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>

        </div>
        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <%--添加bootstrap表格属性--%>
                <table class="table table-hover">
                    <tr>
                        <th>名称</th>
                        <th>价格</th>
                        <th>作者</th>
                        <th>销量</th>
                        <th>库存</th>
                        <th >操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="books">
                        <tr>
                            <th>${books.name}</th>
                            <th>${books.price}</th>
                            <th>${books.author}</th>
                            <th>${books.sales}</th>
                            <th>${books.stock}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <%--添加小图标--%>
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    删除</button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录
            </div>

            <%--分页条信息--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="books?pn=1">首页</a></li>
                        <%--判断是否有上一页--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="books?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                            <c:if test="${page_num==pageInfo.pageNum}">
                                <%--使得当前页不能被选中--%>
                                <li class="active" ><a href="#">${page_num}</a></li>
                            </c:if>
                            <c:if test="${page_num!=pageInfo.pageNum}">
                                <li><a href="books?pn=${page_num}">${page_num}</a></li>
                            </c:if>
                        </c:forEach>

                        <%--判断是否有下一页--%>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="books?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="books?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>

```

Notes：

* ``` jsp
  href="books?pn=${page_num}"
  ```

因为前面有base标签，所以拼接完整的地址是：http://localhost:8080/projectSSM/books?pn=${page_num}



## 8、查询-Ajax （返回json数据）

1、index.jsp页面直接发送ajax请求进行员工分页数据的查询

2、服务器将查出的数据，以json字符串的形式返回给浏览器

3、浏览器收到js字符串，可以使用js对json进行解析，使用js通过dom增删改改变页面

4、返回json，实现客户端的无关性。



### （1）修改BooksController类

将getBooks（）类的注解注释掉。建立新的方法，getBooksWithJson（），并且添加注解，

@ResponseBody注解是将返回的对象转化为json数据（需要导入Jackson包）

```xml
<!--返回json字符串的支持，Jackson-->
        <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
        <!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.11.2</version>
        </dependency>
```

为了返回的类的通用性，在com.company.crud.bean下建立Msg类

```java
package com.company.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**通用的返回的类
 * @author jayzou
 * @create 2020-12-23 19:28
 */
public class Msg {
    //状态码，100-成功， 200-失败
    private int code;
    //提示信息
    private String msg;

    //用户要返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String, Object>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;

    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;

    }

    //链式操作
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}

```



BooksController类

```java
/**
     * 导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/books")
    @ResponseBody
    public Msg getBooksWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //引入分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage 后面紧跟的查询就是一个分页查询
        List<Books> books = bookService.getAll();
        //使用pageInfo 包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的页面信息，包括有我们查询的数据，传入连续显示的页数
        PageInfo page = new PageInfo(books,5);

        return Msg.success().add("pageInfo",page);
    }
```



### Error

* HTTP Status 500 - Request processing failed; nested exception is java.lang.IllegalArgumentException: No converter found for return value of type: class com.github.pagehelper.PageInfo

solution：
idea在web开发时，有时候不会自动把jar包发送到tomcat，这时只需要自己在Project Structure->Artifacts->Put into /WEB-INF/lib自己发下jar包就好了

可能的情况就是，右侧有包没有上传到服务器上，仔细看看左侧确实少了Jackson的包。

![image-20201223200022846](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201223200022846.png)



Tips：

* 路径问题

1、不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题

以此为例：

![image-20201223211812194](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201223211812194.png)

```xml
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
```

不以/开头，因为当前在web目录下，而web目录对应了http://localhost:8080/projectSSM/

所以此处能识别；

同理：此处的url也是一样，因为index.jsp在web目录下；

```xml
<script type="text/javascript">
        $(function (){
            $.ajax({
                url:"books",
                data:"pn=2",
                type:"GET",
                success:function (result){
                    console.log(result);
                }
            });
        });
    </script>
```



2、以/开始的相对路径，找资源，以服务器的路径为标准，（http://localhost:3306）

如果服务器设置的url是想工程下（例如http://localhost:8080/projectSSM/），此时直接/books就会少一级工程的目录导致找不到文件。

例如：

```xml
<script type="text/javascript">
        $(function (){
            $.ajax({
                url:"/projectSSM/books",
                data:"pn=4",
                type:"GET",
                success:function (result){
                    console.log(result);
                }
            });
        });
    </script>
```



或者利用basePath标签路径来做。



```jsp
<%
    String basePath = request.getScheme()
            +"://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
```



```xml
<script type="text/javascript">
        $(function (){
            $.ajax({
                url:"${basePath}books",
                data:"pn=3",
                type:"GET",
                success:function (result){
                    console.log(result);
                }
            });
        });
    </script>
```

### （2）重写index.jsp

​	将原来的index页面重命名为index-2,然后统计下新建一个index页面，将list页面的内容复制过来；

重写index

```jsp
<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jayzou11223
  Date: 2020/12/22
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题--%>
<%--以/开始的相对路径，找资源，以服务器的路径为标准，（http://localhost:3306）；--%>

<%--静态包含base标签，css，jQuery文件--%>
<%@include file="/pages/common/head.jsp"%>



<html>
<head>
    <title>首页</title>
</head>
<body>
<%--搭建显示页面--%>
<div class="container ">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SMM-Books-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-8 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <%--添加bootstrap表格属性--%>
            <table class="table table-hover" id="books_table">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>价格</th>
                    <th>作者</th>
                    <th>销量</th>
                    <th>库存</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>

        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>

    </div>
</div>

    <script type="text/javascript">
        $(function (){
            to_page(1);
        });

        function to_page(pn){
            $.ajax({
                url:"${basePath}books",
                data:"pn="+pn,
                type:"GET",
                success:function (result){
                    // console.log(result);
                    build_books_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        }

        function build_books_table(result){
            //清空table表格
            $("#books_table tbody").empty();
            var books = result.extend.pageInfo.list;
            $.each(books,function (index,item){
                var bookNameTd = $("<td></td>").append(item.name);
                var bookPriceTd = $("<td></td>").append(item.price);
                var bookAuthorTd = $("<td></td>").append(item.author);
                var bookSalesTd = $("<td></td>").append(item.sales);
                var bookStockTd = $("<td></td>").append(item.stock);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                                .append("编辑");

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-remove"))
                    .append("删除");

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(bookNameTd)
                .append(bookPriceTd)
                .append(bookAuthorTd)
                .append(bookSalesTd)
                .append(bookStockTd)
                .append(btnTd)
                .appendTo("#books_table tbody");


            });
        }

        function build_page_info(result){
            //清空分页文字信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+
                    result.extend.pageInfo.pages+"页，总"+
                    result.extend.pageInfo.total+"条记录");


        }

        function build_page_nav(result){
            //清空分页条表格page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disable");
                prePageLi.addClass("disable");

            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function (){
                    to_page(1);
                });
                prePageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disable");
                lastPageLi.addClass("disable");
            }else{
                nextPageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function (){
                    to_page(result.extend.pageInfo.pages)
                });
            }

            //添加首页 和前一页
            ul.append(firstPageLi).append(prePageLi);
            //添加中间页码
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function (){
                    to_page(item);
                });
                ul.append(numLi);
            });
            //ul内添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);
            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }
    </script>
</body>
</html>

```



effect:

![image-20201224111010151](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201224111010151.png)

Tips:

* ```jsp
  var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
  ```

  append 的时候注意位置，是对应什么标签的添加，可以对应的看原来的list页面，例如

  上一页的标签是在<li>标签的<a>标签内部的.





## 9、新增功能

1、在index.jsp页面点击”新增”
2、弹出新增对话框
3、用户输入数据，并进行校验
	 jquery前端校验， ajax用户名重复校验，重要数据（后端校验(JSR303)，唯一约束）；
4、完成保存  

URI: festful风格
• /emp/{id} GET 查询员工
• /emp POST 保存员工
• /emp/{id} PUT 修改员工
• /emp/{id} DELETE 删除员工  

### （1）弹出新增对话框

```jsp
<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jayzou11223
  Date: 2020/12/22
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题--%>
<%--以/开始的相对路径，找资源，以服务器的路径为标准，（http://localhost:3306）；--%>

<%--静态包含base标签，css，jQuery文件--%>
<%@include file="/pages/common/head.jsp"%>



<html>
<head>
    <title>首页</title>
</head>
<body>

<!-- 商品新增Modal -->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">商品添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookName</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="bookName_add_input" placeholder="bookName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookPrice</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="bookPrice_add_input" placeholder="bookPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookAuthor</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" id="bookAuthor_add_input" placeholder="bookAuthor">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookSales</label>
                        <div class="col-sm-10">
                            <input type="text" name="sales" class="form-control" id="bookSales_add_input" placeholder="bookSales">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookStock</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock" class="form-control" id="bookStock_add_input" placeholder="bookStock">
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="book_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--搭建显示页面--%>
<div class="container ">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SMM-Books-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-8 col-md-offset-8">
            <button class="btn btn-primary" id="book_add_modal_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <%--添加bootstrap表格属性--%>
            <table class="table table-hover" id="books_table">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>价格</th>
                    <th>作者</th>
                    <th>销量</th>
                    <th>库存</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>

        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>

    </div>
</div>

    <script type="text/javascript">

        var totalRecord;

        $(function (){
            to_page(66);
        });

        function to_page(pn){
            $.ajax({
                url:"${basePath}books",
                data:"pn="+pn,
                type:"GET",
                success:function (result){
                    // console.log(result);
                    build_books_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        }

        function build_books_table(result){
            //清空table表格
            $("#books_table tbody").empty();
            var books = result.extend.pageInfo.list;
            $.each(books,function (index,item){
                var bookNameTd = $("<td></td>").append(item.name);
                var bookPriceTd = $("<td></td>").append(item.price);
                var bookAuthorTd = $("<td></td>").append(item.author);
                var bookSalesTd = $("<td></td>").append(item.sales);
                var bookStockTd = $("<td></td>").append(item.stock);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                                .append("编辑");

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-remove"))
                    .append("删除");

                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                $("<tr></tr>").append(bookNameTd)
                .append(bookPriceTd)
                .append(bookAuthorTd)
                .append(bookSalesTd)
                .append(bookStockTd)
                .append(btnTd)
                .appendTo("#books_table tbody");


            });
        }

        function build_page_info(result){
            //清空分页文字信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+
                    result.extend.pageInfo.pages+"页，总"+
                    result.extend.pageInfo.total+"条记录");
            totalRecord = result.extend.pageInfo.total;


        }

        function build_page_nav(result){
            //清空分页条表格page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disable");
                prePageLi.addClass("disable");

            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function (){
                    to_page(1);
                });
                prePageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disable");
                lastPageLi.addClass("disable");
            }else{
                nextPageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function (){
                    to_page(result.extend.pageInfo.pages)
                });
            }

            //添加首页 和前一页
            ul.append(firstPageLi).append(prePageLi);
            //添加中间页码
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function (){
                    to_page(item);
                });
                ul.append(numLi);
            });

            //ul内添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");

        }

        //点击新增按钮弹出模态框
        $("#book_add_modal_btn").click(function (){
            //可以在这里发送ajax请求，查询一些信息，显示在模态框里。

            //弹出模态框
            $("#bookAddModal").modal({
                backdrop:"static"
            });

        });

        $("#book_save_btn").click(function (){
            //模态框中填写的表单数据提交到服务器进行保存

            //发送ajax请求保存员工
            $.ajax({
                url:"book",
                type: "POST",
                data:$("#bookAddModal form").serialize(),
                success:function (result){
                    alert(result.msg);
                    $("#bookAddModal").modal('hide');
                    //处理页数合理化失效?
                    //需要配置pageHelper属性，reasonable=true
                    to_page(totalRecord);
                }
            });
        });

    </script>

</body>
</html>

```



### （2）BooksController和BookService

* BooksController

```java 
@RequestMapping(value = "/book",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveBook(Books books){
        System.out.println(books);
        bookService.saveBook(books);
        return Msg.success();
    }
```

* BookService

```java
public void saveBook(Books books) {
         booksMapper.insertSelective(books);

    }
```



### （3）数据验证

* 可以前端验证和后端验证。

  点击保存的事件中

  （1）先是前端验证，利用正则表达式，在点击保存的时候，验证输入信息是否符合要求

  （2）在保存事件判断change事件的一个标签，因为在保存事件外有一个用户名的输入框绑定change事件，然后发送ajax请求给后端，再次用正则化表达式判断是否符合格式要求，然后是数据库用户名重复验证，返回结果result给前端，这个结果中包含了状态码，可以判断用户名是否可用。

  （3）点击保存的发送ajax请求，进行JSR303校验，（因为是前端的校验，可以打开审查元素，手动修改等，不安全），然后在指定的属性加上Pattern，利用正则表达式（注意转义字符）来自定义约束规则。

验证后端新增的商品名称是否重复：





* index.jsp

```javascript
//点击新增按钮弹出模态框
        $("#book_add_modal_btn").click(function (){
            //可以在这里发送ajax请求，查询一些信息，显示在模态框里。
            reset_form("#bookAddModal form");
            //弹出模态框
            $("#bookAddModal").modal({
                backdrop:"static"
            });

        });


        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验商品名称是否可用
        $("#bookName_add_input").change(function (){
            //发送ajax请求校验商品名称是否可用
            var bookName = this.value;
            $.ajax({
                url:"checkBookName",
                data:"bookName="+bookName,
                type:"POST",
                success:function (result){
                    if(result.code == 100){
                        show_validate_msg("#bookName_add_input","success","商品名称可用");
                        $("#book_save_btn").attr("ajax-va","success");
                    }else {
                        show_validate_msg("#bookName_add_input","error",result.extend.va_msg);
                        $("#book_save_btn").attr("ajax-va","error");
                    }

                }
            });
        });




        //保存新增商品
        $("#book_save_btn").click(function (){
            //模态框中填写的表单数据提交到服务器进行保存

            //验证商品名称是否重复
            if($(this).attr("ajax-va")=="error"){
                return  false;
            }
            //发送ajax请求保存员工
            $.ajax({
                url:"book",
                type: "POST",
                data:$("#bookAddModal form").serialize(),
                success:function (result){
                    //alert(result.msg);
                    $("#bookAddModal").modal('hide');
                    //处理页数合理化失效？
                    to_page(totalRecord);
                }
            });
        });
```



* BooksController.java

```java
/**
     * 校验商品名称是否可用
     * @param bookName
     * @return
     */
    @RequestMapping("/checkBookName")
    @ResponseBody
    public Msg checkBookName(@RequestParam("bookName") String bookName){
        boolean b = bookService.checkBook(bookName);
        if(b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","商品名称重复");
        }

    }
```

* BookService

```java
/**
     * 校验商品名称是否可用
     * @param bookName
     * @return
     */
    public boolean checkBook(String bookName) {
        //
        BooksExample booksExample = new BooksExample();
        //利用example中的criteria去拼装sql查询
        BooksExample.Criteria criteria = booksExample.createCriteria();
        criteria.andNameEqualTo(bookName);
        long count = booksMapper.countByExample(booksExample);
        return count == 0;

    }
```

















### Error：

* 跳转到最后一页时，没有显示页数合理化：

  前面忘记配置page插件的页数合理化

  ```xml
  <plugins>
          <plugin interceptor="com.github.pagehelper.PageInterceptor">
              <!--分页参数合理化-->
              <property name="reasonable" value="true"/>
          </plugin>
      </plugins>
  ```

  

* 数据库数据没有更新，插入数据失效？

  用mysql查看数据库的时候，会自动分页显示，所以还是用命令查好一些。



* 如果信息没有显示在页面上，可能是便签的引用，需要加#，以及变量的名称是否前后端对应。



* (index):323 Uncaught TypeError: $(...).atrr is not a function

大意了，attr写错了，遇到此类问题，也有可能是js引入到放在bootstrap前面引入，

或者就是你的函数名调用错了。



### Tips:

* 关于idea中Tomcat热部署

**On Update action**：

​		当手动触发更新操作时，idea要做的事。

- Update resources
  更新静态资源文件，如html css js等
- Update classes and resources和静态资源文件
  更新java类，jsp和静态资源文件
- Redeploy
  重新部署，删除war包，重新创建并部署war包，但不重启服务器
- Restart server
  重启服务器，以上所有都更新

**On frame deactivation**：

​		当idea失去焦点时，idea要做的事。

​		一般设置为Do nothing ，因为开发过程中难免会不停的切换窗口，如果每失去一次焦点，idea就重新加载文件，这给cpu造成了很大的负担。







## 10、修改功能

1、点击编辑
2、弹出用户修改的模态框（显示用户信息）
3、点击更新，完成用户修改  

* index

修改的模态框

```javascript
<!-- 商品编辑Modal -->
<div class="modal fade" id="bookUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >商品修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookName</label>
                        <div class="col-sm-10">
                            <P class="form-control-static" id="bookName_update_static"></P>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookPrice</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="bookPrice_update_input" placeholder="bookPrice">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookAuthor</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" id="bookAuthor_update_input" placeholder="bookAuthor">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookSales</label>
                        <div class="col-sm-10">
                            <input type="text" name="sales" class="form-control" id="bookSales_update_input" placeholder="bookSales">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">bookStock</label>
                        <div class="col-sm-10">
                            <input type="text" name="stock" class="form-control" id="bookStock_update_input" placeholder="bookStock">
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="book_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
```

绑定事件：

```javascript
//修改商品信息
        //我们是在按钮创建之前想去用click绑定按钮，但是绑定不了
        //如果想在创建按钮的时候绑定，使用.live()
        //jQuery新版没有了live，使用on替代。
        $(document).on("click",".edit_btn",function (){
            //查出商品信息，显示信息在页面上
            getBook($(this).attr("edit-id"));
            //把商品的id传递给模态框的更新按钮,
            // 将需要更新的id传给后端，url上添加。
            $("#book_update_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#bookUpdateModal").modal({
                backdrop: "static"
            });

        });

        function getBook(id){
            $.ajax({
                url:"book/"+id,
                type:"GET",
                success:function (result){
                    var bookData = result.extend.books;
                    $("#bookName_update_static").text(bookData.name);
                    $("#bookPrice_update_input").text(bookData.price);
                    $("#bookAuthor_update_input").text(bookData.author);
                    $("#bookSales_update_input").text(bookData.sales);
                    $("#bookStock_update_input").text(bookData.stock);
                }
            });

        }


        $("#book_update_btn").click(function (){

            $.ajax({
                url:"book/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#bookUpdateModal form").serialize(),
                success:function (result){
                    //关闭对话框
                    $("#bookUpdateModal").modal("hide");
                    //回到本页
                    to_page(currentPage);
                }
            });
        });
```

* BooksController

```java
@RequestMapping(value = "/book/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getBook(@PathVariable("id") Integer id){
        Books books = bookService.getBook(id);
        return Msg.success().add("books",books);
    }
```

注意update使用put请求：

```java 
如果直接发送ajax=PUT形式的请求
*   * 封装的数据
*   * Employee
*   * [empId=1014, empName=null, gender=null, email=null, dId=null]
*   *
*   * 问题：
*   * 请求体中有数据；
*   * 但是Employee对象封装不上；
*   * update tbl_emp  where emp_id = 1014;
*   *
*   * 原因：
*   * Tomcat：
*   *        1、将请求体中的数据，封装一个map。
*   *        2、request.getParameter("empName")就会从这个map中取值。
*   *        3、SpringMVC封装POJO对象的时候。
*   *              会把POJO中每个属性的值，利用request.getParamter("email")拿到;
*   * AJAX发送PUT请求引发的血案：
*   *        PUT请求，请求体中的数据，request.getParameter("empName")拿不到
*   *        Tomcat一看是PUT，不会封装请求体中的数据为map，只有POST形式的请求才封装请求体			为map
*   * org.apache.catalina.connector.Request--parseParameters() (3111);
*   *
*   * protected String parseBodyMethods = "POST";默认解析的时候，只看请求是否包含post字		段
*   * if( !getConnector().isParseBodyMethod(getMethod()) ) {
*                 success = true;
*                 return;
*             }
*   *
*   *
*   * 解决方案:
*   *
*   * （1）利用rest风格过滤器，HiddenHttpMenthodFilter，将普通的post请求，转为指定的delete或者put请求
*   * 但是需要在ajax中type还是写成post，然后在data后面加上/method=PUT;
*   *
*   * （2）我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
*   * 1、配置上HttpPutFormContentFilter；
*   * 2、他的作用；将请求体中的数据解析包装成一个map。
*   * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
*
*
*
```

* web.xml

```xml
<!--只是为了解决put请求的问题-->
    <filter>
        <filter-name>HttpPutFormContentFilter</filter-name>
        <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>HttpPutFormContentFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
```

* BookService

```java
public void updateBooks(Books books) {
        booksMapper.updateByPrimaryKeySelective(books);
    }
```



Tips:

* 如果遇到404错误，看看url地址是否前后端对应。可以F12，查看具体哪里出错了。







## 11、删除功能

1、单个删除
URI:/emp/{id} DELETE

2、单选，多选，全选

3、批量删除  

注：自行在标签上添加上属性，

（1）单个删除

index：

```js
//单个删除
        $(document).on("click",".delete_btn",function (){
            //弹出是否确认删除的对话框，从0开始
            var bookName = $(this).parents("tr").find("td:eq(1)").text();
            var bookId = $(this).attr("del-id");
            if(confirm("确认删除【"+bookName+"】吗？")){
                $.ajax({
                    url:"book/"+bookId,
                    type:"DELETE",
                    success:function (result){
                        //alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });
```



BooksController

单个删除和多选删除复用。

```java
@ResponseBody
    @RequestMapping(value = "/book/{ids}",method = RequestMethod.DELETE)
    public Msg deleteBook(@PathVariable("ids") String ids){
        //批量删除
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<Integer>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for(String str:str_ids){
                del_ids.add(Integer.parseInt(str));
            }
            bookService.deleteBooksBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            bookService.deleteBooks(id);
        }

        return Msg.success();
    }
```

BookService

```java
public void deleteBooksBatch(List<Integer> del_ids) {
        BooksExample example = new BooksExample();
        BooksExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        booksMapper.deleteByExample(example);
    }

    public void deleteBooks(Integer id) {
        booksMapper.deleteByPrimaryKey(id);
    }
```



(2)全选，全不选等

```js
 //全选、全不选
        $("#check_all").click(function (){
            //attr获取checked属性是undefined
            //attr主要是获取自定义的属性值
            //prop修改和读取dom属性的值
            //让全选的按钮的值来赋给单选框的值，就能实现全选、全不选
            //checked是属性名
            $(".check_item").prop("checked",$(this).prop("checked"));
        });

        $(document).on("click",".check_item",function (){
            //判断当前选择中的元素是否为当前页码的显示商品个数，
            //当本页面全部商品选中时，全选框也选中
            //   ：check选择器，可以得到选中的单选框
            //alert($(this).parents("tr").find("td:eq(6)").find("button:eq(1)").attr("del-id"));
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
        });
```



(3)批量删除

```js
//单击全部删除，就批量删除
        $("#book_delete_all_btn").click(function (){
            var bookNames ="";
            var del_idstr = "";
            $.each($(".check_item:checked"),function (){
                bookNames += $(this).parents("tr").find("td:eq(1)").text()+",";
         //有趣，前端的内容，只要你想得到，总归能得到的。加标签，加属性，遍历表单等等。哈哈
         //因为我没有在页面显示id信息，但是del-id标记了当前元素的id,那么就可以遍历得到，
         // 首先找到当前勾选框元素的父标签：tr标签，然后找到对应的这一行，
         // 然后在这一行里找第2个button，然后读取自定义的del-id值。
                del_idstr += $(this).parents("tr").find("td:eq(6)").find("button:eq(1)").attr("del-id")+"-";
                //$(this).parents("tr").find("td:eq(6)").attr("del-id")
            });

            //去除两个字符串最后多余的：， -
            bookNames = bookNames.substring(0,bookNames.length-1);
            del_idstr = del_idstr.substring(0,del_idstr.length-1);
            //alert(del_idstr);
            if(confirm("确认删除【"+del_idstr+"】吗？")){
                $.ajax({
                    url:"book/"+del_idstr,
                    type:"DELETE",
                    success:function (result){
                        alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        });
```









Tips:

* @PathVariable和@RequestParam的区别

PathVariable只能用于接收url路径上的参数，而RequestParam只能用于接收请求带的params



PathVariable:

![image-20201227203731091](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201227203731091.png)

![image-20201227203750171](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201227203750171.png)

RequestParam:

![image-20201227203633658](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201227203633658.png)

![image-20201227203707634](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201227203707634.png)



## 12、总结



**![image-20201225221931998](C:\Users\Lx_重剑无锋\AppData\Roaming\Typora\typora-user-images\image-20201225221931998.png)**



Tips：

* maven管理

maven可以install将项目打包war，然后可以将这个war包直接复制到Tomcat的服务器中，然后运行服务器就能将war包自动转为项目文件，

idea中的服务器是镜像服务器；



* 单词理解
  applicationcontext： 应用上下文，spring容器整合springMVC，mybatis

  dispatherservlet：调度服务程序，springMVC调度，解析



* 静态资源导出问题，maven资源过滤设置，pom.xml中

```xml
<build>
   <resources>
       <resource>
           <directory>src/main/java</directory>
           <includes>
               <include>**/*.properties</include>
               <include>**/*.xml</include>
           </includes>
           <filtering>false</filtering>
       </resource>
       <resource>
           <directory>src/main/resources</directory>
           <includes>
               <include>**/*.properties</include>
               <include>**/*.xml</include>
           </includes>
           <filtering>false</filtering>
       </resource>
   </resources>
</build>
```

* mysql8.0+，配置时需要加时区的配置；

&serverTimezone=Asia/Shanghai



* 用mysql查看数据库的时候，会自动分页显示，所以还是用命令查好一些。
