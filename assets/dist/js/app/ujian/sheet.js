$(document).ready(function () {
    var t = $('.sisawaktu');
    if (t.length) {
        sisawaktu(t.data('time'));
    }

    buka(1);
    simpan_sementara();

    widget = $(".step");
    btnnext = $(".next");
    btnback = $(".back");
    btnsubmit = $(".submit");

    $(".step, .back, .selesai").hide();
    $("#widget_1").show();
});

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}

function buka(id_widget) {
    $(".next").attr('rel', (id_widget + 1));
    $(".back").attr('rel', (id_widget - 1));
    $(".ragu_ragu").attr('rel', (id_widget));
    cek_status_ragu(id_widget);
    cek_terakhir(id_widget);

    $("#soalke").html(id_widget);

    $(".step").hide();
    $("#widget_" + id_widget).show();

    simpan();
}

function next() {
    var berikutnya = $(".next").attr('rel');
    berikutnya = parseInt(berikutnya);
    berikutnya = berikutnya > total_widget ? total_widget : berikutnya;

    $("#soalke").html(berikutnya);

    $(".next").attr('rel', (berikutnya + 1));
    $(".back").attr('rel', (berikutnya - 1));
    $(".ragu_ragu").attr('rel', (berikutnya));
    cek_status_ragu(berikutnya);
    cek_terakhir(berikutnya);

    var sudah_akhir = berikutnya == total_widget ? 1 : 0;

    $(".step").hide();
    $("#widget_" + berikutnya).show();

    if (sudah_akhir == 1) {
        $(".back").show();
        $(".next").hide();
    } else if (sudah_akhir == 0) {
        $(".next").show();
        $(".back").show();
    }

    simpan();
}

function back() {
    var back = $(".back").attr('rel');
    back = parseInt(back);
    back = back < 1 ? 1 : back;

    $("#soalke").html(back);

    $(".back").attr('rel', (back - 1));
    $(".next").attr('rel', (back + 1));
    $(".ragu_ragu").attr('rel', (back));
    cek_status_ragu(back);
    cek_terakhir(back);

    $(".step").hide();
    $("#widget_" + back).show();

    var sudah_awal = back == 1 ? 1 : 0;

    $(".step").hide();
    $("#widget_" + back).show();

    if (sudah_awal == 1) {
        $(".back").hide();
        $(".next").show();
    } else if (sudah_awal == 0) {
        $(".next").show();
        $(".back").show();
    }

    simpan();
}

function tidak_jawab() {
    var id_step = $(".ragu_ragu").attr('rel');
    var status_ragu = $("#rg_" + id_step).val();

    if (status_ragu == "N") {
        $("#rg_" + id_step).val('Y');
        $("#btn_soal_" + id_step).removeClass('btn-success');
        $("#btn_soal_" + id_step).addClass('btn-warning');

    } else {
        $("#rg_" + id_step).val('N');
        $("#btn_soal_" + id_step).removeClass('btn-warning');
        $("#btn_soal_" + id_step).addClass('btn-success');
    }

    cek_status_ragu(id_step);

    simpan();
}

function cek_status_ragu(id_soal) {
    var status_ragu = $("#rg_" + id_soal).val();

    if (status_ragu == "N") {
        $(".ragu_ragu").html('Ragu');
    } else {
        $(".ragu_ragu").html('Tidak Ragu');
    }
}

function cek_terakhir(id_soal) {
    var jml_soal = $("#jml_soal").val();
    jml_soal = (parseInt(jml_soal) - 1);

    if (jml_soal === id_soal) {
        $('.next').hide();
        $(".selesai, .back").show();
    } else {
        $('.next').show();
        $(".selesai, .back").hide();
    }
}

