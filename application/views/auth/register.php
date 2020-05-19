<link rel="stylesheet" href="<?=base_url()?>assets/dist/css/AdminLTE.min.css">
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-box-body">
              <?=form_open('register/save', array('id'=>'mahasiswa'), array('method'=>'add'))?>
                  <div class="form-group">
                      <label for="nim">Nomor Peserta</label>
                      <input autofocus="autofocus" onfocus="this.select()" placeholder="Nomor Peserta" type="text" name="nim" class="form-control">
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="nama">Nama</label>
                      <input placeholder="Nama" type="text" name="nama" class="form-control">
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="email">Email</label>
                      <input placeholder="Email" type="email" name="email" class="form-control">
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="jenis_kelamin">Jenis Kelamin</label>
                      <select name="jenis_kelamin" class="form-control select2">
                          <option value="">-- Pilih --</option>
                          <option value="L">Laki-laki</option>
                          <option value="P">Perempuan</option>
                      </select>
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="univ">Universitas</label>
                      <select id="univ" name="univ" class="form-control select2">
                          <option value="" disabled selected>-- Pilih --</option>
                          <option value="uny" >Universitas Negeri Yogyakarta</option>
                          <option value="uns" >Universitas Negeri Surabaya</option>
                          <option value="ung" >Universitas Negeri Gorontalo</option>
                          <option value="upi" >Universitas Pendidikan Indonesia</option>
                      </select>
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="jurusan">Bidang Keilmuan</label>
                      <select id="jurusan" name="jurusan" class="form-control select2">
                          <option value="" disabled selected>-- Pilih --</option>
                          <?php foreach ($data as $row):?>
                                <option value="<?php echo $row['id_jurusan'];?>"><?php echo $row['nama_jurusan'];?></option>
                          <?php endforeach;?>
                      </select>
                      <small class="help-block"></small>
                  </div>
                  <div class="form-group">
                      <label for="kelas">Program Studi</label>
                      <select name="kelas" class="form-control kelas select2">
                          <option value="">-- Pilih --</option>
                      </select>
                      <small class="help-block"></small>
                  </div>
                  <div class="col-xs-4">
                      <button type="submit" id="submit" class="btn btn-lg btn-primary"><i class="fa fa-user-plus"></i> Daftar</button>
                  </div>
              <?=form_close()?>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->
<script type="text/javascript">
    $(document).ready(function(){
        ajaxcsrf();

        $('#jurusan').change(function(){
            var id=$(this).val();
            $.ajax({
                url : "<?php echo base_url();?>register/getKelasJurusan",
                method : "POST",
                data : {
                        '<?php echo $this->security->get_csrf_token_name(); ?>':'<?php echo $this->security->get_csrf_hash(); ?>',
                        id: id
                       },
                async : false,
                dataType : 'json',
                success: function(data){
                    var html = '';
                    var i;
                    for(i=0; i<data.length; i++){
                        html += '<option value="'+ data[i].id_kelas +'">'+data[i].nama_kelas+'</option>';
                    }
                    $('.kelas').html(html);

                }
            });
        });

        $('form#mahasiswa').on('submit', function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            var btn = $('#submit');
            btn.attr('disabled', 'disabled').text('Wait...');

            $.ajax({
                url: $(this).attr('action'),
                data: $(this).serialize(),
                type: 'POST',
                success: function (data) {
                    btn.removeAttr('disabled').text('Simpan');
                    if (data.status) {
                        Swal({
                            "title": "Sukses",
                            "text": "Data Berhasil disimpan",
                            "type": "success"
                        }).then((result) => {
                            if (result.value) {
                                window.location.href = base_url+'auth';
                            }
                        });
                    } else {
                        console.log(data.errors);
                        $.each(data.errors, function (key, value) {
                            $('[name="' + key + '"]').nextAll('.help-block').eq(0).text(value);
                            $('[name="' + key + '"]').closest('.form-group').addClass('has-error');
                            if (value == '') {
                                $('[name="' + key + '"]').nextAll('.help-block').eq(0).text('');
                                $('[name="' + key + '"]').closest('.form-group').removeClass('has-error').addClass('has-success');
                            }
                        });
                    }
                }
            });
        });
    });
</script>
