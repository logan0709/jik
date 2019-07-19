#! /bin/bash
cat >> /var/www/html/zentaopms/config/my.php <<EOF
<?php
\$config->installed       = true;
\$config->debug           = false;
\$config->requestType     = 'GET';
\$config->timezone        = 'Asia/Shanghai';
\$config->db->host        = '$MYSQL_HOST';
\$config->db->port        = '$MYSQL_PORT';
\$config->db->name        = 'zentao';
\$config->db->user        = '$MYSQL_USER';
\$config->db->password    = '$MYSQL_PASSWORD';
\$config->db->prefix      = 'zt_';
\$config->webRoot         = getWebRoot();
\$config->default->lang   = 'zh-cn';
EOF