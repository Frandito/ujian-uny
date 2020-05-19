<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Soal_model extends CI_Model {

    public function getDataSoal($id, $dosen)
    {
        $this->datatables->select('a.id_soal, a.soal, FROM_UNIXTIME(a.created_on) as created_on, FROM_UNIXTIME(a.updated_on) as updated_on, b.nama_matkul, c.nama_dosen');
        $this->datatables->from('tb_soal a');
        $this->datatables->join('matkul b', 'b.id_matkul=a.matkul_id');
        $this->datatables->join('dosen c', 'c.id_dosen=a.dosen_id');
        if ($id!==null && $dosen===null) {
            $this->datatables->where('a.matkul_id', $id);
        }else if($id!==null && $dosen!==null){
            $this->datatables->where('a.dosen_id', $dosen);
        }
        return $this->datatables->generate();
    }

    public function getDataSoalPoli($id, $dosen)
    {
        $this->datatables->select('a.id_soal, a.soal, FROM_UNIXTIME(a.created_on) as created_on, FROM_UNIXTIME(a.updated_on) as updated_on, b.nama_matkul, c.nama_dosen');
        $this->datatables->from('tb_soal_poli a');
        $this->datatables->join('matkul b', 'b.id_matkul=a.matkul_id');
        $this->datatables->join('dosen c', 'c.id_dosen=a.dosen_id');
        if ($id!==null && $dosen===null) {
            $this->datatables->where('a.matkul_id', $id);
        }else if($id!==null && $dosen!==null){
            $this->datatables->where('a.dosen_id', $dosen);
        }
        return $this->datatables->generate();
    }

    public function getSoalById($id)
    {
        return $this->db->get_where('tb_soal', ['id_soal' => $id])->row();
    }

    public function getSoalByIdPoli($id)
    {
        return $this->db->get_where('tb_soal_poli', ['id_soal' => $id])->row();
    }

    public function getAllTes()
    {
      $this->db->select('*');
      $this->db->from('matkul');
      return $this->db->get()->result();
    }

    public function getDetailTes($id_tes)
    {
      $this->db->select('nama_matkul , jenis_nilai');
      $this->db->from('matkul');
      $this->db->where('id_matkul', $id_tes);
      return $this->db->get()->row();
    }

    public function getNilaiByIdSoal($id)
    {
      $this->db->select('id_soal, id_matkul, jenis_nilai');
      $this->db->from('tb_soal');
      $this->db->join('matkul', 'id_matkul=matkul_id');
      $this->db->where('id_soal', $id);
      return $this->db->get()->row();
    }

    public function getMatkulDosen($nip)
    {
        $this->db->select('a.matkul_id, b.id_kelas ,b.nama_kelas, a.id_dosen, a.nama_dosen');
        $this->db->join('kelas b', 'a.matkul_id=b.id_kelas');
        $this->db->from('dosen a')->where('a.nip', $nip);
        return $this->db->get()->row();
    }

    public function getAllDosen($id_tes)
    {
        $this->db->select('*');
        $this->db->from('dosen a, matkul c');
        $this->db->join('kelas b', 'a.matkul_id=b.id_kelas');
        $this->db->where('c.id_matkul', $id_tes);
        return $this->db->get()->result();
    }
}
