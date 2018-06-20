<?php
session_start();
?>
<html>
<!--
    <head>
-->
<?php include_once 'core/head.php'; ?>
</head>

<body>
    <?php include_once 'core/header.php'; ?>
    <!-- sekcja header -->

    <?php
      if(1==1){
      include_once 'core/userpanel.php';
    }
    ?>
    <!--sekcja main-->
    <div id="main" class="container">
        <div class="row justify-content-right">
            <div id="tresc" class="col-md-9">
                <div id="navi" class="container">
                <!--navibar-->
                  <div clas="row">
                      <div class="col">
                          <br>
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php">Strona główna</a></li>
                            <li class="breadcrumb-item active">Eventy</li>
                          </ol>
                        </div>
                  </div>
                </div>
                <br>
                <h3> Eventy</h3><br>
                <?php
                include_once 'logic/Database.php';
                $database = new Database();
                $q ="SELECT * FROM eventy";
                $result = $database->query($q);
                while($row = mysqli_fetch_assoc($result)){
                  echo $row["ename"];
                  echo $row["date"];
                  echo $row["location"];
                  echo $row['description'];
                  echo $row['username'];
                  ?>
                  <br>
                  <?php
                }

                $result->free();
                //$database->finish();

                 ?>

            </p>
            <br>
            <a href="javascript:scroll(0,0);">Wróć na górę strony</a>
            <br>

        </div>
        <?php
          include_once 'core/menu.php';
         ?>
        </div>

    </div>



    <!-- sekcja footer-->
    <?php include_once 'core/footer.php'; ?>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>

</html>
