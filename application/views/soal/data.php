<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span></button>
				<h4 class="modal-title">Tambah Data</h4>
			</div>
			<?= form_open('soal/add'); ?>
			<div class="modal-body">
				<div class="form-group">
					<label for="banyak">Jenis Soal</label>

          <select name="id_tes" required="required" id="id_tes" class="select2 form-group" style="width:100% !important">
            <option value="" disabled selected>Pilih Tes</option>
            <?php foreach ($tes as $t) : ?>
                <option value="<?=$t->id_matkul?>"><?=$t->nama_matkul?></option>
            <?php endforeach; ?>
          </select>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" name="input">Selanjutnya</button>
			</div>
			<?= form_close(); ?>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><?=$subjudul?></h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="box-body">
		<div class="row">
        	<div class="col-sm-4">
				<button type="button" onclick="bulk_delete()" class="btn btn-flat btn-sm bg-red"><i class="fa fa-trash"></i> Bulk Delete</button>
			</div>
			<div class="form-group col-sm-4 text-center">
				<?php if ( $this->ion_auth->is_admin() ) : ?>

				<?php endif; ?>
				<?php if ( $this->ion_auth->in_group('dosen') ) : ?>
					<input id="matkul_id" value="<?=$matkul->nama_kelas;?>" type="text" readonly="readonly" class="form-control">
				<?php endif; ?>
			</div>
			<div class="col-sm-4">
				<div class="pull-right">
          <?php if ( $this->ion_auth->is_admin() ) : ?>
					  <button type="button" onclick="reload_ajax()" class="btn btn-flat btn-sm bg-maroon"><i class="fa fa-refresh"></i> Reload</button>
          <?php else : ?>
            <button type="button" data-toggle="modal" data-target="#myModal" class="btn bg-purple btn-flat btn-sm"><i class="fa fa-plus"></i> Buat Soal</button>
  					<button type="button" onclick="reload_ajax()" class="btn btn-flat btn-sm bg-maroon"><i class="fa fa-refresh"></i> Reload</button>
          <?php endif; ?>
				</div>
			</div>
		</div>
    </div>
	<?=form_open('soal/delete', array('id'=>'bulk'))?>
    <div class="table-responsive px-4 pb-3" style="border: 0">
        <table id="soal" class="w-100 table table-striped table-bordered table-hover">
        <thead>
            <tr>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
                <th width="25">No.</th>
				<th>Dosen</th>
                <th>Jenis Soal</th>
				<th>Soal</th>
				<th>Tgl Dibuat</th>
				<th class="text-center">Aksi</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
				<th class="text-center">
					<input type="checkbox" class="select_all">
				</th>
                <th width="25">No.</th>
				<th>Dosen</th>
                <th>Jenis Soal</th>
				<th>Soal</th>
				<th>Tgl Dibuat</th>
				<th class="text-center">Aksi</th>
            </tr>
        </tfoot>
        </table>
    </div>
	<?=form_close();?>
</div>

<script src="<?=base_url()?>assets/dist/js/app/soal/data.js"></script>

<?php if ( $this->ion_auth->is_admin() ) : ?>
<script type="text/javascript">
$(document).ready(function(){
  $("#myModal").on("shown.modal.bs", function() {
    $(':input[name="banyak"]').select();
  });

	$('#matkul_filter').on('change', function(){
		let id_matkul = $(this).val();
		let src = '<?=base_url()?>soal/data';
		let url;

		if(id_matkul !== 'all'){
			let src2 = src + '/' + id_matkul;
			url = $(this).prop('checked') === true ? src : src2;
		}else{
			url = src;
		}
		table.ajax.url(url).load();
	});
});
</script>
<?php endif; ?>
<?php if ( $this->ion_auth->in_group('dosen') ) : ?>
<script type="text/javascript">
$(document).ready(function(){
	let id_matkul = '<?=$matkul->matkul_id?>';
	let id_dosen = '<?=$matkul->id_dosen?>';
	let src = '<?=base_url()?>soal/data';
	let url = src + '/' + id_matkul + '/' + id_dosen;

	table.ajax.url(url).load();
});
</script>
<?php endif; ?>
