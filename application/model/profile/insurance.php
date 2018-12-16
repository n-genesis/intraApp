<?php
class ModelProfileInsurance extends Model {
    public function addInsurance($data){
        $this->db->query("INSERT INTO insurance (`name`, `phone`, `address`, `city`, `state`, `zipcode`, `payor_id`, `ins_id`) VALUES ('" . $this->db->escape($data['name']) . "','" . $this->db->escape($data['phone']) . "','" . $this->db->escape($data['address']) . "','" . $this->db->escape($data['city']) . "','" . $this->db->escape($data['state']) . "','" . $this->db->escape($data['zipcode']) . "','" . $this->db->escape($data['payor_id']) . "','" . $this->db->escape($data['ins_id']) . "')");
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }
    
    public function getInsuranceRecord($insurance_id){
        $query = $this->db->query("SELECT IR.record_id, IR.record FROM insurance_records IR LEFT JOIN insurance_records_has_insurance IRHI ON IR.record_id = IRHI.insurance_record_id LEFT JOIN insurance I ON I.insurance_id = IRHI.insurance_id WHERE I.insurance_id = '" . (int)$insurance_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function getInsuranceById($insurance_id){
        $query = $this->db->query("SELECT * FROM `insurance` WHERE `insurance_id` = '" . (int)$insurance_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function editInsurance($insurance_id, $data) {
        $this->db->query("UPDATE insurance SET name = '" . $this->db->escape($data['name']) . "', phone = '" . $this->db->escape($data['phone']) . "', address = '" . $this->db->escape($data['address']) . "', city = '" . $this->db->escape($data['city']) . "', state = '" . $this->db->escape($data['state']) . "', zipcode = '" . $this->db->escape($data['zipcode']) . "', payor_id = '" . $this->db->escape($data['payor_id']) . "', ins_id = '" . $this->db->escape($data['ins_id']) . "' WHERE insurance_id =  '" . (int)$insurance_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
     /******************************************
     **************REPEATE CODE**************
     *****************************************/
    public function insuranceExists($data){
        if(!empty($data['name']) && empty($data['ins_id']) && empty($data['payor_id'])){
            $query = "SELECT * FROM insurance WHERE name LIKE '".$data['name']."%'";
        }elseif(empty($data['name']) && !empty($data['ins_id']) && empty($data['payor_id'])){
            $query = "SELECT * FROM insurance WHERE ins_id LIKE '%".$data['ins_id']."%'";
        }elseif(empty($data['name']) && empty($data['ins_id']) && !empty($data['payor_id'])){
            $query = "SELECT * FROM insurance WHERE payor_id LIKE '%".$data['payor_id']."%'";
        }else{
            $query = "SELECT * FROM insurance WHERE name LIKE '%".$data['name']."%' ||  ins_id LIKE '".$data['ins_id']."%' || payor_id LIKE '".$data['payor_id']."%'";
        }
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->row;
        } else {
            return false;
        }
    }
    
    public function search($table,$field,$query){
        $query = $this->db->query("SELECT {$field} FROM {$table} WHERE {$field} LIKE '{$query}%'");
        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }
}
?>