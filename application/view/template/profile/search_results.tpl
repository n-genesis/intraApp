<div class="card">
	<div class="card-header">
		<h2 class="text-center">Search Results</h2>
	</div>
	<div class="card-body table-responsive">
	    <?php if(!empty($result)){ ?>
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
				<?php for ($i=0; $i < count($result) ; $i++){ ?>
				<tr>
				    <td class="text-left"><?php echo $result[$i]['patient_id'];?></td>
					<td><?php echo $result[$i]['first_name'];?></td>
					<td><?php echo $result[$i]['last_name'];?></td>
					<td><?php echo $result[$i]['ssn'];?></td>
					<td><?php echo $result[$i]['insurance_name'];?></td>
					<!--
					<td><?php echo $result[$i]['address'];?> <?php echo $result[$i]['city'].', '.$result[$i]['state'].' '.$result[$i]['zipcode'];?></td>
					-->
					<?php if (!empty($result[$i]['patient_id'])){ ?>
					<td><a href="<?php echo $profile_link.$result[$i]['patient_id'];?>" class="btn btn-success"><span class="zmdi zmdi-edit"></span></a></td>
					<?php } ?>
				</tr>
				<?php } ?>
			</tbody>
		</table>
		<?php }else{ ?>
		    <section class="text-center" style="height: 22vh;">
		       <h1>No results found</h1>
		     <p><a href="<?php echo $search_link;?>" onclick="history.go(-1); return false;">Click here to return to search</a></p> 
		    </section>
	    <?php } ?>
	</div>
</div>