### elasticsearch 中文分词
https://github.com/medcl/elasticsearch-analysis-ik/releases

> 1. 下载中文分词
```
wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip
```
> 2. 修改配置
```
[elasticsearch]# unzip elasticsearch-analysis-ik-6.2.2.zip -d ik

[elasticsearch]# vi ik/config/IKAnalyzer.cfg.xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
        <comment>IK Analyzer 扩展配置</comment>
        <!--用户可以在这里配置自己的扩展字典 -->
        <entry key="ext_dict"></entry>
         <!--用户可以在这里配置自己的扩展停止词字典-->
        <entry key="ext_stopwords"></entry>
        <!--用户可以在这里配置远程扩展字典 -->
        <!-- <entry key="remote_ext_dict">words_location</entry> -->
        <!--用户可以在这里配置远程扩展停止词字典-->
        <!-- <entry key="remote_ext_stopwords">words_location</entry> -->
</properties>

[elasticsearch]# tar -zcf ik.tar.gz ik
```

> 3. 制作elasticsearch镜像
```
docker build -t es-ik:6.2.2 es-ik
```