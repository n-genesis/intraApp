<?php
namespace User;
class User {
	private $user_id;
	private $username;
	private $permission = array();

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
        
        //Add system permission and authentication operations
		if (isset($this->session->data['user_id'])) {
			$user_query = $this->db->query("SELECT * FROM user U INNER JOIN user_type UT ON U.type_id = UT.type_id WHERE user_id = '" . (int)$this->session->data['user_id'] . "'");

			if ($user_query->num_rows) {
				$this->user_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];
				$this->user_level = $user_query->row['level'];

			} else {
				$this->logout();
			}
		}
	}

	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM user U INNER JOIN user_type UT ON U.type_id = UT.type_id WHERE U.username = '" . $this->db->escape($username) . "' && password = '" . $this->db->escape(md5($password)) . "'");

		if ($user_query->num_rows) {
			$this->session->data['user_id'] = $user_query->row['user_id'];
            
			$this->user_id = $user_query->row['user_id'];
			$this->username = $user_query->row['username'];
			$this->user_level = $user_query->row['level'];

			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		unset($this->session->data['user_id']);
		unset($this->session->data['user_log_id']);
		$this->user_id = '';
		$this->username = '';
	}

	public function isLogged() {
		return $this->user_id;
	}

	public function getId() {
		return $this->user_id;
	}

	public function getUsername() {
		return $this->username;
	}

	public function getUserLevel() {
		return $this->user_level;
	}
    /**
     * User event methods
     */
    public function logUser($action){
        $this->db->query("INSERT INTO `user_log` SET `ip` = '". $this->request->server['REMOTE_ADDR'] ."', `user_id` = '" . (int)$this->user_id . "', `action` = '" . (string)$action . "'");
        $this->session->data['user_log_id'] = $this->db->getLastId();
    }
    
    public function logUserActivity($action,$patient_id){
        $this->db->query("INSERT INTO `user_session_activity` SET `user_log_id` = '". (int)$this->session->data['user_log_id'] ."', `action` = '" . (string)$action . "', `patient_id` = '".$patient_id."' ");
    }
}