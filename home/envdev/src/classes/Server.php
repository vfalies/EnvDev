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
        $this->informations->webserver = getenv('WEB_SERVER');
        $this->informations->cache     = getenv('CACHE_SERVER');
        $this->informations->db        = getenv('DB');

        return $this->informations;
    }
}