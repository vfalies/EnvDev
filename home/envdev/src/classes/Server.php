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
        $this->informations->php               = getenv('PHP_VERSION');
        $this->informations->php_ip            = getenv('PHP_STATIC_IP');
        $this->informations->webserver         = getenv('WEB_SERVER');
        $this->informations->webserver_version = getenv('WEB_VERSION');
        $this->informations->webserver_ip      = getenv('WEB_STATIC_IP');
        $this->informations->cache             = getenv('CACHE_SERVER');
        $this->informations->cache_version     = getenv('CACHE_VERSION');
        $this->informations->cache_ip          = getenv('CACHE_STATIC_IP');
        $this->informations->db                = getenv('DB_SERVER');
        $this->informations->db_version        = getenv('DB_VERSION');
        $this->informations->db_ip             = getenv('DB_STATIC_IP');
        $this->informations->queuer            = getenv('QUEUER_SERVER');
        $this->informations->queuer_ip         = getenv('QUEUER_STATIC_IP');
        $this->informations->node              = getenv('NODE_VERSION');
        $this->informations->node_ip           = getenv('NODE_STATIC_IP');

        return $this->informations;
    }
}
