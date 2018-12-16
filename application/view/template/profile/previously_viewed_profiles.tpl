<div class="card">
	<div class="card-header">
		<h2 class="text-center">Previously Viewed Profiles</h2>
	</div>
	<div class="card-body table-responsive">
	    <?php if(!empty($previously_viewed)){ ?>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>SSN</th>
					<th>Insurance</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php for ($i=0; $i < count($previously_viewed) ; $i++){ ?>
				<tr>
				    <td class="text-left"><?php echo $previously_viewed[$i]['patient_id'];?></td>
					<td><?php echo $previously_viewed[$i]['first_name'];?></td>
					<td><?php echo $previously_viewed[$i]['last_name'];?></td>
					<td><?php echo $previously_viewed[$i]['ssn'];?></td>
					<td><?php echo $previously_viewed[$i]['insurance_name'];?></td>
					<?php if (!empty($previously_viewed[$i]['patient_id'])){ ?>
					<td><a href="<?php echo $profile_link.$previously_viewed[$i]['patient_id'];?>" class="btn btn-success"><span class="zmdi zmdi-edit"></span></a></td>
					<?php } ?>
				</tr>
				<?php } ?>
			</tbody>
		</table>
		<?php }else{ ?>
		    <section class="text-center" style="height: 22vh;">
		       <h1>No history found</h1>
		    </section>
	    <?php } ?>
	</div>
</div>