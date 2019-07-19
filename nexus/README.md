### 私服仓库设置
> 1. settings.xml
```
...
	 <server>
	   <id>snapshots</id>
	   <username>admin</username>
	   <password>admin123</password>
	</server>
...
```
> 1. pom.xml
```
	<distributionManagement>
		<repository>
			<id>releases</id>
			<url>http://192.168.1.38:31881/repository/maven-releases/</url>
		</repository>
		<snapshotRepository>
			<id>snapshots</id>
			<url>http://192.168.1.38:31881/repository/maven-snapshots/</url>
		</snapshotRepository>
	</distributionManagement>
```