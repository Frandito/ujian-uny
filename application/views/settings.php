<div class="box box-primary box-solid">
    <div class="box-header">
        <h3 class="box-title">
            Papan Pengumuman
        </h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="box-body">
      <?=form_open_multipart('settings/pengumuman');?>
      <div class="form-group">
          <textarea name="pengumuman" id="pengumuman" class="form-control"><?= $pengumuman->text ?></textarea>
      </div>
        <button type="submit" class="btn btn-primary btn-flat">
            <i class="fa fa-save"></i> Simpan
        </button>
      <?=form_close();?>
    </div>
</div>

<div class="box box-warning box-solid">
    <div class="box-header">
        <h3 class="box-title">
            Setting Peraturan
        </h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="box-body">
      <?=form_open_multipart('settings/peraturan');?>
      <div class="form-group">
          <textarea name="peraturan" id="peraturan" class="form-control"><?= $peraturan->text ?></textarea>
      </div>
        <button type="submit" class="btn btn-warning btn-flat">
            <i class="fa fa-save"></i> Simpan
        </button>
        <?=form_close();?>
    </div>
</div>

<div class="box box-danger collapsed-box box-solid">
    <div class="box-header">
        <h3 class="box-title">
            Kosongkan Semua Data / Table
        </h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="box-body">
        <p>
            Semua data akan dihapus kecuali akun admin.
        </p>
        <button type="button" id="truncate" class="btn btn-danger btn-flat">
            <i class="fa fa-trash"></i> Kosongkan Table
        </button>
    </div>
</div>


<script type="text/javascript">
 CKEDITOR.replace( 'pengumuman' );
 CKEDITOR.replace( 'peraturan' );
    $(document).ready(function(){

        $('#truncate').on('click', function(e){
            e.preventDefault();

            Swal({
                text: "Kosongkan Table",
                title: "Anda yakin?",
                type: "question",
                showCancelButton: true,
                cancelButtonColor: '#dd4b39'
            }).then((result) => {
                if(result.value){
                    $(this).attr('disabled', 'disabled').text('Proses...');
                    var jqxhr = $.getJSON('<?=base_url()?>settings/truncate', function(response){
                        if(response.status){
                            Swal({
                                title: "Berhasil",
                                text: "Semua table sudah dikosongkan, kecuali akun Admin pada table user.",
                                type: "success",
                            });
                        }
                    });

                    jqxhr.done(function() {
                        console.log( "ajax complete" );
                        $('#truncate').removeAttr('disabled').html('<i class="fa fa-trash"></i> Kosongkan Table');
                    });

                }
            });

        });

    });
</script>
