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
        $this->informations->php       = getenv('PHP_VERSION');
        $this->informations->webserver = getenv('WEB_SERVER').' ('.getenv('WEB_SERVER_VERSION').')';
        $this->informations->cache     = getenv('CACHE_SERVER').' ('.getenv('CACHE_VERSION').')';
        $this->informations->db        = getenv('DB').' ('.getenv('DB_VERSION').')';

        return $this->informations;
    }
}