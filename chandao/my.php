<?php
$config->installed       = true;
$config->debug           = false;
$config->requestType     = 'GET';
$config->timezone        = 'Asia/Shanghai';
$config->db->host        = '10.96.10.101';
$config->db->port        = '3306';
$config->db->name        = 'zentao';
$config->db->user        = 'root';
$config->db->password    = 'weilus';
$config->db->prefix      = 'zt_';
$config->webRoot         = getWebRoot();
$config->default->lang   = 'zh-cn';