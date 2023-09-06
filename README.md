# 部署手册

## 基础环境准备

命令基于以下环境运行，供参考

- CentOS 7.9
- Docker 23.0.1
- Docker Compose v2+

![image-20230906105735644](images/image-20230906105735644.png)

### 端口说明

脚本中将用到以下端口，确保宿主机以下端口可用，未被占用

|       端口       |        说明         |
| :--------------: | :-----------------: |
|        80        |      Nginx服务      |
|       8500       | Consul 注册中心服务 |
| 8070、8080、8090 | Apollo 配置中心服务 |
|       3306       |     MySql 服务      |
|       6379       |     Redis 服务      |
|                  |                     |
|                  |                     |
|                  |                     |
|                  |                     |

## 修改应用地址

修改 `项目文件夹/mysql/sql/cloud.sql` 文件，将脚本中最后一行 https://www.baidu.com 替换为 测试应用的首页地址

```sql
-- 请将 https://www.baidu.com 替换为 测试应用的首页地址
INSERT INTO `t_app_route`(`Id`, `appid`, `url`, `default`) VALUES ('38c48347-4434-4c5a-bdce-85bd0668e452', 'dev', 'https://www.baidu.com', b'1');
```

## 启动服务

```shell
# 在项目根目录执行以下命令启动服务
docker compose up -d
```

## 重新部署

如部署后修改配置未生效可以尝试重新部署

```shell
# 在项目更目录执行以下命令

# 删除相关容器
docker compose down
# 重新部署容器
docker compose up -d
```

