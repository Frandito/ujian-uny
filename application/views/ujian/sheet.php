<?php
if(time() >= $soal->waktu_habis)
{
    redirect('ujian/list', 'location', 301);
}
?>
<div class="row">
    <div class="col-sm-3">
        <div class="box box-primary" style="overflow-y: scroll; height: 350px;">
            <div class="box-header with-border">
                <h3 class="box-title">Navigasi Soal</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
            <div class="box-body text-center" id="tampil_jawaban">
            </div>
        </div>
    </div>
    <div class="col-sm-9">
      <div class="alert bg-red text-center">
        <h5>Sisa Waktu</h5>
        <h4><span class="sisawaktu" data-time="<?=$soal->tgl_selesai?>"></span></h4>
      </div>

        <?=form_open('', array('id'=>'ujian'), array('id'=> $id_tes));?>
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><span class="badge bg-blue">Soal #<span id="soalke"></span> </span></h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
            <div class="box-body">
                <?=$html?>
            </div>
            <div class="box-footer text-center">
                <a class="action back btn btn-info" rel="0" onclick="return back();"><font color="black"><i class="glyphicon glyphicon-chevron-left"></i><font color="black"> Back</font></a>
                <a class="action next btn btn-info" rel="2" onclick="return next();"><font color="black"><i class="glyphicon glyphicon-chevron-right"></i> Next</font></a>
                <a class="selesai action submit btn btn-danger" onclick="return simpan_akhir();"><font color="black"><i class="glyphicon glyphicon-stop"></i> Selesai</font></a>
                <input type="hidden" name="jml_soal" id="jml_soal" value="<?=$no; ?>">
            </div>
        </div>
        <?=form_close();?>
    </div>
</div>

<script type="text/javascript">
    var base_url        = "<?=base_url(); ?>";
    var id_tes          = "<?=$id_tes; ?>";
    var widget          = $(".step");
    var total_widget    = widget.length;
</script>

<script src="<?=base_url()?>assets/dist/js/app/ujian/sheet.js"></script>
