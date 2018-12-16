<div class="block-header">
    <h2>Google Hangouts</h2>
</div>
<section data-alert="system">
<?php if(isset($system_notice)){ echo $system_notice; } ?>
</section>
<div class="card">
    <div class="card-header">
        <h2><span class="zmdi zmdi-edit"></span> Edit Google Hangout <small>Add the ability to make calls from INTRAapp</small></h2>
    </div>
    <div class="card-body card-padding">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-google-hangouts">
            <div class="row">
                <div class="col-md-12">
                <div class="form-group <?php echo ($error_code?'has-error':'');?>">
                    <div class="fg-line">
                        <label class="control-label" for="input-code">Google Talk Code</label>
                        <textarea id="input-code" class="form-control" name="google_hangouts_code" rows="5" placeholder="place code here"><?php echo $google_hangouts_code; ?></textarea>    
                    </div>
                    <?php if ($error_code) { ?>
                        <small class="help-block"><?php echo $error_code; ?></small>
                    <?php } ?>
                </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="fg-line">
                            <label class="control-label" for="input-status">Status</label>
                            <div class="select">
                                <select name="google_hangouts_status" id="input-status" class="form-control">
                                    <?php if ($google_hangouts_status) { ?>
                                    <option value="1" selected="selected">Enabled</option>
                                    <option value="0">Disabled</option>
                                    <?php } else { ?>
                                    <option value="1">Enabled</option>
                                    <option value="0" selected="selected">Disabled</option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" form="form-google-hangouts" class="btn btn-primary">
                <i class="zmdi zmdi-floppy"></i> Save
            </button>
            <a href="<?php echo $cancel; ?>" class="btn btn-default">
                <i class="zmdi zmdi-mail-reply"></i> Cancel
            </a>
        </form>
    </div>
</div>