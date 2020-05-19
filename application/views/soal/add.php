<?php if($nama_tes->jenis_nilai == 1) :
          $metd_nilai = 'Dikotomus';
      else :
          $metd_nilai = 'Politomus';
      endif;?>

<?php if($nama_tes->jenis_nilai == 1) :?>
  <div class="row">
      <div class="col-sm-12">
        <?=form_open_multipart('soal/save', array('id'=>'formsoal'), array('method'=>'add'));?>
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Soal <b><?=$nama_tes->nama_matkul?></b> (Metode Penilaian : <b><?php echo $metd_nilai; ?></b>)</h3>
              <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                      </button>
              </div>
           </div>
              <!-- Mulai Box Soal -->
              <!-- Jika Penilaian Dikotomus -->
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="form-group col-sm-12">
                            <label>Dosen (Bidang Studi)</label>
                            <input type="hidden" name="nilai_id" value="<?=$nama_tes->jenis_nilai;?>">
                            <input type="hidden" name="metode" value="d">
                            <?php if( $this->ion_auth->is_admin() ) : ?>
                            <select name="dosen_id" required="required" id="dosen_id" class="select2 form-group" style="width:100% !important">
                                <option value="" disabled selected>Pilih Instruktur</option>
                                <?php foreach ($dosen as $d) : ?>
                                    <option value="<?=$d->id_dosen;?>"><?=$d->nama_dosen?> (<?=$d->nama_kelas?>)</option>
                                <?php endforeach; ?>
                            </select>
                            <small class="help-block" style="color: #dc3545"><?=form_error('dosen_id')?></small>
                            <?php else : ?>
                            <input type="hidden" name="dosen_id" value="<?=$dosen->id_dosen;?>">
                            <input type="hidden" name="matkul_id" value="<?=$id_tes;?>">
                            <input type="text" readonly="readonly" class="form-control" value="<?=$dosen->nama_dosen; ?> (<?=$dosen->nama_kelas; ?>)">
                            <?php endif; ?>
                        </div>

                        <div class="col-sm-12">
                            <label for="soal" class="control-label">Soal</label>
                            <div class="form-group">
                                <input type="file" name="file_soal" class="form-control">
                                <small class="help-block" style="color: #dc3545"><?=form_error('file_soal')?></small>
                            </div>
                            <div class="form-group">
                                <textarea name="soal" id="soal" class="form-control"><?=set_value('soal')?></textarea>
                                <small class="help-block" style="color: #dc3545"><?=form_error('soal')?></small>
                            </div>
                        </div>

                        <!--
                            Membuat perulangan A-E
                        -->
                        <?php
                        $abjad = ['a', 'b', 'c', 'd', 'e'];
                        foreach ($abjad as $abj) :
                            $ABJ = strtoupper($abj); // Abjad Kapital
                        ?>

                        <div class="col-sm-12">
                            <label for="file">Jawaban <?= $ABJ; ?></label>
                            <div class="form-group">
                                <input type="file" name="file_<?= $abj; ?>" class="form-control">
                                <small class="help-block" style="color: #dc3545"><?=form_error('file_'.$abj)?></small>
                            </div>
                            <div class="form-group">
                                <textarea name="jawaban_<?= $abj; ?>" id="jawaban_<?= $abj; ?>" class="form-control"><?=set_value('jawaban_a')?></textarea>
                                <small class="help-block" style="color: #dc3545"><?=form_error('jawaban_'.$abj)?></small>
                            </div>
                        </div>

                        <?php endforeach; ?>

                        <div class="form-group col-sm-12">
                            <label for="jawaban" class="control-label">Kunci Jawaban</label>
                            <select required="required" name="jawaban" id="jawaban" class="form-control select2" style="width:100%!important">
                                <option value="" disabled selected>Pilih Kunci Jawaban</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                            </select>
                            <small class="help-block" style="color: #dc3545"><?=form_error('jawaban')?></small>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="bobot" class="control-label">Bobot Soal</label>
                            <input required="required" value="1" type="number" name="bobot" placeholder="Bobot Soal" id="bobot" class="form-control">
                            <small class="help-block" style="color: #dc3545"><?=form_error('bobot')?></small>
                        </div>
                        <div class="form-group pull-right">
                            <a href="<?=base_url('soal')?>" class="btn btn-flat btn-default"><i class="fa fa-arrow-left"></i> Batal</a>
                            <button type="submit" id="submit" class="btn btn-flat bg-purple"><i class="fa fa-save"></i> Simpan</button>
                        </div>
                    </div>
                </div>
            </div>
          </div>
          <?=form_close();?>
      </div>
  </div>
