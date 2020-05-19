<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                  <div id="infoMessage" class="text-center" style="font-color:red !important;"><?php echo $message;?></div>
                    <?= form_open("auth/cek_login", array('id'=>'login'));?>
                    <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label form-control-feedback">
                            Email</label>
                        <div class="col-sm-9">
                            <?= form_input($identity);?>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label form-control-feedback">
                            Password</label>
                        <div class="col-sm-9">
                            <?= form_input($password);?>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <?= form_checkbox('remember', '', FALSE, 'id="remember"');?>
                                    Ingatkan saya
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <?= form_submit('submit', lang('login_submit_btn'), array('id'=>'submit','class'=>'btn btn-primary btn-block btn-round-lg'));?>
                        </div>
                    </div>
                    <?= form_close(); ?>
                </div>
                <div class="panel-footer">
                    Belum Terdaftar? <a href="<?=base_url()?>register">Daftar disini</a></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	let base_url = '<?=base_url();?>';
</script>
<script src="<?=base_url()?>assets/dist/js/app/auth/login.js"></script>
