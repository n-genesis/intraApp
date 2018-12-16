<?php foreach ($categories as $options) {?>
<h3><?php echo $options['category_group_name'];?></h3>
<div class="row">
<?php foreach ($options['category_options'] as $key => $debug) {?>
<div class="col-sm-3 m-b-25">
	<p class="f-500 m-b-15 c-black">
		<?php echo $options['category_options'][$key]['option_name']; ?>
	</p>

	<select class="selectpicker">
        <?php foreach ($options['category_options'][$key]['options'] as $option) {?>
            <option><?php echo $option; ?></option>
        <?php } ?>
	</select>
</div>
<?php } ?>
</div>
<?php } ?>