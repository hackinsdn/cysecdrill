<!DOCTYPE html>
<html>
  <?php 
  	include("assets/includes/head.php"); 
  ?>
<body>
	<?php
		include("assets/includes/header.php")
	?>

	<!-- Page content -->
    <div class="container-fluid mt--7">
      <!-- Table -->
      <div class="row">
        <div class="col">
          	<div class="card shadow">
	            <div class="card-header bg-transparent">
	              <h2 class="mb-0">Reports</h2>
	            </div>
            	
            	<div class="card-body">
                <div class="row icon-examples">

              <?php
                $con = getConnectionDB() or die ("Could not connect to database.");
                $sql = $con->prepare("SELECT name, tools, command, output, solution, dataHour FROM reports ORDER BY dataHour DESC;");
                $sql->execute();

                $resultados = $sql->fetchAll(PDO::FETCH_ASSOC);
                // FOREACH BEGINS
                foreach ($resultados as $resultado) {
                  $name = $resultado['name'];
                  $tools = $resultado['tools'];
                  $command = $resultado['command'];
                  $output = $resultado['output'];
                  $solution = $resultado['solution'];
                  $dataOld = $resultado['dataHour'];
                  $dataHour = date ("d F Y - H:i", strtotime($dataOld));


              ?>
				<div class="col-xl-6 col-lg-6">
                    <div class="card card-stats zoom-effect">
                      <div class="card-body">
                        <div class="row">
                          <div class="col">
                            <h5 class="card-title text-uppercase text-muted mb-0"><?php echo $tools; ?></h5>
                            <span class="h3 font-weight-bold mb-0">
                              <?php echo $name; ?><br>
                             </span>
                             <br><p><b>Datetime:</b> <?php echo $dataHour; ?>hrs</p>
                          </div>
                          <div class="col-auto">
                            <div class="icon icon-shape text-white rounded-circle shadow" style="background-image: url('<?php echo $avatar2; ?>');">
                            </div>
                          </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                        </p>

                    <a href="tools-list.php" class="btn btn-info">+ Show details</a>
                      </div>
                    </div>
                  </div>
					<?php }           ?>
				</div>
			</div>
    </div>
	<?php
		include("assets/includes/footer.php")
	?>
</body>
</html>