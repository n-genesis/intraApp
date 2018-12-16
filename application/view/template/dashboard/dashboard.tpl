<header class="dashboard-header">
   <figure class="dashboard-img">
       <!--
    <img src="application/view/image/db-image.gif" class="center-block"/>
    -->
    <h1>Dashboard</h1>
    <!--
    <h2>Get started by selecting an option below</h2>
    -->
    </figure>
    <!-- System notice -->
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
        Well done! You successfully read <a href="#" class="alert-link">this important alert message.</a>
    </div>
</header>
<div class="row">
	<section class="<?php echo (empty($extension_block)?'col-md-6 col-md-offset-3':'col-md-4'); ?> ">
		<div class="card">
			<div class="card-header-google-style">
				<img src="application/view/image/icons/user-search.gif" class=" img-responsive center-block" alt="Search Patient" /><h2>Patient Search</h2>
			</div>
			<div class="card-body card-padding style-list">
				<p>Query database for patients by Name, SSN, Insurance, or Employer.</p>
				<ul class="style-list">
					<li><a href="<?php echo $search_person;?>">First, Last Name, or SSN</a></li>
					<li><a href="<?php echo $search_insurance;?>">Insurance, Payor ID, or Ins Co ID</a></li>
					<li><a href="<?php echo $search_employer;?>">Employer or Group ID</a></li>
				</ul>
			</div>
			<div class="card-header-google-style second-header">
                <a href="<?php echo $new;?>"><img src="application/view/image/icons/user-add.gif" class=" img-responsive center-block" alt="Search Patient" /><h2>Add Patient</h2><span class="zmdi zmdi-chevron-right"></span></a>
            </div>
		</div>
	</section>
	<!-- Extension blocks -->
	<?php if(!empty($extension_block)){
	    foreach ($extension_block as $block) {
			echo $block;
		}
	};?>
</div>