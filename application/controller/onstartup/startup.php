<?php
class ControllerOnstartupStartup extends Controller {
	public function index() {
		// Settings
		$query = $this->db->query("SELECT * FROM setting");
		
		foreach ($query->rows as $setting) {
			if (!$setting['serialized']) {
				$this->config->set($setting['key'], $setting['value']);
			} else {
				$this->config->set($setting['key'], json_decode($setting['value'], true));
			}
		}			
	}
}