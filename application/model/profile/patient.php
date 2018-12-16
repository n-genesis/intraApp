<?php
class ModelProfilePatient extends Model {
    public function getPatientById($patient_id){
        $query = $this->db->query("SELECT P.patient_id, P.first_name, P.last_name, DATE_FORMAT(P.dob,'%m/%d/%Y') as dob, P.ssn, P.phone, P.email, P.address, P.city, P.state, P.policy_holder_id, DATE_FORMAT(P.policy_eff_date,'%m/%d/%Y') as policy_eff_date, I.name as insurance_name, P.zipcode, P.image, PI.spoke_to, PI.verified_by, PI.ref_number, PS.status_id, PS.value as status FROM patient P LEFT JOIN patient_has_insurance PHI ON P.patient_id = PHI.patient_id LEFT JOIN insurance I ON PHI.insurance_id = I.insurance_id LEFT JOIN patient_info PI ON PI.patient_id = P.patient_id LEFT JOIN patient_status PS ON P.status_id = PS.status_id WHERE P.patient_id = '" . (int)$patient_id . "'");
        if ($query->num_rows) {
            foreach ($query->rows as $value) {
                $results = array(
                    'patient_id'  => $value['patient_id'],
                    'fullname'  => $value['first_name'].' '.$value['last_name'],
                    'first_name'  => $value['first_name'],
                    'last_name' => $value['last_name'],
                    'dob'  => $value['dob'],
                    'address'  => $value['address'],
                    'city' => $value['city'],
                    'state' => $value['state'],
                    'zipcode' => $value['zipcode'],
                    'phone'  => $value['phone'],
                    'email'  => $value['email'],
                    'ssn'  => $value['ssn'],
                    'image'  => (!empty($value['image'])?$value['image']:'default_avatar.png'),
                    'policy_holder_id'  => $value['policy_holder_id'],
                    'policy_eff_date'  => $value['policy_eff_date'],
                    'status_id'  => (int)$value['status_id'],
                    'status'  => $value['status'],
                    'insurance_name'  => $value['insurance_name'],
                    'spoke_to'  => $value['spoke_to'],
                    'verified_by'  => $value['verified_by'],
                    'ref_number'  => $value['ref_number']
                );
            }
            return $results;
        } else {
            return false;
        }
    }

    public function addNewPatient($data){
        $query = $this->db->query("INSERT INTO `patient`(`first_name`, `last_name`, `phone`, `dob`, `ssn`) VALUES ('" . $this->db->escape($data['first_name']) . "','" . $this->db->escape($data['last_name']) . "','" . $this->db->escape($data['phone']) . "','" . date('Y-n-j',strtotime($data['dob'])) . "','" . $this->db->escape($data['ssn']) . "')");
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }

