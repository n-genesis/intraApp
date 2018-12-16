<div class="card">
	<div class="card-header">
		<h1 class="text-center">Search for profile</h1>
	</div>
	<div class="card-body">
		<ul class="tab-nav tn-justified tn-icon" role="tablist">
			<li role="presentation" class="active" title="Profile"><a class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab"> <i class="zmdi zmdi-account-calendar icon-tab"></i> </a></li>
			<li role="presentation" title="Insurance"><a class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab"> <i class="zmdi zmdi-city icon-tab"></i> </a></li>
			<li role="presentation" title="Employer"><a class="col-xs-4" href="#tab-3" aria-controls="tab-3" role="tab" data-toggle="tab"> <i class="zmdi zmdi-city-alt icon-tab"></i> </a></li>
		</ul>
		<div class="tab-content p-20">
			<div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-1">
				<div class="row no-margin">
				    <div class="col-md-12">
				    </div>
					<form id="search-person" role="form" action="<?php echo $search_action;?>" accept-charset="utf-8" role="form" method="POST">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
									    <label>First Name:</label>
									    <div class="fg-line">
										<input type="text" class="form-control input-lg" name="first_name" placeholder="First Name">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									    <label>Last Name:</label>
									    <div class="fg-line">
										<input type="text" class="form-control input-lg" name="last_name" placeholder="Last Name">
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
									    <label>SSN:</label>
									    <div class="fg-line">
										<input class="form-control input-lg" type="text" name="ssn" placeholder="SSN">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-md-offset-5">
						    <button class="btn btn-success btn-block" type="submit">Search</button>
						</div>
						<input type="hidden" name="type" value="patient" />
					</form>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">
			    <div class="row no-margin">
                    <form id="search-person" role="form" action="<?php echo $search_action;?>" accept-charset="utf-8" role="form" method="POST">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Insurance Name:</label>
                                        <div class="fg-line">
                                        <input type="text" class="form-control input-lg insurance-name" name="name" placeholder="Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Payor ID #:</label>
                                        <div class="fg-line">
                                            <input id="insurance-payor_id" class="form-control input-lg insurance-payor-id" placeholder="Payor ID" type="text" name="payor_id">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Ins Co ID #:</label>
                                        <div class="fg-line">
                                            <input id="insurance-ins_id" class="form-control input-lg insurance-ins-id" placeholder="Ins Co ID" type="text" name="ins_id">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-md-offset-5">
                            <button class="btn btn-success btn-block" type="submit">Search</button>
                        </div>
                        <input type="hidden" name="type" value="insurance" />
                    </form>
                </div>
			</div>

			<div role="tabpanel" class="tab-pane animated fadeIn" id="tab-3">
				<div class="row no-margin">
                    <div class="col-md-12">
                    </div>
                    <form id="search-person" role="form" action="<?php echo $search_action;?>" accept-charset="utf-8" role="form" method="POST">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Employer Name:</label>
                                        <div class="fg-line">
                                        <input type="text" class="form-control input-lg employer-name" name="name" placeholder="Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Group ID:</label>
                                        <div class="fg-line">
                                        <input type="text" class="form-control input-lg group-id" name="group_id" placeholder="Group #">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-md-offset-5">
                            <button class="btn btn-success btn-block" type="submit">Search</button>
                        </div>
                        <input type="hidden" name="type" value="employer" />
                    </form>
                </div>
			</div>

		</div>
	</div>
</div>