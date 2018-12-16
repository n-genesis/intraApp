<div class="card">
	<div class="card-header">
	    <img class="card-header-image center-block" src="application/view/image/icons/user-add.gif"/>
		<h3 class="text-center">Create Profile</h3>
	</div>
	<div class="card-body card-padding">
		<form id="new-profile" role="form" action="<?php echo $new_profile; ?>" accept-charset="utf-8" role="form" method="POST">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>First Name:</label>
						<div class="fg-line">
							<input class="form-control input-lg" data-sandbox-validate="true" placeholder="First Name" type="text" name="first_name">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Last Name:</label>
						<div class="fg-line">
							<input class="form-control input-lg" data-sandbox-validate="true" placeholder="Last Name" type="text" name="last_name">
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>SSN:</label>
						<div class="fg-line">
							<input class="form-control input-lg input-mask" data-mask="000000000" placeholder="000000000" data-sandbox-validate="true" placeholder="SSN" type="text" name="ssn">
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>DOB:</label>
						<div class="fg-line">
							<input class="form-control input-lg input-mask" data-mask="00/00/0000" placeholder="00/00/0000" data-sandbox-validate="true" placeholder="dob" type="text" name="dob">
						</div>
					</div>
				</div>
				<div class="col-md-4">
                    <div class="form-group">
                        <label>Phone:</label>
                        <div class="fg-line">
                            <input class="form-control input-lg input-mask" data-mask="000-000-0000" placeholder="000-000-0000" data-sandbox-validate="true" placeholder="SSN" type="text" name="phone">
                        </div>
                    </div>
                </div>
				<div class="col-md-2 col-md-offset-5">
					<button class="btn btn-success btn-block" type="submit">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>