    public function editPatient($patient_id, $data) {
        $this->db->query("UPDATE patient SET first_name= '" . $this->db->escape($data['first_name']) . "', last_name = '" . $this->db->escape($data['last_name']) . "', dob = '" . date('Y-n-j',strtotime($this->db->escape($data['dob']))) . "', ssn = '" . $this->db->escape($data['ssn']) . "' WHERE patient_id = '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function editPatientContact($patient_id, $data) {
        $this->db->query("UPDATE patient SET address= '" . $this->db->escape($data['address']) . "', city = '" . $this->db->escape($data['city']) . "', state = '" . $this->db->escape($data['state']) . "', zipcode = '" . $this->db->escape($data['zipcode']) . "', phone = '" . $this->db->escape($data['phone']) . "', email = '" . $this->db->escape($data['email']) . "' WHERE patient_id = '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function editPatientInfo($patient_id, $data) {
        $this->db->query("UPDATE patient_info SET spoke_to = '" . $this->db->escape($data['spoke_to']) . "', verified_by = '" . $this->db->escape($data['verified_by']) . "', ref_number = '" . $this->db->escape($data['ref_number']) . "' WHERE patient_id = '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function changePatientStatus($patient_id, $data) {
        $this->db->query("UPDATE patient SET status_id = '" . $this->db->escape($data['status_id']) . "' WHERE patient_id = '" . (int)$patient_id . "'");
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function insertPatientInfo($patient_id,$data){
        $query = $this->db->query("INSERT INTO patient_info (`patient_id`, `spoke_to`, `verified_by`, `ref_number`) VALUES ('" . (int)$patient_id . "','" . $this->db->escape($data['spoke_to']) . "','" . $this->db->escape($data['verified_by']) . "','" . $this->db->escape($data['ref_number']) . "')");
        if($this->db->countAffected() > 0){
            return true;
        }else{
            return false;
        }
    }
    
    public function deletePatientInfo($patient_id){
        $query = $this->db->query("DELETE FROM patient_info WHERE patient_id = '" . (int)$patient_id . "'");
        if($this->db->countAffected() > 0){
            return true;
        }else{
            return false;
        }
    }
    
    public function getPatientInfo($patient_id){
        $query = $this->db->query("SELECT * FROM patient_info WHERE patient_id = '" . (int)$patient_id . "'");
        if($query->num_rows > 0){
            return $query->row;
        }else{
            return false;
        }
    }
    
    public function getPatientInsurance($patient_id){
        $query = $this->db->query("SELECT I.insurance_id, I.name, I.phone, I.address, I.city, I.state, I.zipcode, I.payor_id, I.ins_id FROM insurance I INNER JOIN patient_has_insurance PHI ON I.insurance_id = PHI.insurance_id INNER JOIN patient P ON P.patient_id = PHI.patient_id WHERE P.patient_id = '" . (int)$patient_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function updatePatientInsurance($patient_id,$insurance_id){
        $exists = $this->db->query("SELECT * FROM patient_has_insurance WHERE patient_id = '".(int)$patient_id."'");
        if($exists->num_rows < 1 ){
            $this->db->query("INSERT INTO patient_has_insurance (patient_id, insurance_id) VALUES ('" . (int)$patient_id . "','" . (int)$insurance_id . "')");
        }else{
            $this->db->query("UPDATE patient_has_insurance SET insurance_id = '" . (int)$insurance_id . "' WHERE patient_id = '" . (int)$patient_id . "'");
        }
        
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function removePatientInsurance($patient_id){
        $insurance_id = $this->db->query("SELECT `insurance_id` FROM `patient_has_insurance` WHERE `patient_id` = '" . (int)$patient_id . "'");
        $query = $this->db->query("DELETE FROM patient_has_insurance WHERE patient_id = '" . (int)$patient_id . "'");
        if (!$this->db->hasError()) {
            $insurance_id = $insurance_id->row;
            return $insurance_id['insurance_id'];
        } else {
            return false;
        }
    }
    
    public function findPatient($data){
        $query = "SELECT *  FROM patient WHERE ";
        foreach ($data as $key => $value) {
            if(!empty($value)){
                $query .= "{$key} LIKE '{$value}%' || ";
            }   
        }
        $query = substr($query,0,strrpos($query,'||'));
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->row;
        } else {
            return false;
        }
    }
    
    public function getPolicyHolder($policy_holder_id){
        $query = $this->db->query("SELECT P.patient_id, DATE_FORMAT(P.policy_eff_date,'%m/%d/%Y') as policy_eff_date, P.first_name, P.last_name, DATE_FORMAT(P.dob,'%m/%d/%Y') as dob, P.ssn FROM patient P WHERE P.patient_id = '" . (int)$policy_holder_id . "'");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
    
    public function getPatientsPolicyHolders($patient_id){
        $query = $this->db->query("SELECT P.patient_id, P.first_name, P.last_name, DATE_FORMAT(P.dob,'%m/%d/%Y') as dob, P.ssn, P.phone, P.email, P.address, P.city, P.state, P.policy_holder_id, DATE_FORMAT(P.policy_eff_date,'%m/%d/%Y') as policy_eff_date FROM patient P WHERE P.policy_holder_id = '" . (int)$patient_id . "' && NOT p.patient_id = '" . (int)$patient_id . "'");
        if($query->num_rows){
            return $query->rows;
        }else{
            return false;
        }
    }
    
    public function updatePolicy($patient_id,$policy_holder_id){
        if(!empty($patient_id)){
            $this->db->query("UPDATE patient SET policy_holder_id = '" . (int)$policy_holder_id . "' WHERE patient_id = '" . (int)$patient_id . "'");
            return true;
        }
        return false;
    }
    
    public function updatePolicyDate($patient_id,$policy_eff_date){
        if(!empty($patient_id)){
            $this->db->query("UPDATE patient SET policy_eff_date = '" . date('Y-n-j',strtotime($this->db->escape($policy_eff_date))) . "' WHERE patient_id = '" . (int)$patient_id . "'");
            return true;
        }
        return false;
    }
    
    public function getPolicyClaimsList($policy_holer_id){
        $query = $this->db->query("SELECT PC.claim_id, DATE_FORMAT(PC.date,'%m/%d/%Y') as date, PC.title, SUBSTR(PC.claim,1,150) as claim, PC.status FROM policy_claim PC WHERE PC.patient_id = '" . (int)$policy_holer_id . "' ORDER BY PC.date");
        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }
    
    public function getClaims($claim_id){
        $query = $this->db->query("SELECT PC.claim_id, DATE_FORMAT(PC.date,'%m/%d/%Y') as date, PC.title, PC.claim,1,150, PC.status FROM policy_claim PC WHERE PC.claim_id = '" . (int)$claim_id . "' ORDER BY PC.date");
        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }    
    
    public function addclaim($data){
        $this->db->query("INSERT INTO policy_claim (`patient_id`, `date`, `title`, `claim`,`status`) VALUES ('" . $this->db->escape($data['patient_id']) . "','" . date('Y-n-j',strtotime($this->db->escape($data['date']))) . "', '" . $this->db->escape($data['title']) . "', '" . $this->db->escape($data['claim']) . "', '" . $this->db->escape($data['status']) . "')");
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
            return false;
        }
    }
    
    public function deleteClaim($claim_id){
        $this->db->query("DELETE FROM `policy_claim` WHERE claim_id = '" . (int)$claim_id . "'");
        if(!$this->db->hasError()){
            return true;
        }else{
            return false;
        }
    }
    
    public function getClaimStatus($data){
        $this->db->query("INSERT INTO policy_claim (`patient_id`, `date`, `title`, `claim`,`status`) VALUES ('" . $this->db->escape($data['patient_id']) . "','" . date('Y-n-j',strtotime($this->db->escape($data['date']))) . "', '" . $this->db->escape($data['title']) . "', '" . $this->db->escape($data['claim']) . "',0)");
        if(!$this->db->hasError()){
            return $this->db->getLastId();
        }else{
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