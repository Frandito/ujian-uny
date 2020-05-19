<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller{

   public function index()
    {
      $this->load->model('Master_model', 'master');
      $result['data'] = $this->master->getFormJurusan();
      $this->load->view('_templates/auth/_header.php', $result);
  		$this->load->view('auth/register');
  		$this->load->view('_templates/auth/_footer.php');
    }

    public function save()
    {
      $method = $this->input->post('method', true);
      $this->validasi_regis($method);

      if ($this->form_validation->run() == FALSE) {
        $data = [
          'status'	=> false,
          'errors'	=> [
            'nim' => form_error('nim'),
            'nama' => form_error('nama'),
            'email' => form_error('email'),
            'jenis_kelamin' => form_error('jenis_kelamin'),
            'jurusan' => form_error('jurusan'),
            'kelas' => form_error('kelas'),
            'univ' => form_error('univ'),
          ]
        ];
        $this->output_json($data);
      } else {
        $input = [
          'nim' 			=> $this->input->post('nim', true),
          'email' 		=> $this->input->post('email', true),
          'nama' 			=> $this->input->post('nama', true),
          'jenis_kelamin' => $this->input->post('jenis_kelamin', true),
          'kelas_id' 		=> $this->input->post('kelas', true),
          'univ' 					=> $this->input->post('univ', true),
        ];
        if ($method === 'add') {
          $action = $this->master->create('mahasiswa', $input);
        } else if ($method === 'edit') {
          $id = $this->input->post('id_mahasiswa', true);
          $action = $this->master->update('mahasiswa', $input, 'id_mahasiswa', $id);
        }

        if ($action) {
          $this->output_json(['status' => true]);
        } else {
          $this->output_json(['status' => false]);
        }
      }
    }

    public function getKelasJurusan()
    {
      $this->load->model('Master_model', 'master');
      $id = $this->input->post('id');
      $data = $this->master->getKelasByJurusan($id);
      echo json_encode($data);
    }

    public function output_json($data, $encode = true)
    {
      if ($encode) $data = json_encode($data);
      $this->output->set_content_type('application/json')->set_output($data);
    }

    public function validasi_regis($method)
  	{
      $this->load->library('form_validation'); // Load Library Ignited-Datatables
  		$this->load->model('Master_model', 'master');
  		$this->form_validation->set_error_delimiters('', '');
  		$id_mahasiswa 	= $this->input->post('id_mahasiswa', true);
  		$nim 			= $this->input->post('nim', true);
  		$email 			= $this->input->post('email', true);
  		if ($method == 'add') {
  			$u_nim = '|is_unique[mahasiswa.nim]';
  			$u_email = '|is_unique[mahasiswa.email]';
  		} else {
  			$dbdata 	= $this->master->getMahasiswaById($id_mahasiswa);
  			$u_nim		= $dbdata->nim === $nim ? "" : "|is_unique[mahasiswa.nim]";
  			$u_email	= $dbdata->email === $email ? "" : "|is_unique[mahasiswa.email]";
  		}
  		$this->form_validation->set_rules('nim', 'Nomor Peserta', 'required|numeric|trim|min_length[8]|max_length[12]' . $u_nim);
  		$this->form_validation->set_rules('nama', 'Nama', 'required|trim|min_length[3]|max_length[50]');
  		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email' . $u_email);
  		$this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required');
  		$this->form_validation->set_rules('jurusan', 'Jurusan', 'required');
  		$this->form_validation->set_rules('kelas', 'Kelas', 'required');
      $this->form_validation->set_rules('univ', 'Universitas', 'required');
  		$this->form_validation->set_message('required', 'Kolom {field} wajib diisi');
      $this->form_validation->set_message('is_unique', '{field} Sudah Terdaftar ! Gunakan data yang lain');
  	}



}
