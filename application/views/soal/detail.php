<?php if($soal->metode === "d") : ?>
<div class="box">
    <div class="box-header with-header">
        <h3 class="box-title">Detail Soal</h3>
        <div class="pull-right">
            <a href="<?=base_url()?>soal" class="btn btn-xs btn-flat btn-default">
                <i class="fa fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <h3 class="text-center">Soal</h3>
                <?php if(!empty($soal->file)): ?>
                    <div class="w-50">
                        <?= tampil_media('uploads/bank_soal/'.$soal->file); ?>
                    </div>
                <?php endif; ?>
                <?=$soal->soal?>
                <hr class="my-4">
                <h3 class="text-center">Jawaban</h3>

                <?php
                $abjad = ['a', 'b', 'c', 'd', 'e'];
                $benar = "<i class='fa fa-check-circle text-purple'></i>";

                foreach ($abjad as $abj) :

                    $ABJ = strtoupper($abj);
                    $opsi = 'opsi_'.$abj;
                    $file = 'file_'.$abj;
                ?>

                    <h4>Pilihan <?=$ABJ?> <?=$soal->jawaban===$ABJ?$benar:""?></h4>
                    <?=$soal->$opsi?>

                    <?php if(!empty($soal->$file)): ?>
                    <div class="w-50 mx-auto">
                        <?= tampil_media('uploads/bank_soal/'.$soal->$file); ?>
                    </div>
                    <?php endif;?>

                <?php endforeach;?>

                <hr class="my-4">
                <strong>Dibuat pada :</strong> <?=strftime("%A, %d %B %Y", date($soal->created_on))?>
                <br>
                <strong>Terkahir diupdate :</strong> <?=strftime("%A, %d %B %Y", date($soal->updated_on))?>
            </div>
        </div>
    </div>
</div>
<?php elseif ($soal->metode === "p") : ?>
  <div class="box">
      <div class="box-header with-header">
          <h3 class="box-title">Detail Soal</h3>
          <div class="pull-right">
              <a href="<?=base_url()?>soal" class="btn btn-xs btn-flat btn-default">
                  <i class="fa fa-arrow-left"></i> Kembali
              </a>
          </div>
      </div>
      <div class="box-body">
          <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                  <h3 class="text-center">Soal</h3>
                  <?php if(!empty($soal->file)): ?>
                      <div class="w-50">
                          <?= tampil_media('uploads/bank_soal/'.$soal->file); ?>
                      </div>
                  <?php endif; ?>
                  <?=$soal->soal?>
                  <hr class="my-4">
                  <h3 class="text-center">Jawaban</h3>

                  <?php
                  $abjad = ['a', 'b', 'c', 'd', 'e'];
                  $benar = "<i class='fa fa-check-circle text-purple'></i>";

                  foreach ($abjad as $abj) :

                      $ABJ = strtoupper($abj);
                      $opsi = 'opsi_'.$abj;
                      $file = 'file_'.$abj;
                      $bobot = 'bobot_'.$abj;
                  ?>

                      <h4>Pilihan <?=$ABJ?>, Bobot <?=$soal->$bobot?> <?=$soal->$bobot==="5"?$benar:""?></h4>
                      <?=$soal->$opsi?>

                      <?php if(!empty($soal->$file)): ?>
                      <div class="w-50 mx-auto">
                          <?= tampil_media('uploads/bank_soal/'.$soal->$file); ?>
                      </div>
                      <?php endif;?>

                  <?php endforeach;?>

                  <hr class="my-4">
                  <strong>Dibuat pada :</strong> <?=strftime("%A, %d %B %Y", date($soal->created_on))?>
                  <br>
                  <strong>Terkahir diupdate :</strong> <?=strftime("%A, %d %B %Y", date($soal->updated_on))?>
              </div>
          </div>
      </div>
  </div>
<?php endif;?>
