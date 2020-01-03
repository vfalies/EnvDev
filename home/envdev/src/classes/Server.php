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
        $this->informations->webserver         = getenv('WEB_SERVER');
        $this->informations->webserver_version = getenv('WEB_SERVER_VERSION');
        $this->informations->cache             = getenv('CACHE_SERVER');
        $this->informations->cache_version     = getenv('CACHE_VERSION');
        $this->informations->db                = getenv('DB');
        $this->informations->db_version        = getenv('DB_VERSION');
        $this->informations->queuer            = getenv('QUEUER_SERVER');

        return $this->informations;
    }
}
