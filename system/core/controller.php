<?php
abstract class Controller {
	protected $registry;
    protected $server;
	public function __construct($registry) {
		$this->registry = $registry;
        if ($this->request->server['HTTPS']) {
            $this->server = HTTPS_SERVER;
        } else {
            $this->server = HTTP_SERVER;
        }
	}

	public function __get($key) {
		return $this->registry->get($key);
	}

	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}
}