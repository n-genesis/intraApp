<?php foreach ($categories as $options) {?>
<h3><?php echo $options['category_group_name'];?></h3>
<div class="row">
<?php foreach ($options['category_options'] as $key => $debug) {?>
<div class="col-sm-3 m-b-25">
	<p class="f-500 m-b-15 c-black">
		<?php echo $options['category_options'][$key]['option_name']; ?>
	</p>

	<div class="form-group fg-float">
			<div class="fg-line">
				<input class="form-control fg-input" type="text">
				<label class="fg-label">Input Default</label>
			</div>
	</div>
</div>
<?php } ?>
</div>
<?php } ?>