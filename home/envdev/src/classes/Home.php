<?php

class Home
{
    private $http_host;
    private $host;
    private $port;
    private $tools    = [];
    private $projects = [];
    private $vhosts   = [];

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->http_host = explode(':', $_SERVER['HTTP_HOST']);
        $this->host = $this->http_host[0];
        $this->port = (isset($this->http_host[1])) ? $this->http_host[1] : 80;

        $this->setTools();
        $this->setProjects();
    }

    /**
     * Set Tools
     *
     * @return Home
     */
    private function setTools()
    {
        // Setting tools
        $this->addTool('Database Admin', getenv('DBADMIN_PORT'), 'glyphicon-th-list')
             ->addTool('MailDev', getenv('MAILDEV_PORT'), 'glyphicon-envelope')
             ->addTool('PhpInfo', $this->port, 'glyphicon-info-sign', '/phpinfo' );

        return $this;
    }

    /**
     * Add Tool item
     *
     * @param string $name
     * @param string $port
     * @param string $icon
     * @param string $path
     * @return Home
     */
    private function addTool($name, $port, $icon, $path = null)
    {
        $tool       = new stdClass;
        $tool->name = $name;
        $tool->port = $port;
        $tool->icon = $icon;
        $tool->url  = 'http://' . $this->host . ':' . $port . $path;

        array_push($this->tools, $tool);

        return $this;
    }

    /**
     * Set projects from disk
     *
     * @return Home
     */
    private function setProjects()
    {
        $directories = glob('/var/www/html/projects/*', GLOB_ONLYDIR);

        foreach ($directories as $directory)
        {
            $project       = new stdClass();
            $project->name = (array_reverse(explode('/', $directory)))[0];
            $project->url  = 'http://localhost/' . $project->name;

            array_push($this->projects, $project);
        }

        return $this;
    }

    /**
     * Get Tools list array
     *
     * @return array
     */
    public function getTools()
    {
        return $this->tools;
    }

    /**
     * Get Projects list array
     *
     * @return array
     */
    public function getProjects()
    {
        return $this->projects;
    }

    /**
     * Get VHosts list array
     *
     * @return array
     */
    public function getVHosts()
    {
        $this->loadVHosts();

        return $this->vhosts;
    }

    private function loadVHosts()
    {
        // Load Apache VHosts
        $directories = glob('/envdevconf/apache/vhosts/*');

        $this->vhosts['apache'] = [];
        foreach ($directories as $directory)
        {
            $vhost       = new stdClass();
            $vhost->name = (array_reverse(explode('/', $directory)))[0];

            array_push($this->vhosts['apache'], $vhost);
        }

        // Load NGinx VHosts
        $directories = glob('/envdevconf/nginx/vhosts/*');

        $this->vhosts['nginx'] = [];
        foreach ($directories as $directory)
        {
            $vhost       = new stdClass();
            $vhost->name = (array_reverse(explode('/', $directory)))[0];

            array_push($this->vhosts['nginx'], $vhost);
        }
        return $this;
    }
}