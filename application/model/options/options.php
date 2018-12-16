<?php
class ModelOptionsOptions extends Model {
    private $ype;
    
    public function getCategory() {
        $query = $this->db->query("SELECT c.category_id, c.name as category_name FROM category c");

        if ($query->num_rows) {
            foreach ($query->rows as $value) {
                $results[] = array(
                    'category_id'           => $value['category_id'],
                    'category_name'         => $value['category_name']
                );
            }
            return $results;
        } else {
            return false;
        }
    }
    public function getCategoryGroups($category_id){
        $query = $this->db->query("SELECT cg.category_group_id, cg.category_id, cg.name as group_name FROM category_group cg WHERE cg.category_id = '" . (int)$category_id . "'");
        if ($query->num_rows) {
            foreach ($query->rows as $value) {
                $results[] = array(
                    'category_group_id'  => $value['category_group_id'],
                    'category_id'  => $value['category_id'],
                    'group_name'         => $value['group_name'],
                    'group_options' => $this->getCategoryOptions($value['category_group_id'])
                );
            }
            return $results;
        } else {
            return false;
        }
    }
    public function getCategoryOptions($category_group_id) {
        $query = $this->db->query("SELECT o.option_id, o.name as option_name, o.type, o.sort_order, ov.value, ov.sort_order,cg.name as category_group_name FROM options o LEFT JOIN options_value ov ON ov.option_id = o.option_id LEFT JOIN category_group_has_option cgho ON o.option_id = cgho.option_id LEFT JOIN category_group cg ON cg.category_group_id = cgho.category_group_id WHERE cgho.category_group_id = '" . (int)$category_group_id . "'");

        if ($query->num_rows) {
            foreach ($query->rows as $value) {
                $results[] = array(
                    'category_group_name' => $value['category_group_name'],
                    'option_id'           => $value['option_id'],
                    'option_name'         => $value['option_name'],
                    'option_type'           => $value['type'],
                    'value'               => $value['value']
                );
            }
            return $results;
        } else {
            return false;
        }
    }
    public function getOptionType($option_id) {
        $query = $this->db->query("SELECT type FROM options WHERE option_id = '" . (int)$option_id . "'");

        if ($query->num_rows) {
            return $query->row['type'];
        } else {
            return false;
        }
    }
}
?>