<?php else :  ?>
  <div class="row">
   <div class="col-sm-12">
    <?=form_open_multipart('soal/savepoli', array('id'=>'formsoal'), array('method'=>'add'));?>
      <div class="box">
        <div class="box-header with-border">
        <h3 class="box-title">Soal <b><?=$nama_tes->nama_matkul?></b> (Metode Penilaian : <b><?php echo $metd_nilai; ?></b>)</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
          </div>
        </div>
              <div class="box-body">
                  <div class="row">
                      <div class="col-sm-8 col-sm">
                          <div class="form-group col-sm-12">
                              <label>Dosen (Bidang Studi)</label>
                              <input type="hidden" name="nilai_id" value="<?=$nama_tes->jenis_nilai;?>">
                              <input type="hidden" name="metode" value="p">
                              <?php if( $this->ion_auth->is_admin() ) : ?>
                              <select name="dosen_id" required="required" id="dosen_id" class="select2 form-group" style="width:100% !important">
                                  <option value="" disabled selected>Pilih Instruktur</option>
                                  <?php foreach ($dosen as $d) : ?>
                                      <option value="<?=$d->id_matkul;?>"><?=$d->nama_dosen?> (<?=$d->nama_kelas?>)</option>
                                  <?php endforeach; ?>
                              </select>
                              <small class="help-block" style="color: #dc3545"><?=form_error('dosen_id')?></small>
                              <?php else : ?>
                              <input type="hidden" name="dosen_id" value="<?=$dosen->id_dosen;?>">
                              <input type="hidden" name="matkul_id" value="<?=$id_tes;?>">
                              <input type="text" readonly="readonly" class="form-control" value="<?=$dosen->nama_dosen; ?> (<?=$dosen->nama_kelas; ?>)">
                              <?php endif; ?>
                          </div>

                          <div class="col-sm-12">
                              <label for="soal" class="control-label">Soal</label>
                              <div class="form-group">
                                  <input type="file" name="file_soal" class="form-control">
                                  <small class="help-block" style="color: #dc3545"><?=form_error('file_soal')?></small>
                              </div>
                              <div class="form-group">
                                  <textarea name="soal" id="soal" class="form-control"><?=set_value('soal')?></textarea>
                                  <small class="help-block" style="color: #dc3545"><?=form_error('soal')?></small>
                              </div>
                          </div>

                          <!--
                              Membuat perulangan A-E
                          -->
                          <?php
                          $abjad = ['a', 'b', 'c', 'd', 'e'];
                          foreach ($abjad as $abj) :
                              $ABJ = strtoupper($abj); // Abjad Kapital
                          ?>

                          <div class="col-sm-12">
                              <label for="file">Jawaban <?= $ABJ; ?></label>
                              <div class="form-group">
                                  <input type="file" name="file_<?= $abj; ?>" class="form-control">
                                  <small class="help-block" style="color: #dc3545"><?=form_error('file_'.$abj)?></small>
                              </div>
                              <div class="form-group">
                                  <textarea name="jawaban_<?= $abj; ?>" id="jawaban_<?= $abj; ?>" class="form-control" style="height: 30px !important;"><?=set_value('jawaban_a')?></textarea>
                                  <small class="help-block" style="color: #dc3545"><?=form_error('jawaban_'.$abj)?></small>
                              </div>
                              <div class="form-group">
                                  <label for="file">Bobot Jawaban <?= $ABJ; ?></label>
                                  <input value="1" type="number" name="nilai_<?= $abj; ?>" id="nilai_<?= $abj; ?>" placeholder="Bobot Jawaban <?= $abj; ?>" class="form-control">
                              </div>
                          </div>

                          <?php endforeach; ?>

                          <div class="form-group pull-right">
                              <a href="<?=base_url('soal')?>" class="btn btn-flat btn-default"><i class="fa fa-arrow-left"></i> Batal</a>
                              <button type="submit" id="submit" class="btn btn-flat bg-purple"><i class="fa fa-save"></i> Simpan</button>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
            <?=form_close();?>
        </div>
    </div>
            <?php endif; ?>

<script>
 CKEDITOR.replace( 'soal', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });

 CKEDITOR.replace( 'jawaban_a', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });
 CKEDITOR.replace( 'jawaban_b', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });
 CKEDITOR.replace( 'jawaban_c' , {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });
 CKEDITOR.replace( 'jawaban_d', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });
 CKEDITOR.replace( 'jawaban_e', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320
    });
</script>
