<form id="modal-form" action="<?php echo $action;?>" accept-charset="utf-8" role="form">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Posted By:</label>
				<div class="fg-line">
					<input class="form-control input-lg" type="text" readonly value="<?php echo $username;?>">
				</div>
			</div>
		</div>
		<div class="col-md-6">
            <div class="form-group">
                <label>Date:</label>
                <div class="fg-line">
                    <input class="form-control input-lg" type="text" name="note_date" readonly value="<?php echo $date;?>">
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label>Title:</label>
                <div class="fg-line">
                    <input class="form-control input-lg" data-sandbox-validate="true" type="text" name="title">
                </div>
            </div>
        </div>
		<div class="col-md-12">
			<div class="form-group">
				<label>Note:</label>
				<div class="fg-line">
					<textarea class="form-control" data-sandbox-validate="true" rows="5" name="note"></textarea>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="patient_id" value="<?php echo $patient_info['patient_id']; ?>" />
	<input type="hidden" name="user_id" value="<?php echo $user_id; ?>" />
</form>