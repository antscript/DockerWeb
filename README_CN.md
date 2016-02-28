![docker+nginx](https://github.com/antscript/DockerWeb/raw/master/img/dockerweb.png)
# What is DockerWeb ?
#### DockerWeb是一个静态网站搭建及部署工具.

#### 使用DockerWeb可以非常方便的在服务器/VPS/云主机上部署静态网站.

#### 并且可以通过Github或Bitbucket对网站进行自动更新.

***

# 功能特点
* **使用Docker container运行,易于维护，备份和迁移都极其方便**
* **使用非常简单** <a href="http://v.youku.com/v_show/id_XMTQ4NDUxNjcxNg==" target="_blank">通过DockerWeb五分钟搭建一个静态网站</a>
* **可通过Github或Bitbucket的webhook自动部署更新**

***

# 用法
* ### **Step 1**: Fork DockerWeb 并克隆到本地
如果是Bitbucket , 可直接从Github导入

* ### **Step 2**: 配置SSH (Github不需要)
复制本机或新生成一对id_rsa和id_rsa.pub到服务器的/root/.ssh/目录下

* ### **Step 3**: 配置HTTPS (如果需要https访问请配置)
复制ssl.crt和ssl.key到服务器

* ### **Step 4**: 编辑setup/config.sh为适合你的配置

* ### **Step 5**: 将仓库push到Github或Bitbucket

* ### **Step 6**: 添加webhook用于自动部署更新
```
#Github  
Setting -> Webhooks & services -> add webhook
Payload URL : http(s)://yourdomain.com:9000/hooks/your_webhook_id
```
```
#Bitbucket  
Setting -> Webhooks  -> Add webhook
Title : title you want
URL   : http(s)://yourdomain.com:9000/hooks/your_webhook_id
```

* ### **Step 7**: 登陆服务器，克隆你提交的仓库并运行setup/setup.sh

* ### **Step 8**: 访问你的网站

* ### **Step 9**: 使用Github或者Bitbucket进行部署更新

***

# 视频演示
* **通过DockerWeb五分钟搭建一个静态网站 :** 
<a href="http://v.youku.com/v_show/id_XMTQ4NDUxNjcxNg==" target="_blank">http://v.youku.com/v_show/id_XMTQ4NDUxNjcxNg==</a>
<a href="https://www.youtube.com/watch?v=VQmeIzExRco" target="_blank">https://www.youtube.com/watch?v=VQmeIzExRco</a>

***
# 3rd party tools
#### [https://github.com/adnanh/webhook](https://github.com/adnanh/webhook)