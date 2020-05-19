<?php
if ($mhs->univ === "uny") {
	$unv = "Universitas Negeri Yogyakarta";
}elseif ($mhs->univ === "uns") {
	$unv = "Universitas Negeri Surabaya";
}elseif ($mhs->univ === "ung") {
	$unv = "Universitas Negeri Gorontalo";
}elseif ($mhs->univ === "upi") {
	$unv = "Universitas Pendidikan Indonesia";
}
?>
<div class="row">
	<div class="col-sm-12">
			<div class="alert bg-navy text-center">
				<h4>Universitas</h4>
				<span class="d-block"> <?=$unv?></span>
			</div>
	</div>
	<div class="col-sm-3">
        <div class="alert bg-green">
					<h4>Bidang Keilmuan<i class="pull-right fa fa-graduation-cap"></i></h4>
					<span class="d-block"> <?=$mhs->nama_jurusan?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-blue">
					<h4>Program Studi<i class="pull-right fa fa-building-o"></i></h4>
					<span class="d-block"> <?=$mhs->nama_kelas?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-yellow">
            <h4>Tanggal<i class="pull-right fa fa-calendar"></i></h4>
            <span class="d-block"> <?=strftime('%A, %d %B %Y')?></span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="alert bg-red">
            <h4>Jam<i class="pull-right fa fa-clock-o"></i></h4>
            <span class="d-block"> <span class="live-clock"><?=date('H:i:s')?></span></span>
        </div>
    </div>
    <div class="col-sm-12">
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
                        <button type="button" onclick="reload_ajax()" class="btn btn-sm btn-flat bg-purple"><i class="fa fa-refresh"></i> Reload</button>
                    </div>
                </div>
            </div>
            <div class="table-responsive px-4 pb-3" style="border: 0">
                <table id="ujian" class="w-100 table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Nama Ujian</th>
												<th>Dosen</th>
                        <th>Jumlah Soal</th>
                        <th>Waktu</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>No.</th>
                        <th>Nama Ujian</th>
												<th>Dosen</th>
                        <th>Jumlah Soal</th>
                        <th>Waktu</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/ujian/list.js"></script>
