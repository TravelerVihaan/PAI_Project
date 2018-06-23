<?php
include_once 'UserActions.php';

class AdminActions extends UserActions{
  public function __construct(){
    parent::__construct();
  }

  public function deleteUser($usertoban){
    $sql="SELECT * FROM user WHERE username='$usertoban'";
    $check = $this->db->query($sql);
    $count_row = $check->num_rows;

    if ($count_row == 1){
      $sql1 = "DELETE FROM user WHERE username='$usertoban'";
      $result = mysqli_query($this->db,$sql1) or die(mysqli_connect_errno()."Uzytkownik nie moze zostac usunięty");
      return true;
    }else{
      return false;
    }
  }

}

 ?>
