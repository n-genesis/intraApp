<?php
class ModelProfileEmployer extends Model {
    
    public function getEmployerById($employer_id){
        $query = $this->db->query("SELECT E.employer_id, E.name, E.phone, E.address, E.city, E.state, E.zipcode, E.group_id FROM employer E WHERE E.employer_id = '" . (int)$employer_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function getPatientEmployer($patient_id){
        $query = $this->db->query("SELECT E.employer_id, E.name, E.phone, E.address, E.city, E.state, E.zipcode, E.group_id FROM employer E LEFT JOIN patient_has_employer PHE ON E.employer_id = PHE.employer_id WHERE PHE.patient_id = '" . (int)$patient_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function updatePatientEmployer($patient_id,$employer_id){
        $exists = $this->db->query("SELECT * FROM patient_has_employer WHERE patient_id = '".(int)$patient_id."'");
        if($exists->num_rows < 1 ){
            $this->db->query("INSERT INTO patient_has_employer (patient_id, employer_id) VALUES ('" . (int)$patient_id . "','" . (int)$employer_id . "')");
        }else{
            $this->db->query("UPDATE patient_has_employer SET employer_id = '" . (int)$employer_id . "' WHERE patient_id = '" . (int)$patient_id . "'");
        }
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function removePatientEmployer($patient_id){
        $employer_id = $this->db->query("SELECT `employer_id` FROM `patient_has_employer` WHERE `patient_id` = '" . (int)$patient_id . "'");
        $query = $this->db->query("DELETE FROM patient_has_employer WHERE patient_id = '" . (int)$patient_id . "'");
        if (!$this->db->hasError()) {
            $employer_id = $employer_id->row;
            return $employer_id['employer_id'];
        } else {
            return false;
        }
    }
    
    public function editEmployer($patient_id, $data) {
        $this->db->query("UPDATE employer SET name = '" . $this->db->escape($data['name']) . "', phone = '" . $this->db->escape($data['phone']) . "', address = '" . $this->db->escape($data['address']) . "', city = '" . $this->db->escape($data['city']) . "', state = '" . $this->db->escape($data['state']) . "', zipcode = '" . $this->db->escape($data['zipcode']) . "', group_id = '" . $this->db->escape($data['group_id']) . "' WHERE patient_id =  '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function deleteEmployer($patient_id){
        $query = $this->db->query("DELETE FROM employer WHERE patient_id = '" . (int)$patient_id . "'");
        if ($this->db->countAffected() > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public function addEmployer($patient_id,$data){
        $this->db->query("INSERT INTO employer (`patient_id`, `name`, `phone`, `address`, `city`, `state`, `zipcode`, `group_id`) VALUES ('" . (int)$patient_id . "','" . $this->db->escape($data['name']) . "','" . $this->db->escape($data['phone']) . "','" . $this->db->escape($data['address']) . "','" . $this->db->escape($data['city']) . "','" . $this->db->escape($data['state']) . "','" . $this->db->escape($data['zipcode']) . "','" . $this->db->escape($data['group_id']) . "')");
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }
    
    public function employerExists($data){
        if(!empty($data['name']) && empty($data['group_id'])){
            $query = "SELECT * FROM employer WHERE name LIKE CONCAT('%', '".$data['name']."' ,'%')";
        }elseif(empty($data['name']) && !empty($data['group_id'])){
            $query = "SELECT * FROM employer WHERE group_id LIKE CONCAT('%', '".$data['group_id']."' ,'%')";
        }else{
            $query = "SELECT * FROM employer WHERE name LIKE CONCAT('%', '".$data['name']."' ,'%') ||  group_id LIKE CONCAT('%', '".$data['group_id']."' ,'%')";
        }
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->row;
        } else {
            return false;
        }
    }
    
}
?>