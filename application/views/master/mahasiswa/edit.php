<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title">Form <?=$judul?></h3>
        <div class="box-tools pull-right">
            <a href="<?=base_url('mahasiswa')?>" class="btn btn-sm btn-flat btn-warning">
                <i class="fa fa-arrow-left"></i> Batal
            </a>
        </div>
    </div>
<?php
if ($mahasiswa->univ === "uny") {
  $unv = "Universitas Negeri Yogyakarta";
}elseif ($dosen->univ === "uns") {
  $unv = "Universitas Negeri Surabaya";
}elseif ($dosen->univ === "ung") {
  $unv = "Universitas Negeri Gorontalo";
}elseif ($dosen->univ === "upi") {
  $unv = "Universitas Pendidikan Indonesia";
}
 ?>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4">
                <?=form_open('mahasiswa/save', array('id'=>'mahasiswa'), array('method'=>'edit', 'id_mahasiswa'=>$mahasiswa->id_mahasiswa))?>
                    <div class="form-group">
                        <label for="nim">No. Peserta</label>
                        <input value="<?=$mahasiswa->nim?>" autofocus="autofocus" onfocus="this.select()" placeholder="Nomor Peserta" type="text" name="nim" class="form-control">
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="nama">Nama</label>
                        <input value="<?=$mahasiswa->nama?>" placeholder="Nama" type="text" name="nama" class="form-control">
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input value="<?=$mahasiswa->email?>" placeholder="Email" type="email" name="email" class="form-control">
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="jenis_kelamin">Jenis Kelamin</label>
                        <select name="jenis_kelamin" class="form-control select2">
                            <option value="">-- Pilih --</option>
                            <option <?=$mahasiswa->jenis_kelamin === "L" ? "selected" : "" ?> value="L">Laki-laki</option>
                            <option <?=$mahasiswa->jenis_kelamin === "P" ? "selected" : "" ?> value="P">Perempuan</option>
                        </select>
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="univ">Universitas</label>
                        <select id="univ" name="univ" class="form-control select2">
                            <option value="<?=$mahasiswa->univ?>" disabled selected><?=$unv?></option>
                            <option value="uny" >Universitas Negeri Yogyakarta</option>
                            <option value="uns" >Universitas Negeri Surabaya</option>
                            <option value="ung" >Universitas Negeri Gorontalo</option>
                            <option value="upi" >Universitas Pendidikan Indonesia</option>
                        </select>
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="jurusan">Jurusan</label>
                        <select id="jurusan" name="jurusan" class="form-control select2">
                            <option value="" disabled selected>-- Pilih --</option>
                            <?php foreach ($jurusan as $j) : ?>
                            <option <?=$mahasiswa->id_jurusan === $j->id_jurusan ? "selected" : "" ?> value="<?=$j->id_jurusan?>">
                                <?=$j->nama_jurusan?>
                            </option>
                            <?php endforeach ?>
                        </select>
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group">
                        <label for="kelas">Bidang Studi</label>
                        <select id="kelas" name="kelas" class="form-control select2">
                            <option value="" disabled selected>-- Pilih --</option>
                            <?php foreach ($kelas as $k) : ?>
                            <option <?=$mahasiswa->id_kelas === $k->id_kelas ? "selected" : "" ?> value="<?=$k->id_kelas?>">
                                <?=$k->nama_kelas?>
                            </option>
                            <?php endforeach ?>
                        </select>
                        <small class="help-block"></small>
                    </div>
                    <div class="form-group pull-right">
                        <button type="reset" class="btn btn-flat btn-default"><i class="fa fa-rotate-left"></i> Reset</button>
                        <button type="submit" id="submit" class="btn btn-flat bg-purple"><i class="fa fa-save"></i> Simpan</button>
                    </div>
                <?=form_close()?>
            </div>
        </div>
    </div>
</div>

<script src="<?=base_url()?>assets/dist/js/app/master/mahasiswa/edit.js"></script>
