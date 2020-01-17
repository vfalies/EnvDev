<?php

class Server
{
    private $informations;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->informations = new stdClass;
    }

    public function getInformations()
    {
        $this->informations->projects_path     = getenv('PROJECTS_PATH')     !== false ? getenv('PROJECTS_PATH')    : null;
        $this->informations->php               = getenv('PHP_VERSION')       !== false ? getenv('PHP_VERSION')      : null;
        $this->informations->php_ip            = getenv('PHP_STATIC_IP')     !== false ? getenv('PHP_STATIC_IP')    : null;
        $this->informations->webserver         = getenv('WEB_SERVER')        !== false ? getenv('WEB_SERVER')       : null;
        $this->informations->webserver_version = getenv('WEB_VERSION')       !== false ? getenv('WEB_VERSION')      : null;
        $this->informations->webserver_ip      = getenv('WEB_STATIC_IP')     !== false ? getenv('WEB_STATIC_IP')    : null;
        $this->informations->cache             = getenv('CACHE_SERVER')      !== false ? getenv('CACHE_SERVER')     : null;
        $this->informations->cache_version     = getenv('CACHE_VERSION')     !== false ? getenv('CACHE_VERSION')    : null;
        $this->informations->cache_ip          = getenv('CACHE_STATIC_IP')   !== false ? getenv('CACHE_STATIC_IP')  : null;
        $this->informations->db                = getenv('DB_SERVER')         !== false ? getenv('DB_SERVER')        : null;
        $this->informations->db_version        = getenv('DB_VERSION')        !== false ? getenv('DB_VERSION')       : null;
        $this->informations->db_ip             = getenv('DB_STATIC_IP')      !== false ? getenv('DB_STATIC_IP')     : null;
        $this->informations->queuer            = getenv('QUEUER_SERVER')     !== false ? getenv('QUEUER_SERVER')    : null;
        $this->informations->queuer_ip         = getenv('QUEUER_STATIC_IP')  !== false ? getenv('QUEUER_STATIC_IP') : null;
        $this->informations->node              = getenv('NODE_VERSION')      !== false ? getenv('NODE_VERSION')     : null;
        $this->informations->node_ip           = getenv('NODE_STATIC_IP')    !== false ? getenv('NODE_STATIC_IP')   : null;

        return $this->informations;
    }
}
