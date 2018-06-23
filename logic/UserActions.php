<?php

class UserActions{

  protected $db;

  public function __construct(){
    $this->db = new mysqli('localhost', 'root', '', 'bstage');

    if(mysqli_connect_errno()) {
       echo "Error: Could not connect to database.";
       exit;
    }
  }

  public function getDatabase(){
    return $this->db;
  }

  public function getName($iduser){
    $sql="SELECT name,surname FROM user WHERE id_user = $iduser";
    $result = mysqli_query($this->db,$sql);
    $user_data = mysqli_fetch_array($result);
    return $user_data;
  }

  public function getEmail($iduser){
    $sql="SELECT email FROM user WHERE id_user = $iduser";
    $result = mysqli_query($this->db,$sql);
    $user_data = mysqli_fetch_array($result);
    return $user_data;
  }

  public function changeName($newname, $newsurname, $iduser){
    if($newname!='' and $newsurname != ''){
      $sql = "UPDATE user SET name='$newname', surname='$newsurname' WHERE id_user='$iduser'";
    }else if($newname=='' || $newsurname == ''){
      return false;
    }
    if(mysqli_query($this->db,$sql)){
      return true;
    }else{
      return false;
    }
  }

  public function changeEmail($newemail,$iduser){
    $nemail = filter_var($newemail, FILTER_SANITIZE_EMAIL);
    if ((filter_var($nemail, FILTER_VALIDATE_EMAIL)==false) || ($newemail!=$nemail)){
      return false;
    }
    if($newemail != ''){
      $sql = "UPDATE user SET email='$newemail' WHERE id_user='$iduser'";
    }else{
      return false;
    }
    if(mysqli_query($this->db,$sql)){
      return true;
    }else{
      return false;
    }
  }

  public function changePassword($oldpassword, $newpassword, $iduser){
    if(strlen($newpassword) < 7 || strlen($newpassword) > 30){
          return false;
    }

    $opass = md5($oldpassword);
    $npass = md5($newpassword);

    $sql = "UPDATE user SET password='$npass' WHERE id_user='$iduser' AND password='$opass'";
    if(mysqli_query($this->db,$sql)){
      return true;
    }else{
      return false;
    }
  }

}
 ?>
