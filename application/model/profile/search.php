<?php
class ModelProfileSearch extends Model {

    public function findPatient($data){
        $query = "SELECT P.patient_id, P.first_name, P.last_name, P.ssn, P.address, P.city, P.state, P.zipcode, I.name as insurance_name FROM patient P LEFT JOIN patient_has_insurance PHI ON P.patient_id = PHI.patient_id LEFT JOIN insurance I ON PHI.insurance_id = I.insurance_id WHERE ";
        foreach ($data as $key => $value) {
            if(!empty($value)){
                $query .= "{$key} LIKE '{$value}%' || ";
            }   
        }
        $query = substr($query,0,strrpos($query,'||'));
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->rows;
        } else {
            return false;
        }
    }
    
   public function findByInsurance($data){
        $query = "SELECT P.patient_id, P.first_name, P.last_name, P.ssn, P.address, P.city, P.state, P.zipcode, I.name as insurance_name FROM patient P LEFT JOIN patient_has_insurance PHI ON P.patient_id = PHI.patient_id LEFT JOIN insurance I ON PHI.insurance_id = I.insurance_id WHERE ";
        foreach ($data as $key => $value) {
            if(!empty($value)){
                $query .= "{$key} LIKE '{$value}%' || ";
            }   
        }
        $query = substr($query,0,strrpos($query,'||'));
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->rows;
        } else {
            return false;
        }
    }
   
   public function findByEmployer($data){
        $query = "SELECT P.patient_id, P.first_name, P.last_name, P.ssn, P.address, P.city, P.state, P.zipcode, I.name as insurance_name FROM patient P LEFT JOIN employer E ON P.patient_id = E.patient_id WHERE ";
        foreach ($data as $key => $value) {
            if(!empty($value)){
                $query .= "{$key} LIKE '{$value}%' || ";
            }   
        }
        $query = substr($query,0,strrpos($query,'||'));
        $results = $this->db->query($query);
        if ($results->num_rows) {
            return $results->rows;
        } else {
            return false;
        }
    }
}
?>