function simpan_sementara() {
    var f_asal = $("#ujian");
    var form = getFormData(f_asal);
    //form = JSON.stringify(form);
    var jml_soal = form.jml_soal;
    jml_soal = parseInt(jml_soal);

    var hasil_jawaban = "";
    var hasil_jawaban2 = "";
    var hasil_jawaban3 = "";
    var hasil_jawaban4 = "";
    var judul = "<div><b>Pedagogik</b></div>";
    var judul2 = "</br></br><div><b>Profesional</b></div>";
    var judul3 = "</br></br><div><b>Kepribadian</b></div>";
    var judul4 = "</br></br><div><b>Sosial</b></div>";

    for (var i = 1; i < 21; i++) {
        var idx = 'opsi_' + i;
        var idx2 = 'rg_' + i;
        var jawab = form[idx];
        var ragu = form[idx2];

        if (jawab != undefined) {
            if (ragu == "Y") {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }

                } else {
                  if (i < 10) {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            } else {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                } else {
                  if (i < 10) {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            }
        } else {
          if (i < 10) {
            hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
          }else {
            hasil_jawaban += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
          }
        }
    }

    for (var i = 21; i < 61; i++) {
        var idx = 'opsi_' + i;
        var idx2 = 'rg_' + i;
        var jawab = form[idx];
        var ragu = form[idx2];

        if (jawab != undefined) {
            if (ragu == "Y") {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }

                } else {
                  if (i < 10) {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            } else {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                } else {
                  if (i < 10) {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            }
        } else {
          if (i < 10) {
            hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
          }else {
            hasil_jawaban2 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
          }
        }
    }

    for (var i = 61; i < 91; i++) {
        var idx = 'opsi_' + i;
        var idx2 = 'rg_' + i;
        var jawab = form[idx];
        var ragu = form[idx2];

        if (jawab != undefined) {
            if (ragu == "Y") {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }

                } else {
                  if (i < 10) {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            } else {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                } else {
                  if (i < 10) {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            }
        } else {
          if (i < 10) {
            hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
          }else {
            hasil_jawaban3 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
          }
        }
    }

    for (var i = 91; i < jml_soal; i++) {
        var idx = 'opsi_' + i;
        var idx2 = 'rg_' + i;
        var jawab = form[idx];
        var ragu = form[idx2];

        if (jawab != undefined) {
            if (ragu == "Y") {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }

                } else {
                  if (i < 10) {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-warning btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            } else {
                if (jawab == "-") {
                  if (i < 10) {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                } else {
                  if (i < 10) {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
                  }else {
                    hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-success btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
                  }
                }
            }
        } else {
          if (i < 10) {
            hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">0' + (i) + "</a>";
          }else {
            hasil_jawaban4 += '<a id="btn_soal_' + (i) + '" class="btn btn-default btn_soal btn-sm" onclick="return buka(' + (i) + ');">' + (i) + "</a>";
          }
        }
    }
    $("#tampil_jawaban").html('<div id="yes"></div>' + judul + hasil_jawaban + judul2 + hasil_jawaban2 +judul3 + hasil_jawaban3 +judul4 + hasil_jawaban4);
}

function simpan() {
    simpan_sementara();
    var form = $("#ujian");

    $.ajax({
        type: "POST",
        url: base_url + "ujian/simpan_satu",
        data: form.serialize(),
        dataType: 'json',
        success: function (data) {
            // $('.ajax-loading').show();
            console.log(data);
        }
    });
}

function selesai() {
    simpan();
    ajaxcsrf();
    $.ajax({
        type: "POST",
        url: base_url + "ujian/simpan_akhir",
        data: { id: id_tes },
        beforeSend: function () {
            simpan();
            // $('.ajax-loading').show();
        },
        success: function (r) {
            console.log(r);
            if (r.status) {
                window.location.href = base_url + 'ujian/list';
            }
        }
    });
}

function waktuHabis() {
    selesai();
    alert('Waktu ujian telah habis!');
}

function simpan_akhir() {
    simpan();
    if (confirm('Yakin ingin mengakhiri tes?')) {
        selesai();
    }
}
