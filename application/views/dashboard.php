<?php if( $this->ion_auth->is_admin() ) : ?>

<div class="row">
    <?php foreach($info_box as $info) : ?>
    <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-<?=$info->box?>">
        <div class="inner">
            <h3><?=$info->total;?></h3>
            <p><?=$info->title;?></p>
        </div>
        <div class="icon">
            <i class="fa fa-<?=$info->icon?>"></i>
        </div>
        <a href="<?=base_url().strtolower($info->title);?>" class="small-box-footer">
            More info <i class="fa fa-arrow-circle-right"></i>
        </a>
        </div>
    </div>
    <?php endforeach; ?>
</div>

<?php elseif( $this->ion_auth->in_group('dosen') ) :
  if ($dosen->univ === "uny") {
    $unv = "Universitas Negeri Yogyakarta";
  }elseif ($dosen->univ === "uns") {
    $unv = "Universitas Negeri Surabaya";
  }elseif ($dosen->univ === "ung") {
    $unv = "Universitas Negeri Gorontalo";
  }elseif ($dosen->univ === "upi") {
    $unv = "Universitas Pendidikan Indonesia";
  }
  ?>
<div class="row">
    <div class="col-sm-5">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>Nama</th>
                    <td><?=$dosen->nama_dosen?></td>
                </tr>
                <tr>
                    <th>NIP</th>
                    <td><?=$dosen->nip?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?=$dosen->email?></td>
                </tr>
                <tr>
                    <th>Universitas</th>
                    <td><?php echo $unv; ?></td>
                </tr>
                <tr>
                    <th width="120px">Program Studi</th>
                    <td>
                        <?php foreach ($kelas as $k) : ?>
                          <?=$k->nama_kelas?>
                        <?php endforeach;?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-sm-7">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Pemberitahuan</h3>
            </div>
            <div class="box-body">
                <?= $pengumuman->text ?>
            </div>
        </div>
    </div>
</div>

<?php else :
  if ($mahasiswa->univ === "uny") {
    $unv = "Universitas Negeri Yogyakarta";
  }elseif ($mahasiswa->univ === "uns") {
    $unv = "Universitas Negeri Surabaya";
  }elseif ($mahasiswa->univ === "ung") {
    $unv = "Universitas Negeri Gorontalo";
  }elseif ($mahasiswa->univ === "upi") {
    $unv = "Universitas Pendidikan Indonesia";
  }
  $aa = $id_ujian->id_ujian;
  redirect(base_url() . 'ujian/token/' . $aa);

  ?>
<!-- <div class="row">
    <div class="col-sm-5">
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Informasi Akun</h3>
            </div>
            <table class="table table-hover">
                <tr>
                    <th>Nomor Peserta</th>
                    <td><?php//$mahasiswa->nim?></td>
                </tr>
                <tr>
                    <th>Nama</th>
                    <td><?php//$mahasiswa->nama?></td>
                </tr>
                <tr>
                    <th>Jenis Kelamin</th>
                    <td><?php//$mahasiswa->jenis_kelamin === 'L' ? "Laki-laki" : "Perempuan" ;?></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><?php//$mahasiswa->email?></td>
                </tr>
                <tr>
                    <th>Universitas</th>
                    <td width="250px"><?php//$unv?></td>
                </tr>
                <tr>
                    <th width="150px" >Bidang Keilmuan</th>
                    <td><?php//$mahasiswa->nama_jurusan?></td>
                </tr>
                <tr>
                    <th>Program Studi</th>
                    <td><?php//$mahasiswa->nama_kelas?></td>
                </tr>
            </table>
        </div>
        <button class="btn btn-info btn-block btn-round-lg">Konfirmasi
    </div>
    <div class="col-sm-7">
        <div class="box box-solid">
            <div class="box-header bg-purple">
                <h3 class="box-title">Tata Tertib Ujian</h3>
            </div>
            <div class="box-body">
                <?php //$pengumuman->text ?>
            </div>
        </div>
    </div>
</div> -->

<?php endif; ?>
