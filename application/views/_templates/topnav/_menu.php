<nav class="navbar navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<a href="#" class="navbar-brand"><b>T</b>es <b>K</b>ompetensi <b>C</b>alon <b>G</b>uru</a>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
				<i class="fa fa-bars"></i>
			</button>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#"><?=$mhs->nama?> - <?=$mhs->nama_kelas?></a></li>
			</ul>
		</div>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						<?=$user->username?> <span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<?=base_url('logout')?>">Logout</a></li>
					</ul>
				</li>
			</ul>
        </div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
