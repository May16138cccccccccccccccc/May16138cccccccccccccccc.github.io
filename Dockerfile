# 编写一个Dockerfile，其中包含一个LABEL指令，用于设置镜像的作者信息。
#FROM ubuntu:latest
#LABEL authors="Administrator"
#
#ENTRYPOINT ["top", "-b"]
# 基于Ubuntu 16.04镜像构建一个Docker镜像，并在其中设置作者信息。
FROM ubuntu:16.04
# 设置作者信息  label是元数据，可以设置多个，key和value用冒号分隔
LABEL author="May"
LABEL maintainer="https://blog.csdn.net/weixin_53538280?spm=1011.2124.3001.5343"
# 重新构建缓存
LABEL version="1.0"
LABEL date="2025-04-18"
ENV REFRESHED_AT 2025-04-18

# 安装所需的软件包  更新，下载ruby（模板需要的工具），安装jekyll包
# 安装ruby和jekyll
RUN apt-get -qq update
RUN apt-get -qq install ruby ruby-dev libffi-dev build-essential nodejs
RUN gem install --no-rdoc --no-ri jekyll -v 2.5.3
# DATA 放网站源代码
VOLUME /data
VOLUME /var/www/html
WORKDIR /data

ENTRYPOINT [ "jekyll", "build", "--destination=/var/www/html" ]

EXPOSE 4000

CMD ["jekyll", "serve", "--host=0.0.0.0", "--port=4000"]